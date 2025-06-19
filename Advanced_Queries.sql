-- Advanced/Complex Queries

--1. List the top 5 buisest courts by case workload and also show the percentage of total caseload each court is handling.

SELECT 
    c.court_id,
    c.court_name,
    c.state,
    c.district,
    COUNT(cs.case_id) AS ongoing_case_count,
    ROUND(
        (COUNT(cs.case_id) * 100.0) / 
        (SELECT COUNT(*) FROM cases WHERE status = 'Ongoing'), 
        2
    ) AS percentage_of_total
FROM courts c
JOIN cases cs ON c.court_id = cs.court_id
WHERE cs.status = 'Ongoing'
GROUP BY c.court_id, c.court_name, c.state, c.district
ORDER BY ongoing_case_count DESC
LIMIT 5;

-- 2. Make a judge workload report, in which show for each judge:
-- Number of cases handled
-- Total hearings conducted
-- Average hearings per case
	
SELECT 
    j.judge_id,
    j.judge_name,
    COUNT(cj.case_id) AS cases_handled,
    COUNT(h.hearing_id) AS total_hearings,
    ROUND(
        COUNT(h.hearing_id) * 1.0 / NULLIF(COUNT(cj.case_id), 0),
        2
    ) AS avg_hearings_per_case
FROM judges j
LEFT JOIN case_judges cj ON j.judge_id = cj.judge_id
LEFT JOIN hearings h ON j.judge_id = h.judge_id
GROUP BY j.judge_id, j.judge_name
ORDER BY cases_handled DESC;

-- 3. Case Duration Calculation
-- For each case with a verdict, calculate the number of days between filing date and verdict date. 
-- Show the top 5 longest trials.
SELECT 
    c.case_id,
    c.title,
    c.filing_date,
    v.verdict_date,
    (v.verdict_date - c.filing_date) AS trial_duration_days,
    v.result,
    v.punishment
FROM cases c
JOIN verdicts v ON c.case_id = v.case_id
ORDER BY trial_duration_days DESC
LIMIT 5;

-- 4. Find the Lawyer Success Rate
-- Lawyer Success Rate = Total number of wins (if prosecutor, then guilty; if defendant, then not guilty) / Total number of cases participated in

SELECT 
    l.lawyer_id,
    l.lawyer_name,
    COUNT(cl.case_id) AS total_cases,
    
    SUM(
        CASE 
            WHEN cl.role = 'Prosecutor' AND v.is_guilty = true THEN 1
            WHEN cl.role = 'Defendant' AND v.is_guilty = false THEN 1
            ELSE 0
        END
    ) AS total_wins,

    ROUND(
        SUM(
            CASE 
                WHEN cl.role = 'Prosecutor' AND v.is_guilty = true THEN 1
                WHEN cl.role = 'Defendant' AND v.is_guilty = false THEN 1
                ELSE 0
            END
        ) * 100.0 / NULLIF(COUNT(cl.case_id), 0),
        2
    ) AS win_rate_percent

FROM lawyers l
JOIN case_lawyers cl ON l.lawyer_id = cl.lawyer_id
JOIN verdicts v ON cl.case_id = v.case_id
GROUP BY l.lawyer_id, l.lawyer_name
ORDER BY win_rate_percent DESC, total_cases DESC;


-- 5. Repeat Offenders
-- Identify citizens who have been accused in more than one case, and show their total guilty count.

SELECT 
    cp.citizen_id,
    c.name AS citizen_name,
    COUNT(cp.case_id) AS total_accused_cases,
    SUM(CASE WHEN v.is_guilty = true THEN 1 ELSE 0 END) AS total_guilty_verdicts
FROM case_participants cp
JOIN citizens c ON cp.citizen_id = c.citizen_id
JOIN verdicts v ON cp.case_id = v.case_id
WHERE cp.role = 'Accused'
GROUP BY cp.citizen_id, c.name
HAVING COUNT(cp.case_id) > 1
ORDER BY total_guilty_verdicts DESC, total_accused_cases DESC;


-- 6. Find the court clearance rate
-- Clearance rate of a court is total number of cases solved divided by total number of cases filed

SELECT 
    ct.court_id,
    ct.court_name,
    ct.state,
    ct.district,
    COUNT(cs.case_id) AS total_cases_filed,
    COUNT(v.verdict_id) AS total_cases_resolved,
    ROUND(
        COUNT(v.verdict_id) * 100.0 / NULLIF(COUNT(cs.case_id), 0),
        2
    ) AS clearance_rate_percent
FROM courts ct
LEFT JOIN cases cs ON ct.court_id = cs.court_id
LEFT JOIN verdicts v ON cs.case_id = v.case_id
GROUP BY ct.court_id, ct.court_name, ct.state, ct.district
ORDER BY clearance_rate_percent DESC, total_cases_filed DESC;

-- 7. List all Undecided Cases Over 1 Year Old:

SELECT 
    cs.case_id,
    cs.title,
    cs.filing_date,
    cs.status,
    COUNT(h.hearing_id) AS hearing_count
FROM cases cs
LEFT JOIN verdicts v ON cs.case_id = v.case_id
JOIN hearings h ON cs.case_id = h.case_id
WHERE 
    cs.filing_date < CURRENT_DATE - INTERVAL '1 year'
    AND v.case_id IS NULL        -- No verdict
    AND cs.status = 'Ongoing'    -- Are ongoing
GROUP BY cs.case_id, cs.title, cs.filing_date, cs.status
ORDER BY cs.filing_date ASC;

