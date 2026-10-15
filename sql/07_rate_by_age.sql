-- 07: 30-day readmission rate by age group
SELECT
  age,
  COUNT(*) AS num_encounters,
  SUM(readmitted_30d) AS readmitted,
  ROUND(AVG(readmitted_30d) * 100, 2) AS readmission_rate_pct
FROM `medical-analytics-511709.diabetes_readmission.clean_diabetic_data`
GROUP BY age
ORDER BY age;
