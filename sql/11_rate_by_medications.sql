-- 11: 30-day readmission rate by number of medications (polypharmacy)
SELECT
  CASE
    WHEN num_medications <= 5  THEN '01: 1-5'
    WHEN num_medications <= 10 THEN '02: 6-10'
    WHEN num_medications <= 15 THEN '03: 11-15'
    WHEN num_medications <= 20 THEN '04: 16-20'
    WHEN num_medications <= 30 THEN '05: 21-30'
    ELSE '06: 31+'
  END AS medication_group,
  COUNT(*) AS num_encounters,
  ROUND(AVG(readmitted_30d) * 100, 2) AS readmission_rate_pct
FROM `medical-analytics-511709.diabetes_readmission.clean_diabetic_data`
GROUP BY medication_group
ORDER BY medication_group;
