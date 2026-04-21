--1.Total Transaction Amount per Customer
SELECT
    c.customer_name,
    SUM(t.amount) AS total_transaction_amount
FROM
    customers c
    JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY
    c.customer_name
ORDER BY
    total_transaction_amount DESC;

--2.Top customer by total Spending
SELECT
    *
FROM
    (
        SELECT
            c.customer_id,
            c.customer_name,
            SUM(t.amount) AS total_transaction
        FROM
            customers c
            JOIN transactions t ON c.customer_id = t.customer_id
        GROUP BY
            c.customer_id,
            c.customer_name
        ORDER BY
            total_transaction DESC
    )
WHERE
    ROWNUM <= 2;

--3.Monthly Transaction Analysis
SELECT
    to_char(
        transaction_date, 'MON-YYYY'
    )           AS month_year,
    SUM(amount) AS monthly_total
FROM
    transactions
GROUP BY
    to_char(
        transaction_date, 'MON-YYYY'
    )
ORDER BY
    MIN(transaction_date);

--4.Fraud detection
SELECT
    transaction_id,
    customer_id,
    amount,
    transaction_date
FROM
    transactions
WHERE
    amount > 50000
ORDER BY
    amount DESC;

--5.Customer Segmentation
SELECT
    c.customer_name,
    SUM(t.amount) AS total_amount,
    CASE
    WHEN SUM(t.amount) >= 100000 THEN
    'High Value'
    WHEN SUM(t.amount) >= 50000  THEN
    'Medium Value'
    ELSE
    'Low Value'
    END           AS customer_segment
FROM
    customers c
    JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY
    c.customer_name
ORDER BY
    total_amount DESC;
