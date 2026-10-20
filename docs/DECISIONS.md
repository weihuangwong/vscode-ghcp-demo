# Decision log

- 2026-10-19: Compare the raw treatment-control difference in `re78` with a
  propensity-score matched ATT using age, education, race, marital status,
  degree status, and 1974/1975 earnings. Use 1:1 nearest-neighbor matching
  without replacement and a 0.2-SD caliper on the logit propensity score, as
  requested. `id` is excluded because it is an identifier, not a covariate.
  Welch standard errors are used for the raw difference; the matched estimate
  uses the standard error of the matched-pair outcome differences. Its t-based
  interval is conditional on the selected pairs and does not account for
  propensity-score estimation or match-selection uncertainty.
- 2026-10-19: At the client's request, rerun the analysis for participants
  without a high school degree (`nodegree == 1`), because the program targets
  dropouts. Compare OLS adjusted for age, education, race, marital status, and
  1974/1975 earnings with 1:1 nearest-neighbor propensity-score matching using
  those same covariates, without replacement and with a 0.2-SD logit-score
  caliper. Omit `nodegree` from both models because it is constant in this
  subgroup. Save the subgroup results separately so the previous full-sample
  output is preserved. OLS uses the model-based standard error and t interval;
  matching uses the standard error of matched-pair outcome differences, with
  an interval conditional on selected pairs that does not account for
  propensity-score estimation or match-selection uncertainty.
