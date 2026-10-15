/* Write your T-SQL query statement below */

WITH CTE AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS rn
    FROM Delivery
)
SELECT
    ROUND(
        AVG(
            CASE
                WHEN order_date = customer_pref_delivery_date
                THEN 100.0
                ELSE 0
            END
        ),
        2
    ) AS immediate_percentage
FROM CTE
WHERE rn = 1;