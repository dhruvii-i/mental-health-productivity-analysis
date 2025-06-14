SELECT
    COUNT(*) AS open_to_interview,
    SUM(CASE WHEN "anonymity" = 'Yes' THEN 1 ELSE 0 END) AS has_anonymity,
    SUM(CASE WHEN "seek_help" = 'Yes' THEN 1 ELSE 0 END) AS seeks_help,
    SUM(CASE WHEN "work_interfere" IN ('Never', 'Rarely') THEN 1 ELSE 0 END) AS low_interference
FROM {{ ref('survey') }}
WHERE "mental_health_interview" = 'Yes'