SELECT
    COUNT(*) AS has_family_history,
    SUM(CASE WHEN "mental_health_consequence" = 'Yes' THEN 1 ELSE 0 END) AS mental_consequence,
    SUM(CASE WHEN "supervisor" = 'No' THEN 1 ELSE 0 END) AS no_supervisor_support,
    SUM(CASE WHEN "work_interfere" IN ('Often', 'Always') THEN 1 ELSE 0 END) AS high_interference
FROM {{ ref('survey') }}
WHERE "family_history" = 'Yes'
