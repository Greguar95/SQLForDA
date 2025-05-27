WITH q1_postings AS (
SELECT job_postings_fact.job_id,
    skills_job_dim.skill_id,
    job_title_short,
    job_via,
    salary_year_avg,
    job_posted_date::DATE
FROM job_postings_fact
LEFT JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst' AND
    job_posted_date BETWEEN '2023-01-01' AND '2023-03-31')
SELECT job_title_short,
    job_via,
    skills_dim.skills,
    skills_dim.type,
    salary_year_avg,
    job_posted_date
FROM q1_postings
LEFT JOIN skills_dim
    ON q1_postings.skill_id = skills_dim.skill_id
ORDER BY job_posted_date DESC