SELECT
    a.full_name 'Спортсмен',
    a.birth_date 'Дата рождения',
    g.group_name 'Группа',
    tr.full_name 'Тренер'
FROM athletes a
JOIN `groups` g ON a.group_id = g.group_id
JOIN trainers tr ON g.trainer_id = tr.trainer_id
WHERE g.group_id = 1
ORDER BY a.full_name;