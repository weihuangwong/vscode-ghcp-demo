################################################################################
# Program: Estimate treatment effects on 1978 earnings among people without a
#          high school degree
# Author: Weihuang Wong
# Date: 2026-10-19
# Inputs: data/raw/lalonde.csv
# Outputs: output/lalonde_dropout_treatment_effect_comparison.csv
# Notes: Compares covariate-adjusted OLS with 1:1 nearest-neighbor propensity-
#        score matching without replacement and a 0.2-SD logit propensity-
#        score caliper, restricted to participants without a high school
#        degree.
################################################################################

input_file <- "data/raw/lalonde.csv"
output_file <- "output/lalonde_dropout_treatment_effect_comparison.csv"

data <- read.csv(input_file, stringsAsFactors = FALSE)
required_columns <- c(
  "treat", "re78", "age", "educ", "race", "married", "nodegree", "re74", "re75"
)
missing_columns <- setdiff(required_columns, names(data))
if (length(missing_columns) > 0) {
  stop("Missing required columns: ", paste(missing_columns, collapse = ", "))
}
if (anyNA(data[required_columns])) {
  stop("Missing values found in required analysis columns.")
}
if (!all(data$treat %in% c(0, 1))) {
  stop("The treat column must contain only 0 and 1.")
}
if (!all(data$nodegree %in% c(0, 1))) {
  stop("The nodegree column must contain only 0 and 1.")
}
if (!requireNamespace("MatchIt", quietly = TRUE)) {
  stop("The MatchIt package is required. Install it with install.packages('MatchIt').")
}

subgroup <- data[data$nodegree == 1, ]
rownames(subgroup) <- as.character(seq_len(nrow(subgroup)))
treated <- subgroup[subgroup$treat == 1, "re78"]
control <- subgroup[subgroup$treat == 0, "re78"]
if (length(treated) == 0 || length(control) == 0) {
  stop("Both treatment groups must contain observations.")
}

ols_fit <- stats::lm(
  re78 ~ treat + age + educ + race + married + re74 + re75,
  data = subgroup
)
ols_summary <- summary(ols_fit)$coefficients
ols_estimate <- ols_summary["treat", "Estimate"]
ols_se <- ols_summary["treat", "Std. Error"]
ols_df <- stats::df.residual(ols_fit)
ols_critical_value <- stats::qt(0.975, ols_df)

subgroup$race <- factor(subgroup$race)
match_fit <- MatchIt::matchit(
  treat ~ age + educ + race + married + re74 + re75,
  data = subgroup,
  method = "nearest",
  distance = "glm",
  link = "linear.logit",
  ratio = 1,
  replace = FALSE,
  caliper = 0.2,
  std.caliper = TRUE
)
matched_controls <- match_fit$match.matrix[, 1]
matched_treated <- rownames(match_fit$match.matrix)[!is.na(matched_controls)]
matched_controls <- matched_controls[!is.na(matched_controls)]
if (length(matched_treated) < 2) {
  stop("Fewer than two treated-control pairs were matched; cannot estimate uncertainty.")
}
matched_differences <- subgroup[matched_treated, "re78"] -
  subgroup[matched_controls, "re78"]
matched_estimate <- mean(matched_differences)
matched_se <- stats::sd(matched_differences) / sqrt(length(matched_differences))
matched_df <- length(matched_differences) - 1

results <- data.frame(
  method = c("OLS regression-adjusted", "1:1 propensity-score matching"),
  estimate = c(ols_estimate, matched_estimate),
  standard_error = c(ols_se, matched_se),
  ci_95_lower = c(
    ols_estimate - ols_critical_value * ols_se,
    matched_estimate - stats::qt(0.975, matched_df) * matched_se
  ),
  ci_95_upper = c(
    ols_estimate + ols_critical_value * ols_se,
    matched_estimate + stats::qt(0.975, matched_df) * matched_se
  ),
  n_treated = c(length(treated), length(matched_treated)),
  n_control = c(length(control), length(matched_controls)),
  stringsAsFactors = FALSE
)

dir.create(dirname(output_file), recursive = TRUE, showWarnings = FALSE)
utils::write.csv(results, output_file, row.names = FALSE)
print(results)
