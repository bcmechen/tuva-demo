SELECT
    person_id,
    medical_claim_id,
    claim_id, 
    claim_line_number,
    encounter_id,
    encounter_type, 
    encounter_group,
    claim_start_date,
    claim_end_date,
    paid_amount,
    allowed_amount,
    hcpcs_code
FROM {{ ref('core__medical_claim')}}
