SELECT
    c.person_id,
    c.cancer_type,
    s.spend_bucket,
    s.total_spend,
    sc.care_setting,
    sc.total_care_setting_spend
FROM {{ ref('int_patients_primary_active_cancer') }} AS c
    LEFT JOIN {{ ref('int_patients_spend') }} AS s ON s.person_id = c.person_id
    LEFT JOIN {{ ref('int_patients_spend_care_setting') }} AS sc ON sc.person_id = c.person_id
