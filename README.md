# Introduction
Dive into the data job market. Focus on Data Analyst roles.
Explore top paying jobs, in-demand skills, and find where 
high demand meets high salary.

SQL queries are found here: [project_sql](/project_sql/)

# Background
Learning SQL by following Luke Barousse's YouTube course:
[SQL for Data Analytics](https://www.youtube.com/watch?v=7mz73uXD9DA&t=14138s)

5 questions I want answered:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in-demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
- **SQL**
- **PostgreSQL**
- **VS Code**
- **Git, Github.com, and GitHub Desktop**

# Analysis
### 1. Top paying Data Analyst jobs
SQL query I used:

```
SELECT job_id,
    company_dim.name AS company_name,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE
FROM job_postings_fact
LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

Top-Paying Chart:
[1_top_paying_chart.png](assets/1_top_paying_chart.png)

# What I Learned

# Conclusions

