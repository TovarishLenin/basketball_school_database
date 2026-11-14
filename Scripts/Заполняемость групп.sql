SELECT
    g.group_name 'Группа',
    ac.category_name 'Возрастная категория',
    tr.full_name 'Тренер',
    COUNT(a.athlete_id) 'Спортсменов',
    g.max_athletes 'Максимум',
    g.max_athletes - COUNT(a.athlete_id) 'Свободных мест'
FROM `groups` g
JOIN age_categories ac ON g.age_category_id = ac.age_category_id
JOIN trainers tr ON g.trainer_id = tr.trainer_id
LEFT JOIN athletes a ON a.group_id = g.group_id
GROUP BY
    g.group_id,
    g.group_name,
    ac.category_name,
    tr.full_name,
    g.max_athletes
HAVING COUNT(a.athlete_id) >= 4
ORDER BY g.group_name;