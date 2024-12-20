SELECT
    p.FirstName AS first_name,
    p.LastName AS last_name,
    p.StartDate AS start_date_as_president,
    p.EndDate AS last_date_as_president
FROM Personnel p
WHERE p.Role = 'President'
ORDER BY p.FirstName ASC, p.LastName ASC, p.StartDate ASC;

