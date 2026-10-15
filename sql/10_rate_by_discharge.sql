-- 10: 30-day readmission rate by discharge destination (groups with >= 100 encounters)
SELECT
  discharge_disposition_id,
  CASE discharge_disposition_id
    WHEN 1  THEN 'home'
    WHEN 6  THEN 'home with home health service'
    WHEN 3  THEN 'skilled nursing facility (SNF)'
    WHEN 22 THEN 'rehab facility'
    WHEN 2  THEN 'another short-term hospital'
    WHEN 5  THEN 'another inpatient care institution'
    WHEN 4  THEN 'intermediate care facility'
    WHEN 7  THEN 'left against medical advice'
    WHEN 23 THEN 'long-term care hospital'
    WHEN 28 THEN 'psychiatric hospital'
    ELSE 'other / unknown'
  END AS discharge_to,
  COUNT(*) AS num_encounters,
  ROUND(AVG(readmitted_30d) * 100, 2) AS readmission_rate_pct
FROM `medical-analytics-511709.diabetes_readmission.clean_diabetic_data`
GROUP BY discharge_disposition_id
HAVING COUNT(*) >= 100
ORDER BY readmission_rate_pct DESC;
