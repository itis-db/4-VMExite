-- Задание 1: Агрегация с нарастающим итогом
SELECT
date,
amount,
SUM(amount) OVER (ORDER BY date) AS running_total
FROM transactions;

-- Задание 2: Сравнение со средним по группе
SELECT
id,
category,
price,
price - AVG(price) OVER (PARTITION BY category) AS deviation
FROM products;

-- Задание 3: Работа с границами окна
SELECT
log_time,
temperature,
AVG(temperature) OVER (
ORDER BY log_time
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg
FROM temperature_logs;

-- Задание 4: Поиск первого и последнего значения
SELECT
task_id,
project_id,
start_date,
FIRST_VALUE(start_date) OVER w AS first_task_date,
LAST_VALUE(start_date) OVER w AS last_task_date
FROM project_tasks
WINDOW w AS (PARTITION BY project_id ORDER BY start_date
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);