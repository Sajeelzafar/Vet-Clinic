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
