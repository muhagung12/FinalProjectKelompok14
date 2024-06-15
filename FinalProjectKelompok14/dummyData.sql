
-- tbl_permissions
INSERT INTO tbl_permissions VALUES (1, 'add employee');
INSERT INTO tbl_permissions VALUES (2, 'edit employee');
INSERT INTO tbl_permissions VALUES (3, 'delete employee');
INSERT INTO tbl_permissions VALUES (4, 'detail employee');
INSERT INTO tbl_permissions VALUES (5, 'add job');
INSERT INTO tbl_permissions VALUES (6, 'edit job');
INSERT INTO tbl_permissions VALUES (7, 'delete job');
INSERT INTO tbl_permissions VALUES (8, 'add department');
INSERT INTO tbl_permissions VALUES (9, 'edit department');
INSERT INTO tbl_permissions VALUES (10, 'delete department');
INSERT INTO tbl_permissions VALUES (11, 'add location');
INSERT INTO tbl_permissions VALUES (12, 'edit location');
INSERT INTO tbl_permissions VALUES (13, 'delete location');
INSERT INTO tbl_permissions VALUES (14, 'add country');
INSERT INTO tbl_permissions VALUES (15, 'edit country');
INSERT INTO tbl_permissions VALUES (16, 'delete country');
INSERT INTO tbl_permissions VALUES (17, 'add region');
INSERT INTO tbl_permissions VALUES (18, 'edit region');
INSERT INTO tbl_permissions VALUES (19, 'delete region');
INSERT INTO tbl_permissions VALUES (20, 'add role');
INSERT INTO tbl_permissions VALUES (21, 'edit role');
INSERT INTO tbl_permissions VALUES (22, 'delete role');
INSERT INTO tbl_permissions VALUES (23, 'add permission');
INSERT INTO tbl_permissions VALUES (24, 'edit permission');
INSERT INTO tbl_permissions VALUES (25, 'delete permission');
INSERT INTO tbl_permissions VALUES (26, 'edit profile');
INSERT INTO tbl_permissions VALUES (27, 'change password');

-- tbl_roles
INSERT INTO tbl_roles VALUES (1, 'Super Admin');
INSERT INTO tbl_roles VALUES (2, 'Admin');
INSERT INTO tbl_roles VALUES (3, 'Manager');
INSERT INTO tbl_roles VALUES (4, 'Employee');

-- tbl_role_permissions
INSERT INTO tbl_role_permissions VALUES (1, 1, 1);
INSERT INTO tbl_role_permissions VALUES (2, 1, 2);
INSERT INTO tbl_role_permissions VALUES (3, 1, 3);
INSERT INTO tbl_role_permissions VALUES (4, 1, 4);
INSERT INTO tbl_role_permissions VALUES (5, 1, 5);
INSERT INTO tbl_role_permissions VALUES (6, 1, 6);
INSERT INTO tbl_role_permissions VALUES (7, 1, 7);
INSERT INTO tbl_role_permissions VALUES (8, 1, 8);
INSERT INTO tbl_role_permissions VALUES (9, 1, 9);
INSERT INTO tbl_role_permissions VALUES (10, 1, 10);
INSERT INTO tbl_role_permissions VALUES (11, 1, 11);
INSERT INTO tbl_role_permissions VALUES (12, 1, 12);
INSERT INTO tbl_role_permissions VALUES (13, 1, 13);
INSERT INTO tbl_role_permissions VALUES (14, 1, 14);
INSERT INTO tbl_role_permissions VALUES (15, 1, 15);
INSERT INTO tbl_role_permissions VALUES (16, 1, 16);
INSERT INTO tbl_role_permissions VALUES (17, 1, 17);
INSERT INTO tbl_role_permissions VALUES (18, 1, 18);
INSERT INTO tbl_role_permissions VALUES (19, 1, 19);
INSERT INTO tbl_role_permissions VALUES (20, 1, 20);
INSERT INTO tbl_role_permissions VALUES (21, 1, 21);
INSERT INTO tbl_role_permissions VALUES (22, 1, 22);
INSERT INTO tbl_role_permissions VALUES (23, 1, 23);
INSERT INTO tbl_role_permissions VALUES (24, 1, 24);
INSERT INTO tbl_role_permissions VALUES (25, 1, 25);

INSERT INTO tbl_role_permissions VALUES (26, 2, 1);
INSERT INTO tbl_role_permissions VALUES (27, 2, 2);
INSERT INTO tbl_role_permissions VALUES (28, 2, 3);
INSERT INTO tbl_role_permissions VALUES (29, 2, 4);
INSERT INTO tbl_role_permissions VALUES (30, 2, 5);
INSERT INTO tbl_role_permissions VALUES (31, 2, 6);
INSERT INTO tbl_role_permissions VALUES (32, 2, 7);
INSERT INTO tbl_role_permissions VALUES (33, 2, 8);
INSERT INTO tbl_role_permissions VALUES (34, 2, 9);
INSERT INTO tbl_role_permissions VALUES (35, 2, 10);
INSERT INTO tbl_role_permissions VALUES (36, 2, 11);
INSERT INTO tbl_role_permissions VALUES (37, 2, 12);
INSERT INTO tbl_role_permissions VALUES (38, 2, 13);
INSERT INTO tbl_role_permissions VALUES (39, 2, 14);
INSERT INTO tbl_role_permissions VALUES (40, 2, 15);
INSERT INTO tbl_role_permissions VALUES (41, 2, 17);
INSERT INTO tbl_role_permissions VALUES (42, 2, 18);
INSERT INTO tbl_role_permissions VALUES (43, 2, 20);
INSERT INTO tbl_role_permissions VALUES (44, 2, 21);

INSERT INTO tbl_role_permissions VALUES (45, 3, 2);
INSERT INTO tbl_role_permissions VALUES (46, 3, 4);
INSERT INTO tbl_role_permissions VALUES (47, 3, 26);
INSERT INTO tbl_role_permissions VALUES (48, 3, 27);

INSERT INTO tbl_role_permissions VALUES (49, 4, 26);
INSERT INTO tbl_role_permissions VALUES (50, 4, 27);

-- tbl_regions
INSERT INTO tbl_regions VALUES (1, 'Southeast Asia');
INSERT INTO tbl_regions VALUES (2, 'South Asia');
INSERT INTO tbl_regions VALUES (3, 'East Asia');
INSERT INTO tbl_regions VALUES (4, 'Central Asia');
INSERT INTO tbl_regions VALUES (5, 'West Asia');

-- tbl_countries
INSERT INTO tbl_countries VALUES ('IDN', 'Indonesia', 1);
INSERT INTO tbl_countries VALUES ('SGP', 'Singapore', 1);
INSERT INTO tbl_countries VALUES ('NPL', 'Nepal', 2);
INSERT INTO tbl_countries VALUES ('MDV', 'Maldives', 2);
INSERT INTO tbl_countries VALUES ('JPN', 'Japan', 3);
INSERT INTO tbl_countries VALUES ('MNG', 'Mongolia', 3);
INSERT INTO tbl_countries VALUES ('UZB', 'Uzbekistan', 4);
INSERT INTO tbl_countries VALUES ('KAZ', 'Kazakhstan', 4);
INSERT INTO tbl_countries VALUES ('PSE', 'Palestine', 5);
INSERT INTO tbl_countries VALUES ('QAT', 'Qatar', 5);

-- tbl_locations
INSERT INTO tbl_locations VALUES (1, '123 Jalan sultan hasanuddin','10011','makassar','sulawesi barat','IDN');
INSERT INTO tbl_locations VALUES (2, '456 Orchard Road','238888','Singapore City','Singapore','SGP');
INSERT INTO tbl_locations VALUES (3, '789 Dubar Marg','44618','Kathmadu','Bagmati','NPL');
INSERT INTO tbl_locations VALUES (4, '1011 Male Boduthakurufaanu Magu','20000','Male','Male Atoll','MDV');
INSERT INTO tbl_locations VALUES (5, '1213 Shibuya Crossing','150-0002','Tokyo','Tokyo Prefecture','JPN');
INSERT INTO tbl_locations VALUES (6, '456 Chinggis Khaan Avenue','15160','Ulaanbaatar','Capital','MNG');
INSERT INTO tbl_locations VALUES (7, '789 Tashkent Metro','100000','Tashkent','Toshkent Region','UZB');
INSERT INTO tbl_locations VALUES (8, '1011 Nur-Sultan City Center','010000','Nur-Sultan','Akmola Region','KAZ');
INSERT INTO tbl_locations VALUES (9, '1213 Rafah Road','','Yerusalem','Jerussalem','PSE');
INSERT INTO tbl_locations VALUES (10, '456 Al Corniche Street','44160','Doha','Doha Municipality','QAT');

-- tbl_departments
INSERT INTO tbl_departments VALUES (1, 'Customer Service', 1);
INSERT INTO tbl_departments VALUES (2, 'Marketing', 2);
INSERT INTO tbl_departments VALUES (3, 'Research and Development', 5);
INSERT INTO tbl_departments VALUES (4, 'Finance', 10);

-- tbl_jobs
INSERT INTO tbl_jobs VALUES ('CSR','Customer Service Representative', 30000, 60000); --1
INSERT INTO tbl_jobs VALUES ('TSP','Technical Support Specialist',	60000,	60000); --1
INSERT INTO tbl_jobs VALUES ('CSM','Customer Success Manager', 70000, 75000); -- 1
INSERT INTO tbl_jobs VALUES ('DMS','Digital Marketing Specialist', 60000, 60000); -- 2
INSERT INTO tbl_jobs VALUES ('SMMM','Social Media Marketing Manager', 40000, 75000); -- 2
INSERT INTO tbl_jobs VALUES ('MRA','Market Research Analyst', 59000, 90000); -- 2
INSERT INTO tbl_jobs VALUES ('SE','Software Engineer', 80000, 90000); -- 3
INSERT INTO tbl_jobs VALUES ('DS','Data Scientist', 80000, 100000); -- 3
INSERT INTO tbl_jobs VALUES ('FA','Financial Analyst', 70000, 70000); -- 4
INSERT INTO tbl_jobs VALUES ('ACC','Accountant', 85000, 65000); -- 4

-- tbl_employees
INSERT INTO tbl_employees VALUES (1, 'Alif', 'Tanaka', 'Female', 'alicetanaka@metrodata.co', '+65 1234 5678', '2023-01-01', 55000, NULL, 'CSR', 1);
INSERT INTO tbl_employees VALUES (2, 'Beni','Lee','Male','benlee@metrodata.co','+852 8765 4321','2022-06-15',48000,1,'CSR',1);
INSERT INTO tbl_employees VALUES (3, 'Saka','Wong','Male','charliewong@metrodata.co','+886 9876 5432','2024-02-01',52000,NULL,'DMS',2);
INSERT INTO tbl_employees VALUES (4, 'Pegi','Kim','Female','dianakim@metrodata.co','+82 1111 2222','2023-08-15',60000,3,'SMMM',2);
INSERT INTO tbl_employees VALUES (5, 'Linda','Garcia','Male','ethangarcia@metrodata.co','+63 9087 6543','2022-12-01',45000,1,'CSM',1);
INSERT INTO tbl_employees VALUES (6, 'Vina','Matsumoto','Female','fionamt@metrodata.co','+81 3333 4444','2024-05-15',70000,NULL,'SE',3);
INSERT INTO tbl_employees VALUES (7, 'Eko','Zhang','Male','gabrielzh@metrodata.co','+86 2222 1111','2023-03-01',85000,6,'SE',3);
INSERT INTO tbl_employees VALUES (8, 'Putri','Khan','Female','hannahkhan@metrodata.co','+91 7654 3210','2022-09-01',62000,NULL,'FA',4);
INSERT INTO tbl_employees VALUES (9, 'Ismail','Nguyen','Male','isaacnguyen@metrodata.co','+84 2468 1012','2024-04-01',50000,8,'ACC',4);
INSERT INTO tbl_employees VALUES (10, 'Jaja','Malhotra','Female','jasminemal@metrodata.co','+92 5555 6666','2023-10-01',42000,2,'DMS',2);

-- tbl_job_histories
-- tbl_accounts
-- tbl_account_roles