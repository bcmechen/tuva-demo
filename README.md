[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![dbt logo and version](https://img.shields.io/static/v1?logo=dbt&label=dbt-version&message=1.5.x&color=orange)

# The Tuva Project Demo

## Methodology
- Cancer definition: Included any patient with a ICD-10-CM diagnosis code starting with C (Malignant Neoplasms) or D0 (Carcinoma in situ).
- Deduplication: Patients are assigned to only one cancer type bucket using the highest rank in their condition
- Limitations:
   - Per current logic, all patient spend is attributed to their most severe (highest-ranked) cancer diagnosis. In cases of multi-site malignancy or co-occurring chronic conditions, this "single-attribution" model may oversimplify the financial impact of secondary diagnoses.
   - This analysis assumes all medical claims incurred by the cohort are cancer-related. To improve accuracy in future iterations, we should implement Claim-to-Diagnosis mapping to isolate oncology-specific spend from non-related medical costs.
   - Any drugs bills are not currently reflected.

## Key Findings
- The majority of patients fall into the "Other" (non breast, lung, colorectal cancer, or melanoma) category, indicating a diverse range of cancer diagnoses across the population.
- The Breast Cancer segment demonstrates significant financial intensity, with about 40% of patients reaching the "Top 25% High Spend" tier. 
- "Office-Based" care is the leading driver of total spend across the population.

## AI Usage Log
- AI was used to validate the proposed architecture
- AI was used to generate the mapping of ICD10 codes to cancer type
- AI waas used to debug and to support for environment-specific errors encountered during the build process
- AI was used to edit, polish, and structure the sections of this README file
