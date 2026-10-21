/* Write your T-SQL query statement below */
SELECT TOP 1
    t.person_name
FROM
(
    SELECT
        turn,
        person_name,
        SUM(weight) OVER(ORDER BY turn) AS total_weight
    FROM Queue
) AS t
WHERE t.total_weight <= 1000
ORDER BY t.total_weight DESC