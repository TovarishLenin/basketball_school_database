WITH conducted_trainings AS (
    SELECT
        training_id,
        group_id,
        training_date,
        duration_minutes
    FROM trainings
    WHERE training_status = 'Проведена'
      AND training_date BETWEEN '2025-09-01' AND '2025-09-30'
)
SELECT
    g.group_name `Группа`,
    COUNT(ct.training_id) `Проведено тренировок`,
    SUM(ct.duration_minutes)  `Всего минут`,
    MIN(ct.training_date) `Первая тренировка`,
    MAX(ct.training_date) `Последняя тренировка`
FROM `groups` g
JOIN conducted_trainings ct ON ct.group_id = g.group_id
GROUP BY g.group_id, g.group_name
HAVING COUNT(ct.training_id) >= 3
ORDER BY g.group_name;