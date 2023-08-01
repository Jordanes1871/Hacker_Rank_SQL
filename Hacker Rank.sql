HackerRank - My SQL - 

BASIC

/* Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA. */
select *
from city
where population > 100000
and countrycode = "USA";

/* Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. */
select name
from city
where population > 120000
and countrycode = "USA";

/* Query a list of CITY and STATE from the STATION table. */
select city, state
from station;

/* Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. */
select distinct city
from station
where ID % 2 = 0
order by city asc;

/* Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. */
select count(city)-count(distinct(city))
from station;

/* Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. */
(select city, LENGTH(city) cityLength  /*cityLength is lenght of city*/
 from station 
 order by 
 cityLength desc, /* highest value */
 city asc /* alphabetical order */
 LIMIT 1)
 
    union all
    
    (select city, LENGTH(city) cityLength  
     from station 
     order by cityLength asc, /* lowest value */
     city asc /* alphabetical order */
     LIMIT 1)
 
/* Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) */
select distinct city
from station
where substr(city,1,1) in ('a', 'e', 'i', 'o', 'u'); /* substr(column_name, start chr, len chr*/ 

select distinct city
from station
where city like '[aeiou]%';

/* Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates. */
select distinct city
from station
where substr(city, -1, 1) in ('a', 'e', 'i', 'o', 'u'); 

select distinct city
from station
where city like '%[aeiou]';

/* Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates. */
select distinct city
from station
where substr(city, 1, 1) in ('a', 'e', 'i', 'o', 'u')
and substr(city, -1, 1) in ('a', 'e', 'i', 'o', 'u');

select distinct city
from station
where city like '[aeiou]%' 
and city like '%[aeiou]';

/* Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
select distinct city
from station
where substr(city,1,1) not in ('a','e','i','o','u');

select distinct city
from station
where city not like '[a,e,i,o,u]%';

/* Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates. */
select distinct city
from station
where city not like '%[a,e,i,o,u]';

select distinct city
from station
where substr(city,-1,1) not in ('a','e','i','o','u');

/*  Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. */
select distinct city
from station
where city not like '%[aeiou]'
or city not like '[aeiou]%';

select distinct city
from station
where substr(city,1,1) not in ('a','e','i','o','u')
or substr(city,-1,1) not in ('a','e','i','o','u');

/* Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID. */
select name
from students
where marks > 75
order by right(name,3), id asc;

/* Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id. */
select name
from employee
where salary > 2000
and months < 10
order by employee_id asc;

/* Query the total population of all cities in CITY where District is California.*/
select sum(population)
from city
where district = "California";

/* Query the average population for all cities in CITY, rounded down to the nearest integer.*/
select floor(avg(population))
from city;

/* Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.*/
select ceil(avg(salary)-avg(replace(salary,"0","")))
from employees;

/* Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle. */
/* case when */
select case
when A+B <= C or A+C <= B or B+C <= A then "Not A Triangle"
when A=B and B=C then "Equilateral"
when A=B or A=C or B=C then "Isosceles"
else "Scalene"
end as triangles_type
from TRIANGLES;

/* We define an employee's total earnings to be their monthly salry time months worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as  space-separated integers. */
select months*salary, 
count(*) 
from employee
group by months*salary
order by months*salary desc
limit 1;

/* Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places. */
select round(sum(lat_n), 2),
round(sum(long_w), 2) 
from station;

/* Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
Truncate your answer to  decimal places. */
select round(sum(lat_n),4)
from station
where lat_n > 38.7880 and lat_n < 137.2345;

/* Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places. */
/* SUB QUERY */
SELECT ROUND(LONG_W, 4) 
FROM STATION 
WHERE LAT_N = (
    SELECT MAX(LAT_N) 
    FROM STATION 
    WHERE LAT_N < 137.2345);

/* Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places. */
/* SUB QUERY */
select round(long_w,4)
from station
where lat_n = (
   select min(lat_n)  
   from station
   where lat_n > 38.7780);

/* Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'. */
select sum(city.population)
from city
inner join country 
on CITY.CountryCode = COUNTRY.Code
where country.continent = "Asia";

/* Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'. */
select city.name
from city
inner join country
on CITY.CountryCode = COUNTRY.Code
where country.continent = "Africa";

/* Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer. */
select country.continent, floor(avg(city.population))
from city
inner join country
on CITY.CountryCode = COUNTRY.Code
group by country.continent;

/* Consider p1 and p2 to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points p1 and p2 and round it to a scale of  decimal places.*/
select round((max(lat_n) + max(long_w))-(min(lat_n) + (min(long_w))),4)
from station;

/* Consider p1(a,c) and p2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.*/
select round(sqrt(power(max(lat_n)-min(lat_n),2)+power(max(long_w)-min(long_w),2)),4)
from station

/* Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade 
-- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, 
use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order. */
SELECT CASE WHEN Grades.Grade < 8 THEN NULL 
ELSE Students.Name END as name, Grades.Grade, Students.Marks 
FROM Students INNER JOIN Grades 
ON Students.Marks BETWEEN Grades.Min_mark AND Grades.Max_mark
ORDER BY Grades.Grade DESC, Students.Name;

/* Generate the following two result sets:
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/
(
  SELECT CONCAT(NAME, '(', SUBSTRING(OCCUPATION, 1, 1), ')') as THETEXT, '1' as SELECTNUMBER
    FROM OCCUPATIONS
)
UNION ALL 
(
  SELECT CONCAT('There are total ', COUNT(*),' ', OCCUPATION, (IF (COUNT(*) > 1, 's',''))) as THETEXT, '2' as SELECTNUMBER
   FROM OCCUPATIONS GROUP BY OCCUPATION
)
ORDER BY SELECTNUMBER ASC, THETEXT ASC;

/* OR */
select concat(name,'(',upper(substring(occupation,1,1)),')') from occupations
order by name;

select concat("There are a total of",' ',count(occupation),' ',lower(occupation),'s',".")  from occupations
group by occupation
order by count(occupation) asc;
 
/* OR */
SELECT concat(NAME,concat("(",LEFT(occupation,1),")")) 
FROM OCCUPATIONS 
ORDER BY NAME ASC;

select CONCAT("There are a total of", " ",COUNT(occupation), " ",LCASE(occupation),"s",".")AS stat
from OCCUPATIONS
group by occupation
order by COUNT(occupation) ASC,occupation




