# Challenge 7, Employee Database with SQL

## Project Overview

In this challenge, we will use advanced queries and joins to create a list of employees who would be good candidates for a supervisory role in a firm. These employees are the ones who are close to retirement, and the owner wants to assign them to the mentoreship roles to mentor future employees.

The goals of this challenge are to:

1. Use an ERD to understand relationships between SQL tables.
2. Create new tables in pgAdmin by using different joins.
3. Write basic- to intermediate-level SQL statements.
4. Export new tables to a CSV file.

## Resources
- Data Source: https://openweathermap.org/api
- Software/Apps: https://app.quickdatabasediagrams.com/
                 , pgAdmin - PostgresSQL

# Summary
1. Generate the Number of [titles] Retiring Employees
[retirement_info.csv](retirement_info.csv) represents the outcome of joining Employees, Salaries, and Titles tables form the input data where the retirement constraints are applied:
        -born between 1952 tp 1955
        -hired between 1985 to 1988
        -be a current employee
csv1 may include some duplicate employees (similar employee numbers) with different titles. This table contains 33,118 rows.

2. Only the Most Recent Titles
csv2 represents the revised version of csv1 where the possible duplicate rows are removed (only the most recent titles are kept).
It's noteworthy to mention that partitioning based on first_name and last_name results in several duplicates, however since the employee numbers are different for these duplicate names, they're probably distinct employees that just have similar names. Thus, I partitioned my data based on emp_no which results in no duplicates. Thus the number of individuals retiring is 33,118.

csv3 lists the frequency count of exisitng employee titles.

3. Who’s Ready for a Mentor?
csv4 represents the employees eligible for being a mentor (born in 1965), a total of 1,549 employees.

