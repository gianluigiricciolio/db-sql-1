-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT
    *
FROM
    `students`
WHERE
    `date_of_birth` LIKE '1990-%';

SELECT
    *
FROM
    `students`
WHERE YEAR(`date_of_birth`) = '1990';  


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT
    *
FROM
    `courses`
WHERE
    `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT
    *
FROM
    `students`
WHERE
    TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT
    *
FROM
    `courses`
WHERE
    `period` = 'I semestre' AND `year` = 1;


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT
    *
FROM
    `exams`
WHERE
    `date` = '2020-06-20' AND HOUR(`hour`) > 14;


-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT
    *
FROM
    `degrees`
WHERE
    `level` = 'magistrale';


-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT
    COUNT(`id`) AS `departments`
FROM
    `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT
    *
FROM
    `teachers`
WHERE
    `phone` IS NULL;


-- 9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)

INSERT INTO `students`(
    `id`,
    `degree_id`,
    `name`,
    `surname`,
    `date_of_birth`,
    `fiscal_code`,
    `enrolment_date`,
    `registration_number`,
    `email`
)
VALUES(
    NULL,
    '6',
    'Gianluigi',
    'Ricciolio',
    '1994-02-07',
    'RCCGLG88E11F412C',
    '2024-03-13',
    '123456',
    'nomecognome@gmail.com'
);


-- 10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126

UPDATE
    `teachers`
SET
    `office_number` = 126
WHERE
    `name` = 'Pietro' AND `surname` = 'Rizzo';


-- 11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9

DELETE
FROM
    `students`
WHERE
    `id` = 5001;

DELETE
FROM
    `students`
WHERE
    `id` = (SELECT `id` FROM (SELECT `id` FROM `students` ORDER BY `id` DESC LIMIT 1) AS `temp`);
