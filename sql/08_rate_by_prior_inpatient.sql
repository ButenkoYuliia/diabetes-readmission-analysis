-- 08: 30-day readmission rate by number of inpatient visits in the prior year
SELECT
  CASE
    WHEN number_inpatient >= 5 THEN '5+'
    ELSE CAST(number_inpatient AS STRING)
  END AS prior_inpatient_visits,
  COUNT(*) AS num_encounters,
  SUM(readmitted_30d) AS readmitted,
  ROUND(AVG(readmitted_30d) * 100, 2) AS readmission_rate_pct
FROM `medical-analytics-511709.diabetes_readmission.clean_diabetic_data`
GROUP BY prior_inpatient_visits
ORDER BY prior_inpatient_visits;
