SELECT
    h.hall_name 'Зал',
    COUNT(tr.training_id) 'Количество тренировок',
    SUM(tr.duration_minutes) 'Всего минут',
    ROUND(AVG(tr.duration_minutes), 1) 'Средняя длительность'
FROM halls h
JOIN trainings tr ON tr.hall_id = h.hall_id
WHERE tr.training_date BETWEEN '2025-09-01' AND '2025-09-30'
GROUP BY h.hall_id, h.hall_name
HAVING COUNT(tr.training_id) >= 2
ORDER BY COUNT(tr.training_id) DESC, h.hall_name;