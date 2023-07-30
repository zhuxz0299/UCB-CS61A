.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color ,pet ,song FROM students WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE matchmaker AS
  SELECT first.pet, first.song, first.color, second.color 
  FROM students AS first, students AS second
  WHERE first.pet = second.pet AND first.song = second.song AND first.time < second.time;


CREATE TABLE sevens AS
  SELECT students.seven
  FROM students, numbers
  WHERE students.time = numbers.time AND students.number = 7 AND numbers.'7' = 'True';


CREATE TABLE favpets AS
  SELECT pet, COUNT(*) AS count 
  FROM students GROUP BY pet 
  ORDER BY count DESC LIMIT 10;


CREATE TABLE dog AS
  SELECT * FROM favpets WHERE pet = 'dog';


CREATE TABLE bluedog_agg AS
  SELECT song, COUNT(*) AS count
  FROM bluedog_songs GROUP BY song 
  ORDER BY count DESC;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, COUNT(*) AS count
  FROM students WHERE seven = '7'
  GROUP BY instructor 
  ORDER BY instructor DESC;

