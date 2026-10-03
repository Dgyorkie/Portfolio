
/* Table with just the skill types */

INSERT INTO skill_type(skill_name,skill_type)
VALUES('python', 'backend');
INSERT INTO skill_type(skill_name,skill_type)
VALUES('html', 'frontend');
INSERT INTO skill_type(skill_name,skill_type)
VALUES('css', 'frontend');
INSERT INTO skill_type(skill_name,skill_type)
VALUES('javascript', 'backend');
INSERT INTO skill_type(skill_name,skill_type)
VALUES('sql', 'backend');
INSERT INTO skill_type(skill_name,skill_type)
VALUES('php', 'frontend');

/*Table with just the level of experience */

INSERT INTO experience_level(experience_level_name)
VALUES('novice');
INSERT INTO experience_level(experience_level_name)
VALUES('intermediate');
INSERT INTO experience_level(experience_level_name)
VALUES('expert');

/*Table with the clients */
INSERT INTO client(client_org_name,client_firstname,client_lastname,client_email,client_addr1,client_addr2,
client_city,client_postcode,client_preferred_contact)
VALUES('ABC constructions limited','Edward','Smith','edward.smith@abc.com','12 Grafton sq','Bradville',
'Milton Keynes','MK5 6FD','Email');

INSERT INTO client(client_org_name,client_firstname,client_lastname,client_email,client_addr1,client_addr2,
client_city,client_postcode,client_preferred_contact)
VALUES('Treat Street Desserts','Amy','Lee','amy.lee2@gmail.com','Unit 1,Business Park','Northampton Road',
'Wellingborough','NN8 2JZ','Post');


/* Table with the members available to work on projects */

INSERT INTO pool_member(member_first_name,member_last_name,member_email,member_phone,member_home_addr,member_work_addr)
VALUES('Ben', 'James', 'ben@gmail.com', 07945678, '12 Cadman Square', '15 Eldergate');
INSERT INTO pool_member(member_first_name,member_last_name,member_email,member_phone,member_home_addr,member_work_addr)
VALUES('David', 'James', 'david@n@gmail.com', 07935298, '15 Mayfair Square', '12 London Street');

/* Table with the member skills */

INSERT INTO member_skill(member_id, skill_type_id, experience_level_id)
VALUES(1, 1, 1);
INSERT INTO member_skill(member_id, skill_type_id, experience_level_id)
VALUES(2, 2, 1);


/*Table with the projects */
INSERT into project(project_title,project_start_date,project_end_date,project_budget,project_description,
project_phase,client_id)
VALUES('Web polling system', '01-01-2026','31-07-2026',100000,'online polling system used on any browser','design',1)

INSERT into project(project_title,project_start_date,project_end_date,project_budget,project_description,
project_phase,client_id)
VALUES('Web page build', '01-02-2026','30-04-2026',50000,'marketing webpage','development',1)

INSERT into project(project_title,project_start_date,project_end_date,project_budget,project_description,
project_phase,client_id)
VALUES('Cyber system', '01-10-2025','31-09-2026',500000,'cyber security system','testing',2)

INSERT into project(project_title,project_start_date,project_end_date,project_budget,project_description,
project_phase,client_id)
VALUES('Build a payment system', '01-11-2025','30-03-2026',25000,'build a payment system','build',2)

INSERT into project(project_title,project_start_date,project_end_date,project_budget,project_description,
project_phase,client_id)
VALUES('Build a a project plan', '01-04-2026','30-05-2026',25000,'design a project plan','design',1)


/* Table with project_required_skill */

INSERT INTO project_required_skill(project_id,skill_type_id)
VALUES(1,1);
INSERT INTO project_required_skill(project_id,skill_type_id)
VALUES(2,2);
INSERT INTO project_required_skill(project_id,skill_type_id)
VALUES(4,5);
INSERT INTO project_required_skill(project_id,skill_type_id)
VALUES(5,3);

/* Choose a member for the project */

SELECT member_skill.member_id, project_required_skill.project_id
  FROM member_skill, project_required_skill
WHERE member_skill.skill_type_id = project_required_skill.skill_type_id;

/* Insert into the Table project_assignment */
INSERT INTO project_assignment(project_id,member_id,project_assigned_date)
VALUES(1,1,'2026-01-01');
INSERT INTO project_assignment(project_id,member_id,project_assigned_date)
VALUES(2,2,'2026-02-01');


/* Projects summary */

SELECT
    p.project_id,
    p.project_title,
    c.client_org_name,
    p.project_phase,
    p.project_start_date,
    p.project_end_date,
    p.project_budget
FROM project p
JOIN client c
    ON c.client_id = p.client_id
LEFT JOIN project_assignment pa
    ON pa.project_id = p.project_id
;

/* Projects and members assigned */

SELECT
    p.project_id,
    p.project_title,
    c.client_org_name,
    p.project_phase,
    p.project_start_date,
    p.project_end_date,
    p.project_budget,
    COUNT(pa.member_id) AS assigned_members
FROM project p
LEFT JOIN client c
    ON c.client_id = p.client_id
LEFT JOIN project_assignment pa
    ON pa.project_id = p.project_id
GROUP BY
    p.project_id, p.project_title, c.client_org_name,
    p.project_phase, p.project_start_date, p.project_end_date, p.project_budget
ORDER BY
    p.project_id;