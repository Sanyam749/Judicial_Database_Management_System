-- DDL Script for Judicial Database Management System

-- CITIZENS    
CREATE TABLE citizens (
    citizen_id INT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL, 
    date_of_birth DATE, 
    gender VARCHAR(10),     
    address TEXT,       
    district VARCHAR(100),
    state VARCHAR(100)
);

-- CITIZEN CONTACT NUMBERS   
CREATE TABLE citizen_contact (
    citizen_id INT,   
    contact_number VARCHAR(20),   
    PRIMARY KEY (citizen_id, contact_number),   
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)   
);

-- COURTS
CREATE TABLE courts (
    court_id INT PRIMARY KEY,
    court_name VARCHAR(255) NOT NULL,
    court_type VARCHAR(100) CHECK (court_type IN ('District Court', 'High Court', 'Supreme Court')),
    address TEXT,
    district VARCHAR(100),
    state VARCHAR(100)
);

-- JUDGES
CREATE TABLE judges (
    judge_id INT PRIMARY KEY,
    judge_name VARCHAR(255) NOT NULL,
    appointment_date DATE,
    court_id INT,
    FOREIGN KEY (court_id) REFERENCES courts(court_id)
);

-- LAWYERS
CREATE TABLE lawyers (
    lawyer_id INT PRIMARY KEY,
    lawyer_name VARCHAR(255) NOT NULL,
    bar_id VARCHAR(50) UNIQUE,
    experience_years INT,
    contact VARCHAR(20),
    address TEXT
);

-- CASES 
CREATE TABLE cases (
    case_id INT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    case_type VARCHAR(100) NOT NULL CHECK (case_type IN ('Civil', 'Criminal')),
    filing_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Ongoing', 'Closed')),
    court_id INT,
    FOREIGN KEY (court_id) REFERENCES courts(court_id)
);


-- CASE PARTICIPANTS 
CREATE TABLE case_participants (
    case_id INT,
    citizen_id INT,
    role VARCHAR(50) CHECK (role IN ('Complainant', 'Accused', 'Witness')),
    PRIMARY KEY (case_id, citizen_id, role),
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (citizen_id) REFERENCES citizens(citizen_id)
);

-- CASE LAWYERS 
CREATE TABLE case_lawyers (
    case_id INT,
    lawyer_id INT,
    role VARCHAR(50) CHECK (role IN ('Prosecutor', 'Defendant')),
    PRIMARY KEY (case_id, lawyer_id),
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (lawyer_id) REFERENCES lawyers(lawyer_id)
);

-- CASE JUDGES
CREATE TABLE case_judges (
    case_id INT,
    judge_id INT,
    PRIMARY KEY (case_id, judge_id),
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (judge_id) REFERENCES judges(judge_id)
);

-- HEARINGS
CREATE TABLE hearings (
    hearing_id INT PRIMARY KEY,
    case_id INT,
    hearing_date DATE NOT NULL,
    judge_id INT,
    summary TEXT,
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (judge_id) REFERENCES judges(judge_id)
);

-- EVIDENCE
CREATE TABLE evidence (
    evidence_id INT PRIMARY KEY,
    case_id INT,
    description TEXT,
    submitted_by INT, -- lawyer_id
    submission_date DATE,
    evidence_type VARCHAR(50),
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (submitted_by) REFERENCES lawyers(lawyer_id)
);

-- VERDICTS 
CREATE TABLE verdicts (
    verdict_id INT PRIMARY KEY,
    case_id INT UNIQUE,
    verdict_date DATE,
    result TEXT,
    punishment TEXT,
    remarks TEXT,
    is_guilty BOOLEAN,
    FOREIGN KEY (case_id) REFERENCES cases(case_id)
);
