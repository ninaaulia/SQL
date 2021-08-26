use world;
show tables;
select * from countrylanguage;
select * from country;
select * from city;
desc country;

-- soal 1
select distinct l.Language as Bahasa, c.Region as Region
from countrylanguage l join country c on l.CountryCode = c.Code
where region = 'Western Africa';

-- soal 2
select c.name as Negara, count(ci.name) as Jumlah_Kota
from country c join city ci on c.code = ci.countrycode
where countrycode = 'IDN';

-- soal 3
select c.name as Negara, l.Language as Bahasa, l.percentage as Persentase
from countrylanguage l join country c on l.CountryCode = c.Code
where c.name = 'Indonesia'
order by 3 desc
limit 1;

-- soal 4
select continent, sum(gnp) as Total_GNP
from country
where continent like 'a%'
group by continent;

-- soal 5
select distinct ci.name as Negara, (select ci.population) as Populasi
from country c 
join city ci 
on c.code = ci.countrycode
where c.continent = 'Europe'
order by 2 desc 
limit 3;

-- soal 6
SELECT Name, IndepYear, (SELECT IndepYear FROM Country WHERE name = 'Brunei') as Brunei
FROM Country
WHERE IndepYear > (SELECT IndepYear FROM Country WHERE name =
'Brunei')
AND Continent = 'Asia';

-- soal 7
select c.name as Negara, ci.name as Ibukota, ci.population as JumlahPenduduk, c.surfacearea as LuasWilayah
from country c 
left join city ci 
on c.capital = ci.id
where c.name = 'Netherlands';

-- soal 8 
select c.name as Negara, ci.name as Ibukota, c.region as Benua, c.lifeexpectancy as UmurHarapanHidup
from country c 
inner join city ci 
on c.capital = ci.id 
where c.name like 's%' and c.continent = 'Europe' and c.lifeexpectancy is not null
order by UmurHarapanHidup desc;

select c.name as Negara, ci.name as Ibukota, c.region as Benua, c.lifeexpectancy as UmurHarapanHidup
from city ci 
left join country c 
on c.capital = ci.id 
where c.name like 's%' and c.continent = 'Europe' and c.lifeexpectancy is not null
order by UmurHarapanHidup desc;

SELECT co.Name AS Negara, c.Name as Ibukota, co.Region as Benua, co.LifeExpectancy as UmurHarapanHidup
FROM Country co
INNER JOIN City c
ON co.Capital = c.ID
WHERE co.Continent = 'Europe' and co.LifeExpectancy IS NOT Null
HAVING co.Name LIKE "S%"
ORDER BY co.LifeExpectancy desc;


