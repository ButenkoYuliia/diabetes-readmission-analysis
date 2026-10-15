-- 06: Validate clean table (expected 101,766 - 2,423 - 3 = 99,340 rows)
SELECT
  COUNT(*) AS total_rows,
  SUM(readmitted_30d) AS readmitted_30d_count,
  ROUND(AVG(readmitted_30d) * 100, 2) AS readmission_rate_pct
FROM `medical-analytics-511709.diabetes_readmission.clean_diabetic_data`;
