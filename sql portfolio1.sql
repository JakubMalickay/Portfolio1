
--deaths per infected perc

SELECT location, total_cases, total_deaths, (total_deaths/total_cases::DECIMAL)*100 AS deathrateperc
FROM coviddeaths WHERE continent IS NOT NULL
ORDER BY 4;


SELECT location, total_cases, total_deaths, (total_deaths/total_cases::DECIMAL)*100 AS deathrateperc
FROM coviddeaths WHERE continent IS NOT NULL AND location LIKE '%Czech%'
ORDER BY 4;


-- deaths and cases in time

SELECT date, SUM(new_cases), SUM(new_deaths)
FROM coviddeaths 
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2;

--deathrate in time
SELECT date, SUM(new_cases), SUM(new_deaths), (SUM(new_deaths)/SUM(new_cases)::DECIMAL)*100 AS deathperc
FROM coviddeaths 
WHERE continent IS NOT NULL 
GROUP BY date
ORDER BY 1,2;


--total population vs vaccination

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolingpeoplevaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac 
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3

--CTE 
with PopvsVac (continent, location, date, population, new_vaccinations, rolingpeoplevaccinated )
as(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolingpeoplevaccinated
FROM coviddeaths dea
JOIN covidvaccinations vac 
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3
)
SELECT *, (rolingpeoplevaccinated::DECIMAL/population)*100
FROM PopvsVac