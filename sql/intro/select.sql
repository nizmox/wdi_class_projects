SELECT person.first_name || ' ' || person.last_name, pet.name
FROM person
JOIN person_pet on person_pet.person_id = person.id
JOIN pet on pet.id = person_pet.pet_id;