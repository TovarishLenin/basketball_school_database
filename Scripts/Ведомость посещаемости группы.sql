SELECT
    a.full_name 'Спортсмен',
    tr.training_date 'Дата',
    tr.start_time 'Время',
    tt.type_name 'Вид тренировки',
    att.attendance_status 'Статус посещения'
FROM attendance att
JOIN athletes a ON att.athlete_id = a.athlete_id
JOIN trainings tr ON att.training_id = tr.training_id
JOIN training_types tt ON tr.training_type_id = tt.training_type_id
WHERE a.group_id = 1
  AND tr.training_date BETWEEN '2025-09-01' AND '2025-09-30'
ORDER BY tr.training_date, tr.start_time, a.full_name;