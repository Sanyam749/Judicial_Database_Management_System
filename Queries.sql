-- Queries

--1. How many cases are pending, ongoing and closed ? 

SELECT case_status,
       Count(*) AS total_cases
FROM   cases
WHERE  case_status IN ( 'Pending', 'Ongoing', 'Closed' )
GROUP  BY case_status;


-- 2. How many cases are ongoing, between x to y years and more than y years (say x = 1 and y = 2 here)
	
SELECT Count(*) filter ( WHERE extract(year FROM age(CURRENT_DATE, filing_date)) BETWEEN 1 AND    2 ) AS ongoing_cases_between_x_y,
       count(*) filter ( WHERE extract(year FROM age(CURRENT_DATE, filing_date)) > 2 )                AS ongoing_cases_more_than_y
FROM   cases
WHERE  case_status = 'Ongoing';



--3. What is the gender, geographic and age wise distribution of cases?

-- gender wise
SELECT cs.gender,
       Count(DISTINCT cp.case_id) AS total_cases
FROM   case_party cp
       JOIN citizens cs
         ON cp.citizen_id = cs.citizen_id
GROUP  BY cs.gender;

--geographic (statewise)
SELECT cs.state,
       Count(DISTINCT cp.case_id) AS total_cases
FROM   case_party cp
       JOIN citizens cs
         ON cp.citizen_id = cs.citizen_id
GROUP  BY cs.state;




--agewise
SELECT CASE
         WHEN Extract(year FROM Age(CURRENT_DATE, cs.date_of_birth)) < 18 THEN
         'Under 18'
         WHEN Extract(year FROM Age(CURRENT_DATE, cs.date_of_birth)) BETWEEN 18
              AND 30
       THEN '18-30'
         WHEN Extract(year FROM Age(CURRENT_DATE, cs.date_of_birth)) BETWEEN 31
              AND 50
       THEN '31-50'
         ELSE 'Over 50'
       END                        AS age_group,
       Count(DISTINCT cp.case_id) AS total_cases
FROM   case_party cp
       JOIN citizens cs
         ON cp.citizen_id = cs.citizen_id
GROUP  BY age_group;


-- 4. Which courts have the highest conviction rate (in %) by court_id?

SELECT   c.court_id,
         Count(v.case_id) filter (WHERE v.is_guilty = true)*100.0 / count(c.case_id) AS conviction_rate
FROM     cases c natural
JOIN     verdicts v
GROUP BY c.court_id
ORDER BY conviction_rate DESC;


-- 5. Cases filed in a specific period 

SELECT *
FROM   cases
WHERE  filing_date BETWEEN '2023-01-01' AND '2023-12-31'; 


-- 6. What are the average number of hearing for civil and criminal

SELECT case_type,
       Count(*) / Count(DISTINCT case_id) AS avg_hearing
FROM   hearings
       natural JOIN verdicts
       natural JOIN cases
GROUP  BY case_type;


-- 7. What are the number of cases handled by all judges

SELECT j.judicial_service_id,
       Count(DISTINCT h.case_id) AS case_count
FROM   judge j
       JOIN hearings h
         ON j.judicial_service_id = h.judicial_service_number
GROUP  BY j.judicial_service_id
ORDER  BY case_count DESC; 


-- 8. Find cases with the most hearings and their current status – 
-- (eg like top 10/100)

SELECT c.case_id,
       Count(h.hearing_index) AS total_hearings,
       c.case_status
FROM   cases c
       LEFT JOIN hearings h
              ON c.case_id = h.case_id
GROUP  BY c.case_id,
          c.case_status
ORDER  BY total_hearings DESC
LIMIT  10;


-- 9. Crime Rate of particular state/city [as total FIRs in region / total population of that region]

SELECT 
    f.state,
    COUNT(DISTINCT f.fir_id) AS total_FIRs,
    COUNT(DISTINCT c.citizen_id) AS population,
    ROUND(
        COUNT(DISTINCT f.fir_id) * 100.0 / 
        NULLIF(COUNT(DISTINCT c.citizen_id), 0),
        3
    ) AS crime_rate
FROM 
    FIRs f
JOIN 
    citizens c ON f.state = c.state
GROUP BY 
    f.state;



-- 10. List info of all the citizen involved in a particular case with his role (here  case id = 5001)

-- For Lawyers in the case
SELECT cs.citizen_id,
       cs.NAME,
       'Lawyer' AS role_tag
FROM   citizens cs
       JOIN lawyer l
         ON cs.citizen_id = l.citizen_id
       JOIN case_attorneys ca
         ON l.licence_number = ca.licence_number
WHERE  ca.case_id = 5001
UNION
-- For Judges involved in the case (via hearings)
SELECT cs.citizen_id,
       cs.NAME,
       'Judge' AS role_tag
FROM   citizens cs
       JOIN judge j
         ON cs.citizen_id = j.citizen_id
       JOIN hearings h
         ON j.judicial_service_id = h.judicial_service_number
WHERE  h.case_id = 5001
UNION
-- For ordinary Citizens 
SELECT cs.citizen_id,
       cs.NAME,
       'Ordinary' AS role_tag
FROM   citizens cs
       JOIN case_party cp
         ON cs.citizen_id = cp.citizen_id
WHERE  cp.case_id = 5001;


-- 11. Court case load analysis by court id

SELECT court_id, court_name, COUNT(case_id) AS total_cases
FROM cases NATURAL JOIN courts
GROUP BY court_id, court_name;


-- 12. For a given citizen (say citizen_id = 17), give me the total number of FIRs, number of ongoing cases on him/her and total number of cases in which he/she is found guilty.

WITH fir
     AS (SELECT Count(*) AS total_FIRs
         FROM   firparties
         WHERE  citizen_id = 17),
     ongoing
     AS (SELECT Count(DISTINCT cp.case_id) AS ongoing_cases
         FROM   case_party cp
                JOIN cases c
                  ON cp.case_id = c.case_id
         WHERE  cp.citizen_id = 17
                AND cp.role = 'Defendant'
                AND c.case_status = 'Ongoing'),
     guilty
     AS (SELECT Count(DISTINCT cp.case_id) AS guilty_cases
         FROM   case_party cp
                JOIN cases c
                  ON cp.case_id = c.case_id
                JOIN verdicts v
                  ON c.case_id = v.case_id
         WHERE  cp.citizen_id = 17
                AND cp.role = 'Defendant'
                AND v.is_guilty = true)
SELECT fir.total_firs,
       ongoing.ongoing_cases,
       guilty.guilty_cases
FROM   fir,
       ongoing,
       guilty; 



-- 13. Analyze average case duration by court type

SELECT co.court_type 
AS outcome,
       Avg(v.decision_date - c.filing_date) :: INT AS avg_duration
FROM   cases c
       join verdicts v
         ON c.case_id = v.case_id
       join courts co
         ON c.court_id = co.court_id
GROUP  BY co.court_type


