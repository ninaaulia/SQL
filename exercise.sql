show databases;
use world;
show tables;

select * from city;
select * from countrylanguage;
select * from country;

-- tampilkan 10 negara berakhiran 'a' dibenua asia dengan ibukota ,tahun kemerdekaan dan populasi negara tersebut
select co.name as negara, ci.name as ibuKota, co.indepYear, co.population
from country co
left join city ci
on co.capital = ci.id
where co.Name like '%a' and Continent = 'Asia'
limit 10;


-- tampil kan 1 negara ditiap benua, kepala negara dan bentuk pemerintahan negara tersebut
select distinct Continent, Name, GovernmentForm, HeadOfState
from country
limit 7;


-- hitunglah jumlah negara yang menggunakan bahasa arab & english

select l.language as bahasa, count(c.name) as jumlahNegara
from country c
join countrylanguage l
on c.Code = l.CountryCode
where language = 'Arabic' or language = 'English'
group by language;

select l.language as bahasa, count(c.name) as jumlahNegara
from country c
join countrylanguage l
on c.Code = l.CountryCode
group by language
having language = 'Arabic' or language = 'English';


-- selisih populasi negara indonesia dan malaysia
select name, population from country where name = 'Indonesia'; 

select name, population from country where name = 'Malaysia';

select 212107000 - 2224400 as IvsM;

-- Using count, get the number of cities in the USA
select count(name) city
from city
where CountryCode = 'USA';

-- Find out what the population and average life expectancy for people in Argentina (ARG) is
select name, population, avg(LifeExpectancy) 
from country
where code = 'ARG';

select * from country;

-- Using IS NOT NULL, ORDER BY, LIMIT, what country has the highest life expectancy?
select name, LifeExpectancy
from country
where LifeExpectancy is not null
order by 2 desc
limit 1;

select * from countrylanguage;

-- select kode, bahasa serta percentace 'BLR' & 'BLZ' menggunakan where in
select CountryCode, Language, Percentage as persentase
from countrylanguage
where CountryCode in ('BLR', 'BLZ')
having Percentage > 5.0 ;

select * from country;

-- tampilkan persetase bahasa  > 10 untuk setiap negara yang menggunakan official language
select c.name as negara, c.continent, l.language as bahasa, l.percentage as persentase_bhs
from country c
left join countrylanguage l
on c.code = l.countrycode
where isofficial = 'T' -- T for True/ F for False
having persentase_bhs > 10.0 -- group by digunakan ketika pada select terdapat agg function
order by c.name asc
limit 30;

DESCRIBE country;
DESCRIBE city;
DESCRIBE countrylanguage;

-- the number of people speaking each language.
-- the number of people speaking each language.
SELECT Language, SUM(country.Population * l.Percentage/100) AS spekers
FROM country
INNER JOIN countrylanguage AS l ON l.countryCode = country.Code
GROUP BY l.Language;


-- the countries with population smaller than Russia but bigger than Denmark.
SELECT country.Name FROM country
JOIN country AS russia ON russia.Code = "RUS"
JOIN country AS denmark ON denmark.code = "DNK"
WHERE country.population < russia.population AND country.population > denmark.population;