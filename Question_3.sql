USE team2_database;

SET @age := 35,
	@sex := 'F',
	@pregnancy_indicator := 'Y',
	@income := 2000;
    
SET @age := 17,
	@sex := 'M',
	@pregnancy_indicator := 'N',
	@income := 1000;
    
SELECT r.Plan_ID, r.Plan_Description, COUNT(i.Plan_ID) AS frequency 
FROM rt_medicaid_plan r
LEFT JOIN individual i ON r.Plan_ID = i.Plan_ID
WHERE @age >= IFNULL(r.Minimum_Age, @age) 
AND @age <= IFNULL(r.Maximum_Age, @age)
AND @sex = IFNULL(r.Sex, @sex)
AND @pregnancy_indicator = IFNULL(r.Pregnancy_Indicator, @pregnancy_indicator)
AND @income <= IFNULL(r.Maximum_Income, @income)
GROUP BY r.Plan_ID
ORDER BY frequency DESC
LIMIT 3
;