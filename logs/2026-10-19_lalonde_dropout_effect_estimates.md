# Lalonde dropout treatment effect estimates

- Restricted the analysis to observations with `nodegree == 1`, the group
  without a high school degree, because the client said the program targets
  dropouts.
- Estimated the treatment coefficient by OLS for `re78`, adjusting for age,
  education, race, marital status, and 1974/1975 earnings.
- Estimated a propensity score from the same covariates and performed 1:1
  nearest-neighbor matching without replacement with a 0.2-SD logit
  propensity-score caliper.
- Saved OLS and matching results separately at
  `output/lalonde_dropout_treatment_effect_comparison.csv`, preserving the
  prior full-sample results.
- OLS confidence intervals use the model-based standard error and residual
  degrees of freedom. The matched standard error is calculated from paired
  outcome differences; its t-based interval is conditional on the selected
  pairs and does not account for propensity-score estimation or match-selection
  uncertainty.
- Results: OLS estimate = 1082.43 (SE 944.71; n = 131 treated, 256 controls).
  Matched ATT = 666.93 (SE 1145.17; 76 matched pairs). Both 95% confidence
  intervals include zero. The output CSV was read back and validated.
