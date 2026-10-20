# Lalonde Data Codebook

## Overview

The data combines participants in the National Supported Work Demonstration
(NSW) with a comparison sample from the Population Survey of Income Dynamics
(PSID). Lalonde (1986) and Dehejia and Wahba (1999) analyzed this data.

## Dataset format

- **Observations:** 614 individuals
- **Treated:** 185
- **Control:** 429
- **Variables:** 9

## Variables

| Variable | Description |
| --- | --- |
| `treat` | Treatment assignment: `1` = treated, `0` = control. |
| `age` | Age in years. |
| `educ` | Years of schooling. |
| `race` | Race/ethnicity: Black, Hispanic, or White. Earlier versions used separate `black` and `hispan` indicator variables. |
| `married` | Marital status: `1` = married, `0` = not married. |
| `nodegree` | High school degree status: `1` = no degree, `0` = has a degree. |
| `re74` | Income in 1974, in U.S. dollars. |
| `re75` | Income in 1975, in U.S. dollars. |
| `re78` | Income in 1978, in U.S. dollars. |

## Analysis roles

- **Treatment:** `treat`
- **Outcome:** `re78`
- **Pre-treatment covariates:** `age`, `educ`, `race`, `married`, `nodegree`,
  `re74`, and `re75`

## References

- Lalonde, R. (1986). “Evaluating the econometric evaluations of training
  programs with experimental data.” *American Economic Review*, 76, 604–620.
- Dehejia, R. H., and Wahba, S. (1999). “Causal Effects in Nonexperimental
  Studies: Re-Evaluating the Evaluation of Training Programs.” *Journal of the
  American Statistical Association*, 94, 1053–1062.
