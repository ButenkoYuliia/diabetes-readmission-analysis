-- 09: 30-day readmission rate by HbA1c test result
SELECT
  A1Cresult,
  CASE
    WHEN A1Cresult = 'None' THEN 'not tested'
    WHEN A1Cresult = 'Norm' THEN 'normal'
    WHEN A1Cresult = '>7'   THEN 'elevated'
    WHEN A1Cresult = '>8'   THEN 'highly elevated'
  END AS a1c_meaning,
  COUNT(*) AS num_encounters,
  ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (), 1) AS pct_of_all,
  SUM(readmitted_30d) AS readmitted,
  ROUND(AVG(readmitted_30d) * 100, 2) AS readmission_rate_pct
FROM `medical-analytics-511709.diabetes_readmission.clean_diabetic_data`
GROUP BY A1Cresult
ORDER BY readmission_rate_pct DESC;
