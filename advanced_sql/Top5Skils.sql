WITH job_skills AS (
    SELECT skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim
    LEFT JOIN job_postings_fact ON
        job_postings_fact.job_id = skills_job_dim.job_id
    WHERE job_title_short = 'Data Analyst'
    GROUP BY skill_id)
SELECT job_skills.skill_id,
    skills_dim.skills,
    job_skills.skill_count
FROM job_skills
INNER JOIN skills_dim ON
    skills_dim.skill_id = job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5


