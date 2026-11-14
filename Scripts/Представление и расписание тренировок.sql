CREATE OR REPLACE VIEW vw_training_schedule AS
SELECT
    tr.group_id,
    g.group_name,
    tr.training_date,
    tr.start_time,
    h.hall_name,
    tt.type_name training_type,
    tr.training_status,
    CASE
        WHEN tr.training_status = 'Проведена'
            THEN 'Тренировка состоялась'
        WHEN tr.training_status = 'Отменена'
            THEN 'Тренировка отменена'
        ELSE 'Ожидается проведение'
    END status_explanation
FROM trainings tr
JOIN `groups` g ON tr.group_id = g.group_id
JOIN halls h ON tr.hall_id = h.hall_id
JOIN training_types tt ON tr.training_type_id = tt.training_type_id;


SELECT
    group_name `Группа`,
    training_date `Дата`,
    start_time `Время`,
    hall_name `Зал`,
    training_type `Вид тренировки`,
    status_explanation `Состояние`
FROM vw_training_schedule
WHERE group_id = 1
  AND training_date BETWEEN '2025-09-01' AND '2025-09-30'
ORDER BY training_date, start_time;