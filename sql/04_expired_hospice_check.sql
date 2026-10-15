-- 04: Encounters ending in death (11, 19, 20, 21) or hospice (13, 14)
-- These patients cannot be readmitted and are excluded from the analysis.
SELECT discharge_disposition_id, COUNT(*) AS num_encounters
FROM `medical-analytics-511709.diabetes_readmission.raw_diabetic_data`
WHERE discharge_disposition_id IN (11, 13, 14, 19, 20, 21)
GROUP BY discharge_disposition_id
ORDER BY discharge_disposition_id;
