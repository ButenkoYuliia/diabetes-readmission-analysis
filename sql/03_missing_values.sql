-- 03: Share of missing values ("?") in key columns
SELECT
  COUNT(*) AS total_rows,
  ROUND(COUNTIF(race = '?') * 100 / COUNT(*), 1)              AS race_missing_pct,
  ROUND(COUNTIF(weight = '?') * 100 / COUNT(*), 1)            AS weight_missing_pct,
  ROUND(COUNTIF(payer_code = '?') * 100 / COUNT(*), 1)        AS payer_code_missing_pct,
  ROUND(COUNTIF(medical_specialty = '?') * 100 / COUNT(*), 1) AS specialty_missing_pct,
  ROUND(COUNTIF(diag_1 = '?') * 100 / COUNT(*), 2)            AS diag_1_missing_pct,
  ROUND(COUNTIF(diag_2 = '?') * 100 / COUNT(*), 2)            AS diag_2_missing_pct,
  ROUND(COUNTIF(diag_3 = '?') * 100 / COUNT(*), 2)            AS diag_3_missing_pct,
  COUNTIF(gender = 'Unknown/Invalid')                         AS gender_invalid
FROM `medical-analytics-511709.diabetes_readmission.raw_diabetic_data`;
