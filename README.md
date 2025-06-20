# Save the README content to a markdown (.md) file

readme_content = """
# 🏛️ Judicial Database Management System

A comprehensive relational database system designed to model, store, and query detailed information about judicial processes in India. This project encapsulates entities such as citizens, courts, judges, lawyers, cases, hearings, and verdicts to simulate real-world judicial workflows with optimized and insightful SQL queries.

---

## 📂 Project Structure

- **📁 `relational_schema.pdf`**: ER diagram / relational schema visualizing table relationships.
- **📄 `ddl_script.sql`**: DDL script defining the schema for all core entities and relationships.
- **📥 `sample_inserts.sql`**: Sample data for all tables to simulate real-world records.
- **🧾 `basic_queries.sql`**: Common SQL queries to retrieve and manage day-to-day records.
- **📊 `advanced_queries.sql`**: Analytical SQL queries for insights into judicial operations.


---

## 🧱 Database Schema

The project includes the following main tables:

- `citizens`: Personal information about individuals.
- `citizen_contact`: Multiple contact numbers per citizen.
- `courts`: Details of courts across India—District, High, and Supreme.
- `judges`: Judges with court assignments.
- `lawyers`: Registered lawyers with experience and contact info.
- `cases`: Legal cases with status and type.
- `case_participants`: Citizens involved as complainant, accused, or witness.
- `case_lawyers`: Lawyers assigned to cases (prosecution/defense).
- `case_judges`: Judges presiding over cases.
- `hearings`: Tracks hearing dates and summaries.
- `evidence`: Documents/objects submitted to court.
- `verdicts`: Final case outcomes including decision, punishment, and remarks.

---

## ✅ Basic SQL Queries

Includes operations such as:

- Listing citizens and their contacts.
- Fetching courts by region.
- Finding judges by court or region.
- Listing lawyers based on experience.
- Retrieving ongoing cases.
- Viewing participants and hearings per case.
- Getting evidence and verdict information.

---

## 📊 Advanced SQL Analytics

This project provides analytical insights:

1. **Top 5 Busiest Courts**  
   Based on number of ongoing cases and their percentage.

2. **Judge Workload Report**  
   Number of cases, hearings, and average hearings per case.

3. **Longest Trials**  
   Top 5 longest cases from filing to verdict.

4. **Lawyer Success Rate**  
   Win/loss ratio by role and verdict outcome.

5. **Repeat Offenders**  
   Citizens accused in multiple guilty verdicts.

6. **Court Clearance Rate**  
   Proportion of resolved cases by court.

7. **Undecided Cases Over 1 Year Old**  
   Ongoing cases older than a year with no verdict.

---

## 🧪 Technologies Used

- **SQL (PostgreSQL dialect)**: Schema and queries.
- **ER Modeling**: Entity and relationship design.
- **Advanced SQL Features**: Aggregates, joins, subqueries, and constraints.

---

## 💡 Learning Outcomes

- Practical experience in designing normalized relational databases.
- Writing real-world SQL queries with advanced logic.
- Simulating judicial system workflows and reporting mechanisms in SQL.

