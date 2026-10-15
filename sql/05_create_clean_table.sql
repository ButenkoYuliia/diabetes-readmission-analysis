-- 05: Create the clean analysis table
CREATE OR REPLACE TABLE `medical-analytics-511709.diabetes_readmission.clean_diabetic_data` AS
SELECT
  * EXCEPT (weight, race, payer_code, medical_specialty, diag_1, diag_2, diag_3),

  -- categories: "?" -> 'Unknown'
  IF(race = '?', 'Unknown', race)                           AS race,
  IF(payer_code = '?', 'Unknown', payer_code)               AS payer_code,
  IF(medical_specialty = '?', 'Unknown', medical_specialty) AS medical_specialty,

  -- diagnoses: "?" -> NULL
  NULLIF(diag_1, '?') AS diag_1,
  NULLIF(diag_2, '?') AS diag_2,
  NULLIF(diag_3, '?') AS diag_3,

  -- target: readmitted within 30 days (1 = yes)
  IF(readmitted = '<30', 1, 0) AS readmitted_30d

FROM `medical-analytics-511709.diabetes_readmission.raw_diabetic_data`
WHERE gender != 'Unknown/Invalid'                                -- 3 invalid rows
  AND discharge_disposition_id NOT IN (11, 13, 14, 19, 20, 21);  -- expired / hospice
