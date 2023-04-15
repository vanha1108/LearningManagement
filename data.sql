CREATE DATABASE FLMBL5;
USE FLMBL5;

CREATE TABLE user (
user_id INT PRIMARY KEY,
full_name VARCHAR(100),
user_name VARCHAR(50),
email VARCHAR(100),
mobile VARCHAR(20),
password VARCHAR(100)
);

CREATE TABLE decision (
decision_id INT PRIMARY KEY,
decision_no VARCHAR(50),
decision_date DATE,
creator_id INT,
FOREIGN KEY (creator_id) REFERENCES user(user_id)
);

CREATE TABLE page (
page_id INT PRIMARY KEY,
name VARCHAR(100),
url VARCHAR(200)
);

CREATE TABLE assessment_category (
category_id INT PRIMARY KEY,
name VARCHAR(100),
description TEXT
);

CREATE TABLE assessment_type (
type_id INT PRIMARY KEY,
name VARCHAR(100),
description TEXT
);

CREATE TABLE role (
role_id INT PRIMARY KEY,
name VARCHAR(50),
description TEXT
);
CREATE TABLE user_role (
role_id INT,
user_id INT,
is_active BOOLEAN,
FOREIGN KEY (role_id) REFERENCES role(role_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE subject (
subject_id INT PRIMARY KEY,
code VARCHAR(50),
name VARCHAR(100),
semester INT,
no_credit INT
);

CREATE TABLE syllabus (
syllabus_id INT PRIMARY KEY,
name VARCHAR(100),
description TEXT,
status VARCHAR(50),
decision_id INT,
designer_id INT,
reviewer_id INT,
subject_id INT,
degree_level VARCHAR(50),
FOREIGN KEY (decision_id) REFERENCES decision(decision_id),
FOREIGN KEY (designer_id) REFERENCES user(user_id),
FOREIGN KEY (reviewer_id) REFERENCES user(user_id),
FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

CREATE TABLE reviewer (
syllabus_id INT,
reviewer_id INT,
is_active BOOLEAN,
FOREIGN KEY (syllabus_id) REFERENCES syllabus(syllabus_id),
FOREIGN KEY (reviewer_id) REFERENCES user(user_id)
);

CREATE TABLE curriculum (
curriculum_id INT PRIMARY KEY,
code VARCHAR(50),
name VARCHAR(100),
description TEXT,
decision_id INT,
total_credit INT,
owner_id INT,
FOREIGN KEY (decision_id) REFERENCES decision(decision_id),
FOREIGN KEY (owner_id) REFERENCES user(user_id)
);

CREATE TABLE po (
po_id INT PRIMARY KEY,
name VARCHAR(100),
description TEXT,
curriculum_id INT,
FOREIGN KEY (curriculum_id) REFERENCES curriculum(curriculum_id)
);
CREATE TABLE plo (
plo_id INT PRIMARY KEY,
name VARCHAR(100),
description TEXT,
curriculum_id INT,
FOREIGN KEY (curriculum_id) REFERENCES curriculum(curriculum_id)
); 
CREATE TABLE po_plo (
po_id INT,
plo_id INT,
FOREIGN KEY (po_id) REFERENCES po(po_id),
FOREIGN KEY (plo_id) REFERENCES plo(plo_id)
);
CREATE TABLE subject_group (
subject_group_id INT PRIMARY KEY,
curriculum_id INT,
group_type VARCHAR(50),
name VARCHAR(100),
FOREIGN KEY (curriculum_id) REFERENCES curriculum(curriculum_id)
); 
CREATE TABLE curriculum_subject (
curriculum_id INT,
subject_id INT,
subject_group_id INT,
learning_order INT,
FOREIGN KEY (curriculum_id) REFERENCES curriculum(curriculum_id),
FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
FOREIGN KEY (subject_group_id) REFERENCES subject_group(subject_group_id)
); 
CREATE TABLE submit (
submit_id INT PRIMARY KEY,
syllabus_id INT,
submitter_id INT,
submit_file_url VARCHAR(200),
submit_notes TEXT,
FOREIGN KEY (syllabus_id) REFERENCES syllabus(syllabus_id),
FOREIGN KEY (submitter_id) REFERENCES user(user_id)
);

CREATE TABLE plo_subject (
plo_id INT,
subject_id INT,
FOREIGN KEY (plo_id) REFERENCES plo(plo_id),
FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

CREATE TABLE discussion (
discussion_id INT PRIMARY KEY,
submit_id INT,
user_id INT,
parent_id INT,
FOREIGN KEY (submit_id) REFERENCES submit(submit_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (parent_id) REFERENCES discussion(discussion_id)
);
CREATE TABLE clo (
clo_id INT PRIMARY KEY,
name VARCHAR(100),
syllabus_id INT,
parent_lo_id INT,
description TEXT,
FOREIGN KEY (syllabus_id) REFERENCES syllabus(syllabus_id),
FOREIGN KEY (parent_lo_id) REFERENCES clo(clo_id)
);
CREATE TABLE plo_clo (
plo_id INT,
clo_id INT,
FOREIGN KEY (plo_id) REFERENCES plo(plo_id),
FOREIGN KEY (clo_id) REFERENCES clo(clo_id)
); 

CREATE TABLE pre_requisite (
subject_id INT,
pre_requisite_id INT,
FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
FOREIGN KEY (pre_requisite_id) REFERENCES subject(subject_id)
);

CREATE TABLE material (
material_id INT PRIMARY KEY,
syllabus_id INT,
FOREIGN KEY (syllabus_id) REFERENCES syllabus(syllabus_id)
); 
CREATE TABLE permission (
role_id INT,
page_id INT,
access_all BOOLEAN,
can_add BOOLEAN,
can_edit BOOLEAN,
can_delete BOOLEAN,
FOREIGN KEY (role_id) REFERENCES role(role_id),
FOREIGN KEY (page_id) REFERENCES page(page_id)
); 
CREATE TABLE session (
session_id INT PRIMARY KEY,
syllabus_id INT,
name VARCHAR(100),
details TEXT,
FOREIGN KEY (syllabus_id) REFERENCES syllabus(syllabus_id)
);
CREATE TABLE session_lo (
session_id INT,
clo_id INT,
FOREIGN KEY (session_id) REFERENCES session(session_id),
FOREIGN KEY (clo_id) REFERENCES clo(clo_id)
); 

CREATE TABLE setting (
setting_id INT PRIMARY KEY,
type VARCHAR(50),
title VARCHAR(100),
value TEXT,
details TEXT
);

CREATE TABLE assessment (
assessment_id INT PRIMARY KEY,
syllabus_id INT,
category_id INT,
type_id INT,
FOREIGN KEY (syllabus_id) REFERENCES syllabus(syllabus_id),
FOREIGN KEY (category_id) REFERENCES assessment_category(category_id),
FOREIGN KEY (type_id) REFERENCES assessment_type(type_id)
); 
CREATE TABLE assessment_lo (
assessment_id INT,
clo_id INT,
weight DECIMAL(5,2),
FOREIGN KEY (assessment_id) REFERENCES assessment(assessment_id),
FOREIGN KEY (clo_id) REFERENCES clo(clo_id)
);
CREATE TABLE question (
question_id INT PRIMARY KEY,
syllabus_id INT,
FOREIGN KEY (syllabus_id) REFERENCES syllabus(syllabus_id)
);
