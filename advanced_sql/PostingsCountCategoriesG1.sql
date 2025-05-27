WITH job_postings_count AS (
    SELECT company_id,
        COUNT(*) AS postings_count
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT job_postings_count.company_id, 
    company_dim.name AS company_name,
    job_postings_count.postings_count,
    CASE
        WHEN postings_count < 10 THEN 'Small'
        WHEN postings_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_categories
FROM job_postings_count
LEFT JOIN company_dim ON
     job_postings_count.company_id = company_dim.company_id
ORDER BY postings_count DESC
