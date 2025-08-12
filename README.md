## 📌 Task 6 – Subqueries and Nested Queries

## 🎯 Objective
- Use subqueries in `SELECT`, `WHERE`, and `FROM` clauses, including scalar and correlated subqueries, to filter and analyze data effectively.

## 🛠 Tools
- MySQL Workbench

## 📂 Database Schema

### 1. Students
| Column     | Type           | Description           |
|------------|---------------|-----------------------|
| id         | INT (PK, AI)  | Student ID            |
| name       | VARCHAR(50)   | Student name          |
| department | VARCHAR(100)  | Department name       |
| gpa        | DECIMAL(3,2)  | Grade Point Average   |

### 2. Courses
| Column     | Type           | Description           |
|------------|---------------|-----------------------|
| id         | INT (PK, AI)  | Course ID             |
| title      | VARCHAR(50)   | Course title          |
| department | VARCHAR(50)   | Department offering   |

### 3. Enrollments
| Column     | Type           | Description           |
|------------|---------------|-----------------------|
| id         | INT (PK, AI)  | Enrollment ID         |
| student_id | INT (FK)      | Linked to Students(id)|
| course_id  | INT (FK)      | Linked to Courses(id) |
| score      | DECIMAL(5,2)  | Student's score       |

---

## Alias
- **s** is an alias for the students table, used to shorten queries.
- **c** is an alias for the courses table, used to shorten queries.
- **e** is an alias for the enrollment table, used to shorten queries. 
