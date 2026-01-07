WITH total_spend AS (
    SELECT
        person_id,
        SUM(allowed_amount) as total_spend
    FROM {{ ref('stg_core__medical_claim')}}
    GROUP BY 1
),
ranked_spend as (
    select
        *,
        -- Divide patients into quartiles based on total spend
        NTILE(4) OVER (ORDER BY total_spend DESC) as spend_quartile
    from total_spend
)
SELECT
    person_id,
    total_spend,
    CASE 
        WHEN spend_quartile = 1 THEN 'TOP_25%_HIGH_SPEND'
        WHEN spend_quartile = 4 then 'BOTTOM_25%_LOW_SPEND'
        ELSE 'AVERAGE_SPEND'
    END AS spend_bucket
FROM ranked_spend
