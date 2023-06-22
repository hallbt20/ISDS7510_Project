SELECT Pregnancy_Indicator, COUNT(Pregnancy_Indicator) AS FREQUENCY FROM individual WHERE Sex = 'F' GROUP BY Pregnancy_Indicator; 

SELECT AVG(DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0) AS avg_age FROM individual;

SELECT
    CASE
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 19 THEN 'Under 19'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 19 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 26 THEN 'Between 19 and 25'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 26 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 36 THEN 'Between 26 and 35'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 36 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 51 THEN 'Between 36 and 50'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 51 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 66 THEN 'Between 51 and 65'
        ELSE '65 and older'
    END AS age_group,
    COUNT(*) AS frequency
FROM
    individual
GROUP BY
    CASE
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 19 THEN 'Under 19'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 19 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 26 THEN 'Between 19 and 25'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 26 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 36 THEN 'Between 26 and 35'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 36 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 51 THEN 'Between 36 and 50'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 51 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 66 THEN 'Between 51 and 65'
        ELSE '65 and older'
    END;

### Would also like to add income information at some point. 