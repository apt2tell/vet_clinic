/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR(50)

/* Create owners table */
CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

/*Create Species table */
CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

--Remove column 'species' from animals table.
ALTER TABLE animals DROP COLUMN species;

/*Constraints */
ALTER TABLE animals 
ADD COLUMN species_id INT CONSTRAINT species_animals_fk 
REFERENCES species(id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE animals 
ADD COLUMN owner_id INT CONSTRAINT owners_animals_fk 
REFERENCES owners(id) 
ON UPDATE CASCADE ON DELETE CASCADE;

-- Create a table named vets

CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	age INTEGER,
	date_of_graduation DATE
);

CREATE TABLE specializations (
	id serial PRIMARY KEY,
	vets_id INTEGER REFERENCES vets(id) ON DELETE CASCADE,
	species_id INTEGER REFERENCES species(id) ON DELETE CASCADE
);

CREATE TABLE visits (
  vets_id INTEGER REFERENCES vets(id) ON DELETE CASCADE,
  animals_id INTEGER REFERENCES animals(id) ON DELETE CASCADE,
	visits_date DATE
);