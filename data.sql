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

-- insert data into vets

INSERT INTO vets (name, age, date_of_graduation)
VALUES 
  ('William Tatcher', 45, 'Apr-23-2000'),
  ('Maisy Smith', 26, 'Jan-17-2019'),
  ('Stephanie Mendez', 64, 'May-04-1981'),
  ('Jack Harkness', 38, 'Jun-08-2008');

-- insert data into specialization

INSERT INTO specializations (vets_id, species_id)
VALUES 
	(1, 1),
  (3, 2),
  (3, 1),
  (4, 2);

-- insert data into visits

INSERT INTO visits (animals_id, vets_id, visits_date)
VALUES 
  (1, 1, 'May-24-2020'),
  (1, 3, 'Jul-22-2020'),
  (2, 4, 'Feb-02-2021'),
  (3, 2, 'Jan-05-2020'),
  (3, 2, 'Mar-08-2020'),
  (3, 2, 'May-14-2020'),
  (4, 3, 'May-04-2021'),
  (5, 4, 'Feb-24-2021'),
  (6, 2, 'Dec-21-2019'),
  (6, 1, 'Aug-10-2020'),
  (6, 2, 'Apr-07-2021'),
  (7, 3, 'Sep-29-2019'),
  (8, 4, 'Oct-03-2020'),
  (8, 4, 'Nov-04-2020'),
  (9, 2, 'Jan-24-2019'),
  (9, 2, 'May-15-2019'),
  (9, 2, 'Feb-27-2020'),
  (9, 2, 'Aug-03-2020'),
  (10, 3, 'May-24-2020'),
  (10, 1, 'Jan-11-2021');