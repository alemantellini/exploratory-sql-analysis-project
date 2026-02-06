SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

-- LEVEL 1 --

-- MISSION 1
-- Your query here;
-- ¿Cuáles son las primeras 10 observaciones registradas?
-- Utiliza LIMIT para mostrar solo una parte de la tabla.;
SELECT * FROM observations
LIMIT 10;

-- MISSION 2
-- Your query here;
-- ¿Qué identificadores de región (region_id) aparecen en los datos?
-- Usa SELECT DISTINCT para evitar repeticiones.;
SELECT DISTINCT region_id 
FROM observations;

-- MISSION 3
-- Your query here;
-- ¿Cuántas especies distintas (species_id) se han observado?
-- Combina COUNT con DISTINCT para no contar duplicados.;
SELECT COUNT(DISTINCT species_id) AS total_species
FROM observations;

-- MISSION 4
-- ¿Cuántas observaciones hay para la región con region_id = 2?
-- Aplica una condición con WHERE.;
SELECT COUNT(*) AS total_observations
FROM observations
WHERE region_id = 2;

-- MISSION 5
-- ¿Cuántas observaciones se registraron el día 1998-08-08?
-- Filtra por fecha exacta usando igualdad.;
SELECT COUNT(*) AS total_observations
FROM observations
WHERE observation_date = '1998-08-08';

-- LEVEL 2 --

-- MISSION 6
-- ¿Cuál es el region_id con más observaciones?
-- Agrupa por región y cuenta cuántas veces aparece cada una.;
SELECT region_id, COUNT(*) AS total_observations
FROM observations
GROUP BY region_id
ORDER BY total_observations DESC;

-- MISSION 7
-- ¿Cuáles son los 5 species_id más frecuentes?
-- Agrupa, ordena por cantidad descendente y limita el resultado.;
SELECT species_id, COUNT(*) AS total
FROM observations
GROUP BY species_id
ORDER BY total DESC
LIMIT 5;

-- MISSION 8
-- ¿Qué especies (species_id) tienen menos de 5 registros?
-- Agrupa por especie y usa HAVING para aplicar una condición.;
SELECT species_id, COUNT(*) AS total
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5
ORDER BY total ASC;

-- MISSION 9
-- ¿Qué observadores (observer) registraron más observaciones?
-- Agrupa por el nombre del observador y cuenta los registros.;
SELECT observer, COUNT(*) AS total
FROM observations
GROUP BY observer
ORDER BY total DESC;

-- LEVEL 3 --

-- MISSION 10
-- Muestra el nombre de la región (regions.name) para cada observación.
-- Relaciona observations con regions usando region_id.;
SELECT observations.id, regions.name AS region_name
FROM observations
JOIN regions
    ON observations.region_id = regions.id;

-- MISSION 11
-- Muestra el nombre científico de cada especie registrada (species.scientific_name).
-- Relaciona observations con species usando species_id.;
SELECT observations.id, species.scientific_name
FROM observations
JOIN species
    ON observations.species_id = species.id;

-- MISSION 12
-- ¿Cuál es la especie más observada por cada región?
-- Agrupa por región y especie, y ordena por cantidad.;
SELECT regions.name AS region, species.scientific_name, COUNT(*) AS total 
FROM observations
JOIN regions 
    ON observations.region_id = regions.id
JOIN species 
    ON observations.species_id = species.id
GROUP BY region, species.scientific_name
ORDER BY region, total DESC;