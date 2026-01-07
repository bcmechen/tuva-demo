WITH cancer_diagnoses AS (
    SELECT
        person_id, 
        icd10_code,
        condition_recorded_date,
        condition_rank,
        CASE 
            WHEN icd10_code LIKE 'C50%' OR icd10_code LIKE 'D05%' THEN 'Breast'
            WHEN icd10_code LIKE 'C18%' OR icd10_code LIKE 'C19%' OR icd10_code LIKE 'C20%' OR icd10_code LIKE 'D010%' OR icd10_code LIKE 'D011%' OR icd10_code LIKE 'D012%' THEN 'Colorectal'
            WHEN icd10_code LIKE 'C34%' OR icd10_code LIKE 'D022%' THEN 'Lung'
            WHEN icd10_code LIKE 'C61%' OR icd10_code LIKE 'D075%' THEN 'Prostate'
            WHEN icd10_code LIKE 'C43%' or icd10_code LIKE 'D03%' then 'Melanoma'
            ELSE 'Other'
        END AS cancer_type,
        ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY condition_rank) AS cancer_rank
    FROM {{ ref('stg_core__condition') }}
    WHERE icd10_code LIKE 'C%'  -- malignant neoplasms
        OR icd10_code LIKE 'D0%'  -- carcinoma in situ
)
SELECT
    person_id, 
    icd10_code,
    condition_recorded_date,
    cancer_type
FROM cancer_diagnoses
-- Keep only the highest rank cancer so it's one person per row
WHERE cancer_rank = 1
