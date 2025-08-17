-- insert users values
INSERT INTO users (user_id, name, email, whatsapp_num, role, year_of_study, years_experience, institution, password_hash) VALUES
(49, 'Admin User', 'admin@physiosimplified.com', '0000000000', 'admin', NULL, NULL, 'PhysioSimplified HQ', 'admin_hashed_pw'),
(50, 'Dr. Meera Kapoor', 'meera@physiosimplified.com', '8800000001', 'trainer', NULL, 8, 'MBU', 'trainer_pw_1'),
(51, 'Dr. Rahul Nair', 'rahul@physiosimplified.com', '8800000002', 'trainer', NULL, 5, 'SVU', 'trainer_pw_2'),
(52, 'Ananya Singh', 'ananya@student.com', '9800000003', 'student', 'BPT3', NULL, 'VIT', 'stud_pw_1'),
(53, 'Rohit Sharma', 'rohit@student.com', '9800000004', 'student', 'BPT4', NULL, 'MBU', 'stud_pw_2'),
(54, 'Priya Verma', 'priya@student.com', '9800000005', 'student', 'MPT1', NULL, 'SRM', 'stud_pw_3'),
(55, 'Arjun Das', 'arjun@prac.com', '9800000006', 'practitioner', NULL, 2, 'MANIPAL', 'prac_pw_1'),
(56, 'Sneha Iyer', 'sneha@prac.com', '9800000007', 'practitioner', NULL, 4, 'SVIMS', 'prac_pw_2');




ALTER TABLE users AUTO_INCREMENT = 57;


-- inserting values of courses
INSERT INTO courses (title, category, fee_student, fee_practitioner, trainer_user_id) VALUES
('Fundamentals of Antenatal Care', 'Antenatal Care', 3999.00, 4999.00, 50),
('Surface Anatomy and Palpation', 'Anatomy', 3499.00, 4499.00, 50),
('Chest X Ray Simplified', 'Radiology', 3499.00, 4499.00, 51),
('Introduction to Antenatal Care', 'Antenatal Care', 3999.00, 4999.00, 50),
('Fundamentals of Research Methodology', 'Research', 3499.00, 4499.00, 51),
('Introduction to Research Methodology', 'Research', 3999.00, 4999.00, 51),
('Fundamentals of Exercise Physiology', 'Exercise Physiology', 3499.00, 4499.00, 50),
('Introduction to Exercise Physiology', 'Exercise Physiology', 3999.00, 4999.00, 50),
('ICU Management', 'Critical Care', 4499.00, 5499.00, 51),
('Introduction to Biomechanics', 'Biomechanics', 3999.00, 4999.00, 50),
('Biomechanics', 'Biomechanics', 3999.00, 4999.00, 50),
('Fundamentals of Biomechanics', 'Biomechanics', 3499.00, 4499.00, 50);



-- inserting values of course registrations
INSERT INTO course_registrations
(user_id, course_id, heard_from, skin_conditions, allow_media_usage, reason, fee_option) VALUES
(52, 1, 'instagram', 'no', 'yes', 'Interested in women health', 'student_3999'),
(53, 2, 'friend', 'no', 'yes', 'Improve palpation skills', 'student_3499'),
(54, 4, 'website', 'no', 'yes', 'Intro course before advanced', 'student_3999'),
(55, 9, 'linkedin', 'yes', 'no', 'ICU exposure at work', 'practitioner_4499'),
(56, 11, 'conference', 'no', 'yes', 'Deep dive into biomechanics', 'practitioner_4999');



-- inserting values of contact_messages
INSERT INTO contact_messages
(user_id, name, email, whatsapp, found_us_from, institution, year_of_study, message) VALUES
(52, 'Ananya Singh', 'ananya@student.com', '9800000003', 'instagram', 'VIT', 'BPT3', 'Do you provide student discounts?'),
(55, 'Arjun Das', 'arjun@prac.com', '9800000006', 'linkedin', 'Independent Clinic', NULL, 'Looking for weekend batches.');


-- inserting values of research_services
INSERT INTO research_services (service_type, plan_name, price) VALUES
('mentorship', 'Mentorship - 2499', 2499.00),
('thesis_writing', 'Thesis Writing - Standard', 9999.00);



-- inserting values of research_requests
INSERT INTO research_requests (user_id, service_id, age, gender, project_stage, education_level) VALUES
(52, 1, 21, 'female', 'synopsis', 'BPT3'),
(54, 2, 24, 'female', 'data_collection', 'MPT1');



-- inserting values of biostatistics_services
INSERT INTO biostatistics_services (service_type, plan_name, price) VALUES
('sample_size', 'Within 7 days - 149', 149.00),
('sample_size', 'Within 3 days - 299', 299.00),
('sample_size', 'Within 1 day - 499', 499.00),
('statistical_analysis', '3-day (1-3 vars) - 450', 450.00),
('statistical_analysis', '3-day (4-6 vars) - 800', 800.00),
('statistical_analysis', '7-day (1-3 vars) - 300', 300.00);


-- inserting values of biostatistics_requests
INSERT INTO biostatistics_requests
(user_id, bio_service_id, education_level, confidence_interval, method, referral_code, specific_requirements) VALUES
(53, 1, 'BPT4', '95%', 'software', NULL, 'CI 95%, convenience sampling'),
(55, 4, 'Practitioner', 'unknown', 'software', 'REF-ICU', 'ANOVA + post-hoc');