/* Write your T-SQL query statement below */
SELECT sd.student_id, sd.student_name, sj.subject_name, COUNT(ex.subject_name) AS attended_exams
FROM Students sd
CROSS JOIN Subjects sj
LEFT JOIN Examinations ex
ON sd.student_id = ex.student_id
AND ex.subject_name = sj.subject_name
GROUP BY sd.student_id, sd.student_name, sj.subject_name
ORDER BY sd.student_id, sd.student_name ASC