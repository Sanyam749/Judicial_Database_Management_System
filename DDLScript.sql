--Data Definition Language(DDL) Script:

-- CITIZENS
CREATE TABLE
    citizens (
        citizen_id INT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        address TEXT,
	  district TEXT,
	  state TEXT,
        date_of_birth DATE,
        gender VARCHAR(10)
    );

CREATE TABLE
    citizen_contact_number (
        citizen_id INT REFERENCES citizens (citizen_id),
        phone VARCHAR(20), -- a citizen can have multiple contact no.
        PRIMARY KEY (citizen_id, phone)
    );

CREATE TABLE
    citizen_email (
        citizen_id INT REFERENCES citizens (citizen_id),
        email VARCHAR(255), -- a citizen can have multiple email id.
        PRIMARY KEY (citizen_id, email)
    );

CREATE TABLE courts (
    court_id INT PRIMARY KEY,
    court_name VARCHAR(255) NOT NULL,
    location TEXT, -- district name
    court_type VARCHAR(20) CHECK (court_type IN ('District Court', 'High Court', 'Supreme Court'))
); 

CREATE TABLE judge (
    judicial_service_id INT PRIMARY KEY,
    appointment_date DATE,
    position VARCHAR(100) CHECK (position IN ('Supreme Court Judge',
    'High Court Judge', 'District Court Judge')),
    court_id INT REFERENCES courts (court_id),
    citizen_id INT REFERENCES citizens (citizen_id)
);

-- LAW FIRMS & LAWYERS
CREATE TABLE
    law_firm (
        firm_id INT PRIMARY KEY,
        firm_name VARCHAR(255) NOT NULL
    );

CREATE TABLE
    law_firm_contacts (
        firm_id INT REFERENCES law_firm (firm_id),
        contact_number VARCHAR(20),
        address TEXT,
        PRIMARY KEY (firm_id, contact_number)
    );

CREATE TABLE
    lawyer (
        licence_number INT PRIMARY KEY,
        registration_date DATE,
        specification VARCHAR(255),
        firm_id INT REFERENCES law_firm (firm_id),
        citizen_id INT REFERENCES citizens (citizen_id)
    );

-- FIRs
CREATE TABLE
    FIRs (
        fir_id INT PRIMARY KEY,
        location TEXT,
	  district TEXT,
	  state TEXT,
        incident_date DATE,
        crime_description TEXT
    );

CREATE TABLE
    FIRparties (
        fir_id INT REFERENCES FIRs (fir_id),
        citizen_id INT REFERENCES citizens (citizen_id),
        role VARCHAR(50),
        PRIMARY KEY (fir_id, citizen_id)
    );

CREATE TABLE cases (
    case_id INT PRIMARY KEY,
    filing_date DATE,
    case_status VARCHAR(50) CHECK (case_status IN (
        'Pending', 
        'Ongoing', 
        'Closed'
    )),
    case_type VARCHAR(50),
    court_id INT REFERENCES courts (court_id)
);

-- VERDICTS
CREATE TABLE
    verdicts (
        case_id INT PRIMARY KEY REFERENCES cases (case_id),
        decision TEXT,
        decision_date DATE,
	  is_guilty BOOLEAN
    );

-- EVIDENCE
CREATE TABLE
    evidence (
        evidence_id INT PRIMARY KEY,
        location TEXT,
        evidence_type VARCHAR(50)
    );

CREATE TABLE
    evidence_submission (
        evidence_id INT REFERENCES evidence (evidence_id),
        citizen_id INT REFERENCES citizens (citizen_id),
        submission_date timestamp,
        PRIMARY KEY (evidence_id, citizen_id)
    );

CREATE TABLE
    evidence_of (
        evidence_id INT REFERENCES evidence (evidence_id),
        case_id INT REFERENCES cases (case_id),
        description TEXT,
        PRIMARY KEY (evidence_id, case_id)
    );

-- HEARINGS
CREATE TABLE
    hearings (
        case_id INT,
        hearing_index INT,
        date_time TIMESTAMP,
        location TEXT,
	  next_hearing TIMESTAMP,
        judicial_service_number INT REFERENCES judge (judicial_service_id),
        PRIMARY KEY (case_id, hearing_index),
        FOREIGN KEY (case_id) REFERENCES cases (case_id)
    );


-- TESTIMONIES
CREATE TABLE
    testifies (
        case_id INT,
        hearing_index INT,
        witeness_type VARCHAR(50),
        content TEXT,
        citizen_id INT REFERENCES citizens (citizen_id),
        PRIMARY KEY (case_id, hearing_index, citizen_id),
        FOREIGN KEY (case_id, hearing_index) REFERENCES hearings (case_id, hearing_index)
    );

-- CASE PARTIES
CREATE TABLE
    case_party (
        case_id INT REFERENCES cases (case_id),
        citizen_id INT REFERENCES citizens (citizen_id),
        role VARCHAR(50),
        PRIMARY KEY (case_id, citizen_id)
    );

-- CASE ATTORNEYS
CREATE TABLE
    case_attorneys (
        case_id INT REFERENCES cases (case_id),
        licence_number INT REFERENCES lawyer (licence_number),
        role VARCHAR(50),
        PRIMARY KEY (case_id, licence_number)
    );
