PREPARE group_athletes_query FROM
'SELECT
    full_name AS `Спортсмен`,
    birth_date AS `Дата рождения`
FROM athletes
WHERE group_id = 1
ORDER BY full_name';

EXECUTE group_athletes_query;

DEALLOCATE PREPARE group_athletes_query;