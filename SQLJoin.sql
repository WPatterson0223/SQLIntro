/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.name, c.name
 FROM products AS p
 INNER JOIN categories AS c
 ON p.CategoryID = c.CategoryID
 WHERE c.name LIKE '%computer%';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.name, p.price, r.rating
 FROM products AS p
 INNER JOIN reviews AS r
 ON p.ProductID = r.ProductID
 WHERE r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.firstname, e.MiddleInitial, e.lastname, SUM(s.Quantity) AS Total
FROM employees AS e
JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name, c.name
FROM departments AS d
JOIN categories AS c
ON d.departmentID = c.departmentID
WHERE c.categoryID = 2 OR c.categoryID = 8;    
                      
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name, SUM(s.quantity), SUM(p.price * s.quantity)
FROM products AS p
JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE p.name = 'eagles: hotel california';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name, r.reviewer, r.rating, r.comment
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r. ProductID
WHERE p.name LIKE '%visio tv%' AND r.rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employeeID, e.firstname, e.lastname, p.name, sum(s.quantity) AS Total
FROM employees AS e
JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
JOIN products AS p
ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.productID
ORDER BY e.firstName;

