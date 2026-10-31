-- INTEGRATION OF OPERATORS...
    -- AND, OR, NOT, BETWEEN, IN, NOT IN

SELECT 'column_name (name, department, salary, age)'
FROM 'file_name (eg. employees)'
WHERE department = 'IT' AND salary > 38000;

    -- The above SQL Statement/Code specifics only the rows which satisfies both of the WHERE clause conditions (department = 'IT' AND salary > 38000).

SELECT 'column_name (name, department, salary, age)'
FROM 'file_name (eg. employees)'
WHERE department = 'IT' OR salary > 38000;

    -- The above SQL Statement specifies only the rows which satisfies any one of the WHERE clause conditions (department = 'IT' OR salary > 38000).

SELECT 'column_name (name, department, salary, age)'
FROM 'file_name (eg. employees)'
WHERE (department = 'IT' OR salart > 38000) AND age < 46;

    -- The above SQL Statement specifies only the rows which first satisfies any one of the WHERE clause inside the parentheses and then the next condition.

SELECT 'column_name (name, department, salary, age)'
FROM 'file_name (eg. employees)'
WHERE age BETWEEN 25 AND 40;
    AND department = 'IT';

    -- Filters the data to display only employees aged 25 to 40 who belong to the IT department. Anyone outside this age bracket or department is excluded.