-- 02: How many patients were hospitalized 1, 2, 3 ... times
SELECT
  encounters_per_patient,
  COUNT(*) AS num_patients,
  ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (), 2) AS pct_patients
FROM (
  -- Step 1: number of encounters per patient
  SELECT patient_nbr, COUNT(*) AS encounters_per_patient
  FROM `medical-analytics-511709.diabetes_readmission.raw_diabetic_data`
  GROUP BY patient_nbr
)
-- Step 2: group patients by that number
GROUP BY encounters_per_patient
ORDER BY encounters_per_patient;
