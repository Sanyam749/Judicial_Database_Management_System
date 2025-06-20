# 🏛️ Judicial Database Management System

A comprehensive relational database system designed to model, store, and query detailed information about judicial processes in India. This project encapsulates entities such as citizens, courts, judges, lawyers, cases, hearings, and verdicts to simulate real-world judicial workflows with optimized and insightful SQL queries.

## 📂 Project Structure

- **DDL Script**: Defines the schema for all core entities and relationships.
- **Basic SQL Queries**: Common queries to retrieve and manage day-to-day records.
- **Advanced SQL Queries**: Insightful analytics including judge workload, case durations, clearance rates, and more.

---

## 🧱 Database Schema

The project includes the following main tables:

- `citizens`: Stores personal information about individuals.
- `citizen_contact`: Multiple contact numbers per citizen.
- `courts`: Includes all court types—District, High, and Supreme.
- `judges`: Judges assigned to courts.
- `lawyers`: Details on registered lawyers with experience and contact info.
- `cases`: Tracks all legal cases with status and type.
- `case_participants`: Citizens involved in a case as complainant, accused, or witness.
- `case_lawyers`: Lawyers handling the case (prosecution or defense).
- `case_judges`: Judges presiding over specific cases.
- `hearings`: Tracks hearing dates, summaries, and judge participation.
- `evidence`: Documents and objects submitted to the court as evidence.
- `verdicts`: Final decisions of cases, with result, punishment, and remarks.

---

## ✅ Basic SQL Queries

Example operations include:

- Listing all citizens and their contacts.
- Fetching courts by region or state.
- Retrieving judges by court.
- Getting lawyers by experience.
- Listing ongoing cases.
- Viewing participants or hearings for a case.
- Checking evidence or verdict details.
- Associating cases with lawyers and judges.

---

## 📊 Advanced SQL Analytics

This project goes beyond data storage and retrieval to provide powerful insights:

### 1. **Top 5 Busiest Courts**
By analyzing ongoing case counts and their relative percentages.

### 2. **Judge Workload Report**
Shows number of cases handled, hearings conducted, and average hearings per case.

### 3. **Longest Trials**
Displays the top 5 cases with the longest durations from filing to verdict.

### 4. **Lawyer Success Rate**
Calculates win rates based on role and verdict outcomes.

### 5. **Repeat Offenders**
Identifies citizens who have been accused in multiple cases with guilty verdicts.

### 6. **Court Clearance Rate**
Percentage of cases resolved by each court.

### 7. **Undecided Cases Over 1 Year Old**
Lists long-pending cases still marked as ongoing with at least one hearing and no verdict.

---

## 🧪 Technologies Used

- **SQL (PostgreSQL dialect)**: For DDL and DML.
- **ER Modeling Concepts**: Logical design of entities and relationships.
- **Aggregate Functions & Joins**: Used extensively in analytical queries.

---

## 💡 Learning Outcomes

- Hands-on experience designing normalized databases.
- Writing real-world queries using joins, aggregates, subqueries, and conditional logic.
- Implementing judicial workflows and reporting mechanisms in SQL.

---

## 📌 Future Improvements

- Add stored procedures for automated workflows (e.g., assigning judges).
- Introduce triggers for consistency checks (e.g., auto-closing cases with verdicts).
- Extend schema with scheduling and courtroom availability modules.

---

## 📁 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/judicial-database-system.git
