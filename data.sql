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