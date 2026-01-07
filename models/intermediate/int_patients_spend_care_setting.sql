SELECT
    person_id,
    CASE
        WHEN encounter_type = 'emergency department' THEN 'er'
        ELSE encounter_group
    END AS care_setting,
    SUM(allowed_amount) AS total_care_setting_spend
FROM {{ ref('stg_core__medical_claim')}}
GROUP BY 1, 2
