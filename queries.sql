/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01/01/2016' AND '01/01/2019';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg IN (10.4, 17.3);

/* Transaction */
BEGIN;

UPDATE animals 
SET species = 'unspecified'; -- changes made

SELECT species from animals; -- changes verified
ROLLBACK;

SELECT species from animals; -- changes undone

/* Another Transaction */

BEGIN;
   UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 
   UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 

   SELECT species from animals; --  change was made
   COMMIT;
   SELECT species from animals; --  change persists after commit

/* Another Transaction */

BEGIN;

   DELETE FROM animals;
   SELECT COUNT(*) FROM ANIMALS;

   ROLLBACK;
   SELECT COUNT(*) FROM ANIMALS;

/* Another Transaction */

BEGIN;

SAVEPOINT SP1;

DELETE FROM animals WHERE date_of_birth > 'Jan-01-2022';

SAVEPOINT SP2;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SP2;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;

/* Checks */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals
GROUP BY neutered;

select species, min(weight_kg) as minimum, max(weight_kg) as maximum from animals 
GROUP BY species
select species, avg(escape_attempts) from animals 
where extract(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species

/*Queries with JOINs*/
-- What animals belong to Melody Pond?
SELECT *
    FROM animals 
    INNER JOIN owners 
    ON animals.owner_id = owners.id 
    WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals
   LEFT JOIN species
   ON animals.species_id = species.id
   WHERE species.name = 'Pokemon';
   
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT OW.full_name as owner_name, A.name as animal_name
FROM owners OW
LEFT JOIN animals A ON OW.id = A.owner_id;

-- How many animals are there per species?
SELECT S.name as species_name, COUNT(*) as no_of_animals
FROM animals A 
JOIN species S ON A.species_id = S.id  
GROUP BY S.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT A.name as animal_name, S.name as species_name, OW.full_name as owner_name
FROM animals A
JOIN species S ON A.species_id = S.id
JOIN owners OW ON A.owner_id = OW.id 
WHERE S.name = 'Digimon' AND OW.full_name = 'Jeniffer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT A.name as animal_name, A.escape_attempts, OW.full_name as owner_name 
FROM Animals A
JOIN owners OW ON A.owner_id = OW.id
WHERE OW.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

-- Who owns the most animals?
SELECT OW.full_name as owner_name, COUNT(*) as count
FROM animals A
JOIN owners OW ON A.owner_id = OW.id 
GROUP BY OW.full_name
ORDER BY count DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?

SELECT animals.name
FROM visits 
JOIN animals on animals.id = visits.animals_id
JOIN vets on vets.id = visits.vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits_date 
DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?

SELECT vets.name as vets_name, count(*)
FROM visits
JOIN animals on animals.id = visits.animals_id
JOIN vets on vets.id = visits.vets_id 
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.

SELECT vets.name as vets_name, species.name as species_name
FROM vets
LEFT JOIN specializations on vets.id = specializations.vets_id
LEFT JOIN species on species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name
FROM visits
JOIN vets on vets.id = visits.vets_id
JOIN animals on animals.id = visits.animals_id
WHERE vets.name = 'Stephanie Mendez' 
and visits_date between 'April-01-2020' and 'August-30-2020';

-- What animal has the most visits to vets?

SELECT animals.name, count(*) as num_of_times
FROM visits
JOIN vets on vets.id = visits.vets_id
JOIN animals on animals.id = visits.animals_id
group by animals.name
order by num_of_times desc limit 1;

-- Who was Maisy Smith's first visit?

SELECT animals.name
FROM visits
JOIN vets on vets.id = visits.vets_id
JOIN animals on animals.id = visits.animals_id
where vets.name = 'Maisy Smith'
order by visits_date
limit 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT animals.name as animal_name, vets.name as vet_name, visits_date
FROM visits
JOIN vets on vets.id = visits.vets_id
JOIN animals on animals.id = visits.animals_id
order by visits_date desc limit 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT count(*)
FROM vets
left JOIN visits on vets.id = visits.vets_id
left JOIN specializations on vets.id = specializations.vets_id
left JOIN species on species.id = specializations.species_id
where species.name is null;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name, count(*)
FROM visits
JOIN vets on vets.id = visits.vets_id
JOIN animals on animals.id = visits.animals_id
JOIN species on species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
group by species.name
limit 1