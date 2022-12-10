/* Populate database with sample data. */

/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon','02/03/2020', 0 ,true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon','11/15/2018', 2 ,true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu','07/01/2021', 1 ,false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon','05/12/2017', 5 ,true, 11);

/* New values inserted */
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES 
	('Charmander', 'Feb-08-2020', -11, false, 0),
	('Plantmon', 'Nov-15-2021', -5.7, true, 2),
	('Squirtle', 'Apr-02-1993', -12.13, false, 3),
	('Angemon', 'Jun-12-2005', -45, true, 1),
	('Boarmon', 'Jun-07-2005', 20.4, true, 7),
	('Blossom', 'Oct-13-1998', 17, true, 3),
	('Ditto', 'May-14-2022', 22, true, 4);

	/* Insert details of animal owners */
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jeniffer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert details of animal species */
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/*UPDATE ANIMAL's TABLE */

/*Add species_id to animals table */
UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Digimon') 
WHERE name like '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id is null;

/*Add animal owners*/
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jeniffer Orwell')
WHERE name = 'Pikachu' OR name = 'Gabumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';