/*Portfolio 2 */


CREATE TABLE experience_level ( 
    experience_level_id     INTEGER NOT NULL AUTO_INCREMENT,
    experience_level_name   VARCHAR(20),
    PRIMARY KEY(experience_level_id)
);


CREATE TABLE skill_type(
    skill_type_id           INTEGER NOT NULL AUTO_INCREMENT,
    skill_name              VARCHAR(20),
    skill_type              VARCHAR(20),
    PRIMARY KEY(skill_type_id)
);


/*client id is the primary key with constraints of not null 
  client_email is mandatory/not null
  address is split into different columns */

CREATE TABLE client ( 
    client_id   	        INTEGER NOT NULL AUTO_INCREMENT,
    client_org_name         VARCHAR(50)  NOT NULL, 
	client_firstname        VARCHAR(30), 
    client_lastname         VARCHAR(30),
	client_email   	        VARCHAR(20) NOT NULL, 
	client_addr1	        VARCHAR(20), 
	client_addr2            VARCHAR(20),
    client_city             VARCHAR(20),
    client_postcode         VARCHAR(10),
    client_preferred_contact ENUM ('Post', 'Email'),
	PRIMARY KEY (client_id)
);
 
/* In this project table, client_id is the foreign key, so the column is
permitted to have null and non-unique values, because there can be a project
not requested by a client. It also can be non-unique, both projects may be given by 
the same client, the project to a client is a many to one relationship
#nullable may be empty, non-unique allows the value in the column to repeat,
client can have 0 projects, i.e. the client doesn't exist in the foreign column
defined in the project table, may have internal projects, foreign key but nullable
2 projects may be derived from the same client so is repeatable */

CREATE TABLE project (
    project_id              INTEGER NOT NULL AUTO_INCREMENT,
    project_title           VARCHAR(50) NOT NULL,
    project_start_date      DATE,
    project_end_date        DATE,
    project_budget          INTEGER,
    project_description     VARCHAR(100),
    project_phase           VARCHAR(40),
    client_id               INTEGER,
    PRIMARY KEY(project_id),
    FOREIGN KEY fk_client_id(client_id) REFERENCES CLIENT(client_id)
);




/* composite primary key */ 
CREATE TABLE project_required_skill ( 
    project_id              INTEGER NOT NULL,
    skill_type_id           INTEGER NOT NULL,
    PRIMARY KEY(project_id,skill_type_id)
);

CREATE TABLE pool_member(
    member_id               INTEGER NOT NULL AUTO_INCREMENT,
    member_first_name       VARCHAR(40),
    member_last_name        VARCHAR(40),
    member_email            VARCHAR(20) NOT NULL,
    member_phone            INTEGER,
    member_work_addr        VARCHAR(100),
    member_home_addr        VARCHAR(100),
    PRIMARY KEY(member_id)
);
     
   
CREATE TABLE member_skill ( 
    member_id               INTEGER NOT NULL, 
    skill_type_id           INTEGER NOT NULL,      
    experience_level_id     INTEGER, 
    PRIMARY KEY (member_id,skill_type_id), 
    FOREIGN KEY fk_experience_level_id(experience_level_id) REFERENCES experience_level(experience_level_id)
);

CREATE TABLE project_assignment ( 
    project_id              VARCHAR(10),
    member_id               VARCHAR(10),
    project_assigned_date   DATE,
    PRIMARY KEY (project_id,member_id)
);

