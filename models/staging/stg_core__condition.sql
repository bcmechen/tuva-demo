SELECT
    person_id,
    condition_id,
    recorded_date AS condition_recorded_date,
    status AS condition_status,
    normalized_code AS icd10_code,
    normalized_description AS icd10_code_description,
    condition_rank
FROM {{ ref('core__condition')}}
-- Exclude icd-10-pcs
WHERE normalized_code IS NOT NULL  
