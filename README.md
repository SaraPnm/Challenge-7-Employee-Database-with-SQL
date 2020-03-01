# Challenge 7, Employee Database with SQL

## Project Overview

In this challenge, we will use advanced queries and joins to create a list of employees who would be good candidates for a supervisory role in a firm. These employees are the ones who are close to retirement, and the owner wants to assign them to the mentoreship roles to mentor future employees. Here is the ERD for this project info:

[Challenge 7_QuickDBD-export.png](Challenge%207_QuickDBD-export.png)

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
[retirement_info_ch7.csv](retirement_info_ch7.csv) represents the outcome of joining Employees, Salaries, and Titles tables form the input data where the retirement constraints are applied:
        -born between 1952 tp 1955
        -hired between 1985 to 1988
        -be a current employee
[retirement_info_ch7.csv](retirement_info_ch7.csv) may include some duplicate employees (similar employee numbers) with different titles. This table contains 33,118 rows.

2. Only the Most Recent Titles
[retirement_info_info_with_most_recent_date_ch7.csv](retirement_info_info_with_most_recent_date_ch7.csv) represents the revised version of [retirement_info_ch7.csv](retirement_info_ch7.csv) where the possible duplicate rows are removed (only the most recent titles are kept).
It's noteworthy to mention that partitioning based on first_name and last_name results in several duplicates, however since the employee numbers are different for these duplicate names, they're probably distinct employees that just have similar names. Thus, I partitioned my data based on emp_no which results in no duplicates. Thus the number of individuals retiring is 33,118.

[title_counts_ch7.csv](title_counts_ch7.csv) lists the frequency count of exisitng employee titles.

3. Who’s Ready for a Mentor?
[mentor_info_ch7.csv](mentor_info_ch7.csv) represents the employees eligible for being a mentor (born in 1965), a total of 1,549 employees.

Please the sql statement here: [Challenge 7.sql](Challenge%207.sql)
