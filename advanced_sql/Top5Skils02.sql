WITH job_skills AS (
    SELECT skill_id,
    COUNT(DISTINCT job_id) AS skill_count
    FROM (
        SELECT job_id, skill_id FROM skills_job_dim 
        WHERE job_id IN (
            SELECT job_id FROM job_postings_fact 
            WHERE job_title_short = 'Data Analyst'
        )
    ) AS filtered_jobs
    GROUP BY skill_id
)
SELECT js.skill_id, sd.skills, js.skill_count
FROM job_skills js
INNER JOIN skills_dim sd ON sd.skill_id = js.skill_id
ORDER BY js.skill_count DESC
LIMIT 5;
