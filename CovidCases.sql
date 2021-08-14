select * from cd
order by 3,4;

select * from cv
order by 3,4;

select location, date, total_cases, new_cases , total_deaths, population
from cd
order by 1,2;

--Looking at Total cases vs total deaths
select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
from cd;


--Looking at total cases vs total deaths in India
select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
from cd
where location = 'india'
order by 1,2;
--The death_cases/total_cases has got to 1.33% on 13/08/2021, that is out of 10,000 cases 133 people have died.

--Looking at what population of India had covid
select location,date, total_cases,population, (total_cases/population)*100 as InfectionRate
from cd
where location = 'india'
order by 1,2;
--till 13/08/2021 2.32% population of India have been infected with covid19, i.e. 3,21,17,826 cases have been reported.

--Looking at Countries with Highest Infection Rate compared to Population
select location, max(total_cases), max(total_cases/population)*100 as HighestInfectionRate from cd group by location order by HighestInfectionRate desc;
-- Andorra and Seychelles has highest infection rate of above 19%, i.e. 19% of population has been infected with Covid19

-- Showing the countries with Highest death count per population in descending order of their death count
select location, max(cast(total_deaths as int)) as TotalDeathCount
from cd
where continent!='null'
group by location
order by TotalDeathCount desc;
--India is at 3rd number with death count at 4,30,254
-- used cast to convert total_deaths into int

--Showing the continents and world with count of deaths
select location, max(cast(total_cases as int)) as TotalCases, max(cast(total_deaths as int)) as TotalDeathCount
from cd
where continent is null
group by location
order by totaldeathcount desc;
--In the whole world more than 43 lakh people have been died by Covid

--Looking at sum of new Covid cases and deaths by date
select date, sum(cast(new_cases as int)) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths
from cd
where continent is not null
group by date
order by 1,2;

-- Joining 2 tables covidDeaths and CovidVaccinations on location and date

select *  from cd
join cv
on cd.location=cv.location and cd.date=cv.date;
