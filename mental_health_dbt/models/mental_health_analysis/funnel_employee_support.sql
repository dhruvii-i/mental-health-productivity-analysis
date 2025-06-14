SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN "care_options" = 'Yes' THEN 1 ELSE 0 END) AS care_options,
    SUM(CASE WHEN "seek_help" = 'Yes' THEN 1 ELSE 0 END) AS seek_help,
    SUM(CASE WHEN "work_interfere" IN ('Never', 'Rarely') THEN 1 ELSE 0 END) AS low_interference
FROM {{ ref('survey') }}