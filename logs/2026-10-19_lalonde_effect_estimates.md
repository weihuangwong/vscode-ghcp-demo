# Lalonde treatment effect estimates

- Read `data/raw/lalonde.csv` and checked the required columns and missingness.
- Estimated the raw treated-minus-control mean difference in `re78`.
- Estimated a propensity score using age, education, race, marital status,
  degree status, and 1974/1975 earnings; performed 1:1 nearest-neighbor
  matching without replacement with a 0.2-SD logit propensity-score caliper.
- Saved the comparison table to `output/lalonde_treatment_effect_comparison.csv`.
- Used Welch standard errors for the raw difference and the standard error of
  matched-pair outcome differences for the matched estimate; `id` was excluded
  as an identifier rather than a pre-treatment covariate.
- Results: raw difference = -635.03 (SE 677.20); matched ATT = 1770.60 (SE
  922.25), with 117 matched pairs. The matched t-based interval is conditional
  on the selected pairs and does not account for propensity-score estimation or
  match-selection uncertainty. The saved CSV was read back and validated.
