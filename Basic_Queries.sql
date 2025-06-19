-- Basic Queries

-- 1. List all citizens
SELECT * FROM citizens;

-- 2. Get contact numbers of a particular citizen (e.g., citizen_id = 101)
SELECT contact_number 
FROM citizen_contact 
WHERE citizen_id = 101;

-- 3. List all courts in a specific state (e.g., 'Maharashtra')
SELECT * 
FROM courts 
WHERE state ILIKE 'Maharashtra';  -- ILIKE is case-insensitive in PostgreSQL

-- 4. Find all judges working in a specific court (e.g., court_id = 2)
SELECT * 
FROM judges 
WHERE court_id = 2;

-- 5. Get all lawyers with more than 10 years of experience
SELECT * 
FROM lawyers 
WHERE experience_years > 10;

-- 6. List all ongoing cases
SELECT * 
FROM cases 
WHERE status = 'Ongoing';

-- 7. Count the number of cases per court
SELECT court_id, COUNT(*) AS total_cases 
FROM cases 
GROUP BY court_id;

-- 8. Show all participants in a specific case (e.g., case_id = 2001)
SELECT c.name AS citizen_name, cp.role 
FROM case_participants cp
JOIN citizens c ON cp.citizen_id = c.citizen_id
WHERE cp.case_id = 2001;

-- 9. List all hearings scheduled on a specific date
SELECT * 
FROM hearings 
WHERE hearing_date = DATE '2025-06-20';

-- 10. Get the details of all evidence submitted in a specific case
SELECT * 
FROM evidence 
WHERE case_id = 2001;

-- 11. List all cases handled by a particular lawyer (e.g., lawyer_id = 303)
SELECT c.case_id, c.title, cl.role
FROM case_lawyers cl
JOIN cases c ON cl.case_id = c.case_id
WHERE cl.lawyer_id = 303;

-- 12. Get the verdict of a specific case (e.g., case_id = 2001)
SELECT * 
FROM verdicts 
WHERE case_id = 2001;

-- 13. Find all judges who have presided over hearings
SELECT DISTINCT j.judge_id, j.judge_name
FROM hearings h
JOIN judges j ON h.judge_id = j.judge_id;

-- 14. Show all cases that currently do not have a verdict
SELECT c.case_id, c.title
FROM cases c
LEFT JOIN verdicts v ON c.case_id = v.case_id
WHERE v.case_id IS NULL;

-- 15. Get all hearings along with case title and judge name
SELECT h.hearing_id, h.hearing_date, c.title AS case_title, j.judge_name
FROM hearings h
JOIN cases c ON h.case_id = c.case_id
JOIN judges j ON h.judge_id = j.judge_id;
