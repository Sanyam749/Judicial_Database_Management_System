--Data Insertion Statement: 

-- 1) CITIZENS
INSERT INTO citizens (citizen_id, name, address, district, state, date_of_birth, gender) VALUES
(1,  'Rahul Sharma',   '123 MG Road, Mumbai',                 'Mumbai',        'Maharashtra',      '1980-05-15', 'Male'),
(2,  'Priya Singh',    '45 Janpath, New Delhi',               'New Delhi',     'Delhi',            '1985-08-23', 'Female'),
(3,  'Anil Kumar',     '78 Brigade Road, Bengaluru',          'Bengaluru',     'Karnataka',        '1978-12-05', 'Male'),
(4,  'Sunita Patel',   '34 Anna Salai, Chennai',              'Chennai',       'Tamil Nadu',       '1990-02-14', 'Female'),
(5,  'Rakesh Gupta',   '56 Park Street, Kolkata',             'Kolkata',       'West Bengal',      '1982-07-30', 'Male'),
(6,  'Kavita Rao',     '90 Hazratganj, Lucknow',              'Lucknow',       'Uttar Pradesh',    '1975-11-20', 'Female'),
(7,  'Vikram Desai',   '12 Gandhi Maidan, Patna',             'Patna',         'Bihar',            '1988-03-11', 'Male'),
(8,  'Meera Nair',     '67 CG Road, Ahmedabad',               'Ahmedabad',     'Gujarat',          '1979-09-01', 'Female'),
(9,  'Suresh Menon',   '101 MI Road, Jaipur',                 'Jaipur',        'Rajasthan',        '1983-10-25', 'Male'),
(10, 'Aisha Khan',     '23 Sector 15, Chandigarh',            'Chandigarh',    'Punjab',           '1992-01-17', 'Female'),
(11, 'Rohit Verma',    '89 MG Road, Thiruvananthapuram',      'Thiruvananthapuram','Kerala',       '1987-06-09', 'Male'),
(12, 'Neha Joshi',     '34 Banjara Hills, Hyderabad',         'Hyderabad',     'Telangana',        '1991-04-28', 'Female'),
(13, 'Deepak Yadav',   '77 Janpath, Bhubaneswar',             'Bhubaneswar',   'Odisha',           '1984-12-12', 'Male'),
(14, 'Pooja Mehta',    '22 M.G. Road, Bhopal',                'Bhopal',        'Madhya Pradesh',   '1993-05-05', 'Female'),
(15, 'Amitabh Das',    '55 Sector 14, Gurugram',              'Gurugram',      'Haryana',          '1976-08-19', 'Male'),
(16, 'Sneha Chawla',   '18 Fontainhas, Panaji',               'Panaji',        'Goa',              '1990-12-31', 'Female'),
(17, 'Manoj Tiwari',   '44 Mall Road, Shimla',                'Shimla',        'Himachal Pradesh', '1974-07-07', 'Male'),
(18, 'Kavya Reddy',    '36 Mall Road, Dehradun',              'Dehradun',      'Uttarakhand',      '1995-11-02', 'Female'),
(19, 'Arjun Patel',    '29 Lal Chowk, Srinagar',              'Srinagar',      'Jammu & Kashmir',  '1986-03-21', 'Male'),
(20, 'Ananya Kapoor',  '101 Circular Road, Guwahati',         'Guwahati',      'Assam',            '1994-04-12', 'Female');


INSERT INTO citizens (citizen_id, name, address, district, state, date_of_birth, gender) VALUES
(21, 'Nikhil Sharma',    '45 Nehru Street, Mumbai',         'Mumbai',       'Maharashtra', '1981-06-11', 'Male'),
(22, 'Sanya Kapoor',     '67 Rajpath, Delhi',               'New Delhi',    'Delhi',       '1990-03-08', 'Female'),
(23, 'Harsh Rajput',     '12 Main Road, Jaipur',            'Jaipur',       'Rajasthan',   '1986-09-15', 'Male'),
(24, 'Divya Das',        '88 Market Road, Lucknow',         'Lucknow',      'Uttar Pradesh','1989-10-19', 'Female'),
(25, 'Aarav Malhotra',   '77 Link Road, Pune',              'Pune',         'Maharashtra', '1993-01-05', 'Male'),
(26, 'Ishita Jain',      '11 College Street, Kolkata',      'Kolkata',      'West Bengal', '1992-07-12', 'Female'),
(27, 'Rajeev Menon',     '9 Cross Street, Kochi',           'Kochi',        'Kerala',      '1984-11-23', 'Male'),
(28, 'Tanya Iyer',       '53 Residency Road, Chennai',      'Chennai',      'Tamil Nadu',  '1996-05-18', 'Female'),
(29, 'Rohan Bhatia',     '32 City Centre, Indore',          'Indore',       'Madhya Pradesh','1985-02-03','Male'),
(30, 'Simran Arora',     '7 MG Road, Amritsar',             'Amritsar',     'Punjab',      '1991-06-30', 'Female'),
(31, 'Yuvraj Singh',     '4 Lake View, Surat',              'Surat',        'Gujarat',     '1987-04-14', 'Male'),
(32, 'Bhavna Nair',      '102 Beach Road, Vizag',           'Visakhapatnam','Andhra Pradesh','1994-08-25','Female'),
(33, 'Sameer Khan',      '201 Cantonment, Secunderabad',   'Hyderabad',    'Telangana',   '1982-12-08', 'Male'),
(34, 'Naina Bedi',       '77 Ridge Road, Shimla',           'Shimla',       'Himachal Pradesh','1990-02-10','Female'),
(35, 'Gaurav Joshi',     '88 Outer Ring, Ahmedabad',        'Ahmedabad',    'Gujarat',     '1993-11-17', 'Male'),
(36, 'Preeti Verma',     '3 Residency, Bhopal',             'Bhopal',       'Madhya Pradesh','1995-09-19','Female'),
(37, 'Alok Ranjan',      '101 Industrial Area, Ranchi',     'Ranchi',       'Jharkhand',   '1983-01-01', 'Male'),
(38, 'Ritika Shah',      '45 Road No. 5, Gandhinagar',      'Gandhinagar',  'Gujarat',     '1988-07-22', 'Female'),
(39, 'Tarun Singh',      '58 Civil Lines, Kanpur',          'Kanpur',       'Uttar Pradesh','1992-12-03','Male'),
(40, 'Ira Dubey',        '16 MG Road, Siliguri',            'Siliguri',     'West Bengal', '1996-10-10', 'Female');


-- Contact numbers (one per citizen)
INSERT INTO citizen_contact_number (citizen_id, phone) VALUES
(1, '9876543210'), (2, '9123456780'), (3, '9988776655'), (4, '9876501234'),
(5, '9654321870'), (6, '9812345670'), (7, '8765432190'), (8, '9876123450'),
(9, '9988012345'), (10,'9123498765'), (11,'9811223344'), (12,'9870012345'),
(13,'9765432109'), (14,'9654012345'), (15,'9543210987'), (16,'9445123789'),
(17,'9988123456'), (18,'9875632109'), (19,'9123012345'), (20,'9001234567');

-- Emails (one per citizen)
INSERT INTO citizen_email (citizen_id, email) VALUES
(1, 'rahul.sharma@example.com'),   (2, 'priya.singh@example.com'),
(3, 'anil.kumar@example.com'),     (4, 'sunita.patel@example.com'),
(5, 'rakesh.gupta@example.com'),   (6, 'kavita.rao@example.com'),
(7, 'vikram.desai@example.com'),   (8, 'meera.nair@example.com'),
(9, 'suresh.menon@example.com'),   (10,'aisha.khan@example.com'),
(11,'rohit.verma@example.com'),    (12,'neha.joshi@example.com'),
(13,'deepak.yadav@example.com'),   (14,'pooja.mehta@example.com'),
(15,'amitabh.das@example.com'),    (16,'sneha.chawla@example.com'),
(17,'manoj.tiwari@example.com'),   (18,'kavya.reddy@example.com'),
(19,'arjun.patel@example.com'),    (20,'ananya.kapoor@example.com');

INSERT INTO courts (court_id, court_name, location, court_type) VALUES
(1, 'Supreme Court of India', 'New Delhi',    'Supreme Court'),
(2, 'Delhi High Court',        'New Delhi',    'High Court'),
(3, 'Bombay High Court',       'Mumbai',       'High Court'),
(4, 'Karnataka High Court',    'Bengaluru',    'High Court'),
(5, 'Mumbai District Court',   'Mumbai',       'District Court'),
(6, 'Delhi District Court',    'New Delhi',    'District Court');

-- ======================================
-- 3) JUDGES
-- ======================================
INSERT INTO judge (judicial_service_id, appointment_date, position, court_id, citizen_id) VALUES
(2001, '2015-06-01', 'Supreme Court Judge', 1, 1),
(2002, '2016-09-15', 'High Court Judge',    2, 2),
(2003, '2017-03-10', 'High Court Judge',    3, 3),
(2004, '2018-11-20', 'High Court Judge',    4, 4),
(2005, '2019-05-25', 'District Court Judge',5, 5),
(2006, '2020-01-30', 'District Court Judge',6, 6);

-- ======================================
-- 4) LAW FIRMS & LAWYERS
-- ======================================
-- Law firms
INSERT INTO law_firm (firm_id, firm_name) VALUES
(1, 'Lex & Co.'),
(2, 'Justice Advocates');

-- Law firm contacts
INSERT INTO law_firm_contacts (firm_id, contact_number, address) VALUES
(1, '022-23456789', '12 Legal Lane, Fort, Mumbai, Maharashtra'),
(2, '011-22334455', '34 Justice Street, New Delhi, Delhi');

-- Lawyers
INSERT INTO lawyer (licence_number, registration_date, specification, firm_id, citizen_id) VALUES
(3001, '2010-04-12', 'Criminal Law',             1, 7),
(3002, '2012-07-23', 'Civil Law',                1, 8),
(3003, '2015-09-05', 'Corporate Law',            2, 9),
(3004, '2018-01-17', 'Family Law',               2, 10),
(3005, '2020-06-30', 'Intellectual Property',    1, 11);

-- ======================================
-- 5) FIRs & FIR PARTIES
-- ======================================
INSERT INTO FIRs (fir_id, location, district, state, incident_date, crime_description) VALUES
(4001, 'Andheri',         'Mumbai',    'Maharashtra', '2024-12-01', 'Burglary at residential apartment'),
(4002, 'Connaught Place', 'New Delhi', 'Delhi',       '2025-01-15', 'Assault and grievous hurt'),
(4003, 'Koramangala',     'Bengaluru', 'Karnataka',   '2025-02-20', 'Cheque bounce under Negotiable Instruments Act');

INSERT INTO FIRparties (fir_id, citizen_id, role) VALUES
(4001, 12, 'Complainant'),
(4001, 13, 'Accused'),
(4002, 14, 'Complainant'),
(4002, 15, 'Accused'),
(4003, 16, 'Complainant'),
(4003, 17, 'Accused');

-- ======================================
-- 6) CASES & VERDICTS
-- ======================================
INSERT INTO cases (case_id, filing_date, case_status, case_type, court_id) VALUES
(5001, '2023-01-05', 'Ongoing', 'Criminal', 5),
(5002, '2022-02-01', 'Pending',     'Civil',     6),
(5003, '2021-03-01', 'Closed',      'Criminal',  2);

-- Verdict for the closed case
INSERT INTO verdicts (case_id, decision, decision_date, is_guilty) VALUES
(5003, 'Accused found guilty and sentenced to 2 years imprisonment', '2025-04-10', TRUE);

INSERT INTO cases (case_id, filing_date, case_status, case_type, court_id) VALUES
(5004, '2025-03-15', 'Ongoing', 'Criminal', 3),
(5005, '2025-03-18', 'Pending',     'Civil',    6),
(5006, '2025-03-20', 'Closed',      'Criminal', 2),
(5007, '2025-04-01', 'Ongoing', 'Family',   4),
(5008, '2025-04-05', 'Closed',     'Civil',    5);

-- One closed case verdict
INSERT INTO verdicts (case_id, decision, decision_date, is_guilty) VALUES
(5006, 'Accused acquitted due to lack of evidence', '2025-04-12', FALSE),
(5008, 'Accused found guilty and sentenced to 3 years in prison', '2025-06-12', TRUE);



-- ======================================
-- 7) EVIDENCE & SUBMISSIONS
-- ======================================
INSERT INTO evidence (evidence_id, location, evidence_type) VALUES
(6001, 'Scene of crime, Andheri',       'Fingerprint'),
(6002, 'Police Station, New Delhi',     'Document'),
(6003, 'Scene of crime, Koramangala',   'Photograph');

INSERT INTO evidence_submission (evidence_id, citizen_id, submission_date) VALUES
(6001, 12, '2025-01-02 10:30:00'),
(6002, 14, '2025-02-05 14:45:00'),
(6003, 16, '2025-02-22 09:15:00');

INSERT INTO evidence_of (evidence_id, case_id, description) VALUES
(6001, 5001, 'Latent fingerprints matched with accused'),
(6002, 5002, 'Signed agreement under dispute'),
(6003, 5003, 'Photo of cheque and signature');

-- ======================================
-- 8) HEARINGS & TESTIMONIES
-- ======================================
INSERT INTO hearings (case_id, hearing_index, date_time,           location,              next_hearing,           judicial_service_number) VALUES
(5001, 1,             '2025-03-10 11:00:00', 'Mumbai District Court','2025-04-15 11:00:00', 2005),
(5002, 1,             '2025-03-20 10:00:00', 'Delhi District Court', '2025-05-01 10:00:00', 2006),
(5003, 1,             '2025-03-15 09:30:00', 'Delhi High Court',     NULL,                   2002);

INSERT INTO testifies (case_id, hearing_index, witeness_type,     content,                                                               citizen_id) VALUES
(5001, 1,             'Eyewitness',    'Saw the accused break the lock and enter the house.',                  18),
(5002, 1,             'Expert Witness','Examined the documents and confirmed authenticity.',                  19),
(5003, 1,             'Victim',        'Received the bounced cheque from the accused.',                       20);


-- Hearings for new cases
INSERT INTO hearings VALUES
(5004, 1, '2025-04-01 10:00:00', 'Bombay High Court',     '2025-05-01 10:00:00', 2003),
(5004, 2, '2025-05-01 10:00:00', 'Bombay High Court',     '2025-06-01 10:00:00', 2003),

(5005, 1, '2025-04-02 11:00:00', 'Delhi District Court',  '2025-05-02 11:00:00', 2006),
(5005, 2, '2025-05-02 11:00:00', 'Delhi District Court',  NULL,                  2006),

(5006, 1, '2025-03-25 09:00:00', 'Delhi High Court',      NULL,                  2002),

(5007, 1, '2025-04-10 14:00:00', 'Karnataka High Court',  '2025-04-20 14:00:00', 2004),
(5007, 2, '2025-04-20 14:00:00', 'Karnataka High Court',  '2025-05-10 14:00:00', 2004),
(5007, 3, '2025-05-10 14:00:00', 'Karnataka High Court',  NULL,                  2004),

(5008, 1, '2025-04-08 12:00:00', 'Mumbai District Court', '2025-05-08 12:00:00', 2005),
(5008, 2, '2025-05-08 12:00:00', 'Mumbai District Court', NULL,                  2005);

-- Additional hearings for previous cases
INSERT INTO hearings VALUES
(5001, 2, '2025-04-15 11:00:00', 'Mumbai District Court', NULL, 2005),
(5002, 2, '2025-05-01 10:00:00', 'Delhi District Court', NULL, 2006),
(5003, 2, '2025-04-01 09:30:00', 'Delhi High Court', NULL, 2002),

-- Dummy follow-up hearings to fill up to 20
(5001, 3, '2025-05-10 10:00:00', 'Mumbai District Court', NULL, 2005),
(5004, 3, '2025-06-01 10:00:00', 'Bombay High Court', NULL, 2003),
(5007, 4, '2025-06-01 14:00:00', 'Karnataka High Court', NULL, 2004),
(5005, 3, '2025-06-01 11:00:00', 'Delhi District Court', NULL, 2006),
(5008, 3, '2025-06-01 12:00:00', 'Mumbai District Court', NULL, 2005);



-- ======================================
-- 9) CASE PARTIES & ATTORNEYS
-- ======================================
INSERT INTO case_party (case_id, citizen_id, role) VALUES
(5001, 12, 'Plaintiff'),
(5001, 13, 'Defendant'),
(5002, 14, 'Plaintiff'),
(5002, 15, 'Defendant'),
(5003, 16, 'Plaintiff'),
(5003, 17, 'Defendant');

INSERT INTO case_attorneys (case_id, licence_number, role) VALUES
(5001, 3001, 'Prosecutor'),
(5001, 3002, 'Defense'),
(5002, 3003, 'Prosecutor'),
(5002, 3004, 'Defense'),
(5003, 3001, 'Prosecutor'),
(5003, 3005, 'Defense');



