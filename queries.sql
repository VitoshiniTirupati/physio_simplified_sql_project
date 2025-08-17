DESCRIBE users;
SHOW tables;
SELECT * FROM users;
SELECT * FROM courses;
SELECT * FROM contact_messages;


SELECT * FROM contact_messages;
SELECT * FROM users;


-- SAMPLE QUERIES

SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'registrations', COUNT(*) FROM course_registrations
UNION ALL
SELECT 'contacts', COUNT(*) FROM contact_messages
UNION ALL
SELECT 'research_reqs', COUNT(*) FROM research_requests
UNION ALL
SELECT 'bio_reqs', COUNT(*) FROM biostatistics_requests;


-- Trainers list to verify trainer IDs
SELECT user_id, name, role FROM users WHERE role = 'trainer';

-- course popularity
SELECT c.course_id, c.title, COUNT(r.registration_id) AS enrollments
FROM courses c
LEFT JOIN course_registrations r ON c.course_id = r.course_id
GROUP BY c.course_id
ORDER BY enrollments DESC; 



-- To find all students and the courses they joined
SELECT u.name AS student_name, u.year_of_study, c.title AS course_name
FROM users u
JOIN course_registrations r ON u.user_id = r.user_id
JOIN courses c ON r.course_id = c.course_id
WHERE u.role = 'student';


-- List of trainers and how many courses they are teaching
SELECT u.name AS trainer_name, COUNT(c.course_id) AS total_courses
FROM users u
LEFT JOIN courses c ON u.user_id = c.trainer_user_id
WHERE u.role = 'trainer'
GROUP BY u.user_id, u.name;


-- Find students who allowed media usage
SELECT u.name, u.email, c.title AS course_name
FROM course_registrations r
JOIN users u ON r.user_id = u.user_id
JOIN courses c ON r.course_id = c.course_id
WHERE r.allow_media_usage = TRUE;


-- Show course fee paid by each student
SELECT u.name AS student_name, c.title AS course_name, r.fee_option
FROM course_registrations r
JOIN users u ON r.user_id = u.user_id
JOIN courses c ON r.course_id = c.course_id
WHERE u.role = 'student';


-- To show how many students registered in each course
SELECT c.title AS course_name, COUNT(r.registration_id) AS total_registrations
FROM courses c
LEFT JOIN course_registrations r ON c.course_id = r.course_id
GROUP BY c.course_id;

-- To show all trainers and the courses they teach
SELECT u.name AS trainer_name, c.title AS course_name
FROM users u
JOIN courses c ON u.user_id = c.trainer_user_id;


-- total amount paid by each student
SELECT 
    u.name AS student_name,
    SUM(
        CASE 
            WHEN u.role = 'student' THEN c.fee_student
            WHEN u.role = 'practitioner' THEN c.fee_practitioner
            ELSE 0
        END
    ) AS total_amount_paid
FROM course_registrations r
JOIN users u ON r.user_id = u.user_id
JOIN courses c ON r.course_id = c.course_id
GROUP BY u.user_id, u.name;