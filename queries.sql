/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

Q. Find all animals whose name ends in "mon".
Ans. SELECT * from animals WHERE name LIKE '%mon%';

Q. List the name of all animals born between 2016 and 2019.
Ans. SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-1-1';

Q. List the name of all animals that are neutered and have less than 3 escape attempts.
Ans. SELECT name from animals WHERE neutered IS true AND escape_attempts < 3;

Q. List the date of birth of all animals named either "Agumon" or "Pikachu".
Ans. SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

Q. List name and escape attempts of animals that weigh more than 10.5kg.
Ans. SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

Q. Find all animals that are neutered.
Ans. SELECT * from animals WHERE neutered IS true;

Q. Find all animals not named Gabumon.
Ans. SELECT * from animals WHERE name != 'Gabumon';

Q. Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
Ans. SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

Q. Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
Ans. UPDATE animals SET species='unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

Q. Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
Update the animals table by setting the species column to pokemon for all animals that dont have species already set. Commit the transaction. Verify that change was made and persists after commit.
Ans. BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE name NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

Q. Inside a transaction delete all records in the animals table, then roll back the transaction.
Ans. BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

Q. Inside a transaction:
BEGIN;

Q. Delete all animals born after Jan 1st, 2022.
Ans. SAVEPOINT SP1;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

Q. Create a savepoint for the transaction.
Ans. SAVEPOINT SP2;

Q. Update all animals weight to be their weight multiplied by -1.
Ans. UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;

Q. Rollback to the savepoint.
Ans. ROLLBACK TO SP2;

Q. Update all animals weights that are negative to be their weight multiplied by -1.
Ans. UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

Q. Commit transaction
Ans. COMMIT;
SELECT * FROM animals;

Q. How many animals are there?
Ans. 

Q. How many animals are there?
Ans. SELECT COUNT(*) FROM animals;

Q. How many animals have never tried to escape?
Ans. SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

Q. What is the average weight of animals?
Ans. SELECT AVG(weight_kg) FROM animals;

Q. Who escapes the most, neutered or not neutered animals?
Ans. SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

Q. What is the minimum and maximum weight of each type of animal?
Ans. SELECT species, MIN(weight_kg) as Minimum, MAX(weight_kg) as Maximum FROM animals GROUP BY species;

Q. What is the average number of escape attempts per animal type of those born between 1990 and 2000?
Ans. SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

Q. What animals belong to Melody Pond?
Ans. SELECT name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';

Q. List of all animals that are pokemon (their type is Pokemon).
Ans. SELECT animals.name FROM animals JOIN species ON species.id = animals.species_id WHERE species.name = 'Pokemon';

Q. List all owners and their animals, remember to include those that dont own any animal.
Ans. SELECT name AS name_of_animals, full_name AS name_of_owners FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

Q. How many animals are there per species?
Ans. SELECT species.name, COUNT(*) FROM animals LEFT JOIN species ON species.id = animals.species_id GROUP BY species.name;

Q. List all Digimon owned by Jennifer Orwell.
Ans. SELECT animals.name FROM animals JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owner_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

Q. List all animals owned by Dean Winchester that havent tried to escape.
Ans. SELECT name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

Q. Who owns the most animals?
Ans. SELECT full_name, COUNT(full_name) AS maximum FROM animals JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY maximum DESC LIMIT 1;

Q. Who was the last animal seen by William Tatcher?
Ans. SELECT animals.name FROM visits JOIN animals on animals.id = visits.animals_id JOIN vets on vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

Q. How many different animals did Stephanie Mendez see?
Ans. SELECT vets.name, COUNT(*) FROM visits JOIN animals on animals.id = visits.animals_id JOIN vets on vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

Q. List all vets and their specialties, including vets with no specialties.
Ans. SELECT vets.name, species.name FROM vets LEFT JOIN specializations on vets.id = specializations.vets_id LEFT JOIN species on species.id = specializations.species_id;

Q. List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
Ans. SELECT animals.name FROM visits JOIN vets on vets.id = visits.vets_id JOIN animals on animals.id = visits.animals_id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '04-01-2020' AND '08-30-2020';

Q. What animal has the most visits to vets?
Ans. SELECT animals.name, COUNT(*) AS number_of_visits FROM visits JOIN vets on vets.id = visits.vets_id JOIN animals on animals.id = visits.animals_id GROUP BY animals.name ORDER BY number_of_visits DESC LIMIT 1;

Q. Who was Maisy Smiths first visit?
Ans. SELECT animals.name FROM visits JOIN vets on vets.id = visits.vets_id JOIN animals on animals.id = visits.animals_id WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;

Q. Details for most recent visit: animal information, vet information, and date of visit.
Ans. SELECT animals.name, vets.name, date_of_visit FROM visits JOIN vets on vets.id = visits.vets_id JOIN animals on animals.id = visits.animals_id ORDER BY date_of_visit DESC LIMIT 1;

Q. How many visits were with a vet that did not specialize in that animals species?
Ans. SELECT COUNT(*) FROM vets LEFT JOIN visits on vets.id = visits.vets_id LEFT JOIN specializations on vets.id = specializations.vets_id LEFT JOIN species on species.id = specializations.species_id WHERE species.name is NULL;

Q. What specialty should Maisy Smith consider getting? Look for the species she gets the most.
Ans. SELECT species.name, COUNT(*) FROM visits JOIN vets on vets.id = visits.vets_id JOIN animals on animals.id = visits.animals_id JOIN species on species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name LIMIT 1;
