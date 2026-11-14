SELECT
    h.hall_name AS `Зал`,
    h.capacity AS `Вместимость`,
    CASE
        WHEN h.capacity >= ALL (
            SELECT g.max_athletes
            FROM `groups` g
        )
        THEN 'Подходит для любой группы'
        ELSE 'Подходит не для всех групп'
    END AS `Пригодность`
FROM halls h
ORDER BY h.capacity DESC, h.hall_name;