SELECT "column name here (eg. name)"
FROM "file name here (eg. employees)"
WHERE name like '%A%'

    -- Finds persons names whose first name is A.

SELECT "column name here (eg. name)"
FROM "file name here (eg. employees)"
WHERE name like '%a%'

    -- Finds persons whose names include a.

SELECT "column name here (eg. name)"
FROM "file name here (eg. employees)"
WHERE name like '%ar%'

    -- Finds person whose name includes ar continuously eg. Sara

SELECT "column name here (eg. name)"
FROM "file name here (eg. employees)"
WHERE name like '_a%'

    -- Finds person whose name includes a as second letter eg. Rahul