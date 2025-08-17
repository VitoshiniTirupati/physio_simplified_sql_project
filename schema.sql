-- creating a database named physio simplified
CREATE DATABASE physiosimplified;
USE physiosimplified;

-- Users table
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  whatsapp_num VARCHAR(20),
  role ENUM('student','practitioner','trainer','admin') NOT NULL DEFAULT 'student',
  year_of_study VARCHAR(50),
  years_experience INT,
  institution VARCHAR(150),
  password_hash VARCHAR(255)
) ENGINE=InnoDB;




-- Courses table
CREATE TABLE courses (
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  category VARCHAR(100),
  fee_student DECIMAL(10,2),
  fee_practitioner DECIMAL(10,2),
  trainer_user_id INT NULL,
  CONSTRAINT fk_courses_trainer
    FOREIGN KEY (trainer_user_id) REFERENCES users(user_id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;




-- course registration 
CREATE TABLE course_registrations (
  registration_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  course_id INT NOT NULL,
  heard_from ENUM('friend','ads','teacher','social_media','instagram','linkedin','website','conference','other') DEFAULT 'other',
  skin_conditions ENUM('yes','no') DEFAULT 'no',
  allow_media_usage ENUM('yes','no') DEFAULT 'yes',
  reason VARCHAR(255),
  fee_option ENUM('student_3499','practitioner_4499','student_3999','practitioner_4999'),
  CONSTRAINT fk_reg_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_reg_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;



-- contact 
CREATE TABLE contact_messages (
  message_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NULL,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL,
  whatsapp VARCHAR(20),
  found_us_from ENUM('friend','ads','teacher','social_media','instagram','linkedin','website','conference','other') DEFAULT 'other',
  institution VARCHAR(150),
  year_of_study VARCHAR(50),
  message VARCHAR(500),
  CONSTRAINT fk_contact_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;




--  research_services 
CREATE TABLE research_services (
  service_id INT PRIMARY KEY AUTO_INCREMENT,
  service_type ENUM('thesis_writing','mentorship') NOT NULL,
  plan_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;




-- research requests
CREATE TABLE research_requests (
  request_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  service_id INT NOT NULL,
  age INT,
  gender ENUM('male','female','prefer_not_to_say'),
  project_stage ENUM(
    'title_selection','sample_size','synopsis','ethical_committee','data_collection',
    'statistical_analysis','thesis_writing','black_book','final_presentation','publication','other'
  ),
  education_level VARCHAR(50),
  CONSTRAINT fk_rr_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_rr_service FOREIGN KEY (service_id) REFERENCES research_services(service_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;





-- biostatistics_services
CREATE TABLE biostatistics_services (
  bio_service_id INT PRIMARY KEY AUTO_INCREMENT,
  service_type ENUM('sample_size','statistical_analysis') NOT NULL,
  plan_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;




-- biostatistics_requests
CREATE TABLE biostatistics_requests (
  bio_request_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  bio_service_id INT NOT NULL,
  education_level VARCHAR(50),
  confidence_interval ENUM('99%','95%','90%','unknown') DEFAULT '95%',
  method ENUM('software','formula'),
  referral_code VARCHAR(50),
  specific_requirements TEXT,
  CONSTRAINT fk_br_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_br_service FOREIGN KEY (bio_service_id) REFERENCES biostatistics_services(bio_service_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;



-- indexes are used to make the searching faster instead of looking into the whole table
CREATE INDEX idx_courses_trainer ON courses(trainer_user_id);
CREATE INDEX idx_reg_user ON course_registrations(user_id);
CREATE INDEX idx_reg_course ON course_registrations(course_id);
CREATE INDEX idx_rr_user ON research_requests(user_id);
CREATE INDEX idx_br_user ON biostatistics_requests(user_id);
