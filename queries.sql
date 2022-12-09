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

UPDATE animals SET species = 'unspecified';

ROLLBACK;

/* Another Transaction */

BEGIN;

UPDATE animals SET species = 'digimon' WHERE RIGHT(name, 3) = 'mon';
UPDATE animals SET species = 'pokemon' WHERE species = 'null';

COMMIT;

SELECT * FROM animals

/* Another Transaction */

BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals

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
SELECT neutered FROM animals 
GROUP BY neutered ORDER BY COUNT(escape_attempts) DESC LIMIT 1;
select species, min(weight_kg) as minimum, max(weight_kg) as maximum from animals 
GROUP BY species
select species, avg(escape_attempts) from animals 
where extract(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species