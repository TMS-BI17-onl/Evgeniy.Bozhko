--Task 2
SELECT TOP 1000000 t1.first_name, t2.last_name
FROM mock_data t1
CROSS JOIN mock_data t2

/*Task 3
We can use CTE: 
- to refer many times to the same data,
- to use temporary data with operators SELECT, INSERT, UPDATE, DELETE (for example to insert generated data into our new database),
- to work more comfortable with views,
- to create recursive queries.

The difference between the subquery and CTE: the subquery is slower than CTE, because the subquery is repeated for each row that match to the main query.
*/