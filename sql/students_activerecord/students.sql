DROP TABLE students;

CREATE TABLE students (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(25),
  age INT2,
  gender CHAR(1)
);


DROP TABLE courses;

CREATE TABLE courses (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(20)
);

DROP TABLE courses_students;

CREATE TABLE courses_students (
  student_id INT8,
  course_id INT8
);

--SEED DATA

INSERT INTO students (first_name, age, gender) VALUES ('Bob',25,'M');
INSERT INTO students (first_name, age, gender) VALUES ('Alice',53,'F');
INSERT INTO students (first_name, age, gender) VALUES ('Simon',29,'M');

INSERT INTO courses (name) VALUES ('Maths');
INSERT INTO courses (name) VALUES ('Biology');
INSERT INTO courses (name) VALUES ('Computers');
INSERT INTO courses (name) VALUES ('Music');

INSERT INTO courses_students (student_id, course_id) VALUES ((SELECT id FROM students WHERE first_name = 'Simon'),(SELECT id FROM courses WHERE name = 'Computers'));
INSERT INTO courses_students (student_id, course_id) VALUES ((SELECT id FROM students WHERE first_name = 'Bob'),(SELECT id FROM courses WHERE name = 'Maths'));
INSERT INTO courses_students (student_id, course_id) VALUES ((SELECT id FROM students WHERE first_name = 'Bob'),(SELECT id FROM courses WHERE name = 'Biology'));
INSERT INTO courses_students (student_id, course_id) VALUES ((SELECT id FROM students WHERE first_name = 'Alice'),(SELECT id FROM courses WHERE name = 'Music'));
INSERT INTO courses_students (student_id, course_id) VALUES ((SELECT id FROM students WHERE first_name = 'Alice'),(SELECT id FROM courses WHERE name = 'Biology'));

--RETURN THE STUDENT TO COURSE RELATIONSHIP

SELECT students.first_name, students.age, students.gender, courses.name
FROM students
JOIN courses_students ON courses_students.student_id = students.id
JOIN courses ON courses_students.course_id = courses.id;