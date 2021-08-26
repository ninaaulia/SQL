show databases;
use world;
show tables;

-- 1.tampil kan seluruh bahasa yang digunakan diregion afrika barat
select  Language as Bahasa, Region
from countrylanguage l
left join country c
on l.countrycode = c.code
where Region = 'Western Africa';

-- 2. tampilkan total jumlah kota di indonesia
SELECT c.name AS Negara, count(ct.name) AS Jumlah_Kota
FROM country c
INNER JOIN city ct
ON ct.countrycode = c.code
GROUP BY c.name
HAVING c.name = 'Indonesia';


-- 3. tampilkan bahasa dengan persentase penggunaan paling besar diindonesia
select c.Name as negara,  l.Language as bahasa, l.Percentage as persentase
from country c
left join countrylanguage l
on  c.Code = l.CountryCode
where Language ='Javanese';


-- 4. tampilkan total GNP tiap continent yang berawalan huruf 'A' dan diurutkan dari total GNP yang terbesar
select Continent, GNP as total_GNP
from country
where Continent like 'A%'
order by GNP desc;


-- 5 tampilkan 3 kota dieropa dengan populasi terbanyak
select * from country;
select * from city;

select ci.Name as nama, ci.Population as populasi
from city ci
inner join country co
on ci.ID = co.Code
where co.Continent = 'Europe';

-- 6. negara diasia yang tahun merdekanya sebelum brunei
select Name, IndepYear
from country
where IndepYear > (select IndepYear from country where name = 'Brunei')
and Continent = 'Asia';

-- 7