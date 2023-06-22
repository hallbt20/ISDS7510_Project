### Master SQL File ###

USE team2_database;

################## Drop Tables ##################
set foreign_key_checks = 0; #If you cannot drop the table
DROP TABLE IF EXISTS 
	account, 
    rt_medicaid_plan, 
    individual, 
    income, 
    medicaid_summary, 
    correspondence;

################## Create Tables ##################

#### Create Account Table ####
Create Table account (
	Account_Num INT, 
	Create_DT DATE, 
	Addr_1 VARCHAR(255), 
	Addr_2 VARCHAR(255),
	Addr_State VARCHAR(50), 
	Addr_City VARCHAR(100), 
	Addr_Zip VARCHAR(10),
	Primary KEY (Account_Num)
);

#### Create RT Medicaid Plan ####
Create Table rt_medicaid_plan (
	Plan_ID VARCHAR(100), 
	Plan_Description VARCHAR(500), 
	Minimum_Age INT, 
	Maximum_Age INT, 
	Maximum_Income VARCHAR(255), 
	Pregnancy_Indicator VARCHAR(3), 
	Sex VARCHAR(50),
	Primary KEY (Plan_ID)
);

#### Create Individual Table ####
Create Table individual (
	Individual_ID INT, 
	SSN INT, 
	First_Name VARCHAR(255), 
	Mid_Initial VARCHAR(1), 
	Last_Name VARCHAR(255), 
	Phone_Num VARCHAR(100), 
	Email VARCHAR(100), 
	DOB Date, 
	Sex VARCHAR(50), 
	Pregnancy_Indicator VARCHAR(3), 
	Relationship VARCHAR(100), 
	Citizenship_Status VARCHAR(100), 
	Account_Num INT, 
	Plan_ID VARCHAR(100),
	Primary KEY (Individual_ID), 
    Foreign KEY (Account_Num) References account (Account_Num), 
    Foreign KEY (Plan_ID) References rt_medicaid_plan (Plan_ID)
);

#### Create Income Table ####
Create Table income (
	Income_Sequence_Num INT, 
	Monthly_Income_Amount VARCHAR(100), 
	Income_Type VARCHAR(255), 
    Occupation VARCHAR(100), 
    Additional_Resources VARCHAR(3),
	Additional_Resources_Amount VARCHAR(100), 
    Individual_ID INT,
	Primary KEY (Income_Sequence_Num), 
    Foreign KEY (Individual_ID) References individual (Individual_ID)
);

#### Create Medicaid Summary Table ####
CREATE TABLE medicaid_summary (
	Medicaid_Summary_Num INT(10),
	Plan_ID VARCHAR(100),
	Individual_ID INT(11),
	Plan_Start_Date DATE,
	Plan_End_Date DATE,
	Approval_Status VARCHAR (20),
	Assistance_Status VARCHAR (20),
	PRIMARY KEY (Medicaid_Summary_Num),
	CONSTRAINT FK_medicaid_summary_Plan_ID FOREIGN KEY (Plan_ID) REFERENCES rt_medicaid_plan(Plan_ID),
	CONSTRAINT FK_medicaid_summary_Individual_ID FOREIGN KEY (Individual_ID) REFERENCES individual(Individual_ID)
);

#### Create Correspondence Table ####

### Placeholder ###

################## Add Values to Tables ##################

#### Adding Values into Account ####
Insert Into account Values 
	(938412948, '2020-01-09', '31 Spooner Street', NULL, 'LA', 'New Orleans', '70131'), 
	(938576523, '2020-02-05', '416 Cherry Street', NULL, 'LA', 'Destrehan', '70047'),
    (938000328, '2020-02-11', '129 W 81Street', 'Apt 5A', 'LA', 'Baton Rouge', '70803'),
    (938656722, '2020-02-15', '124 Conch Street', NULL, 'LA', 'Baton Rouge', '70802'),
    (938706444, '2020-02-15', '180 East 88th Street', NULL, 'LA', 'New Orleans', '70115'),
    (938160614, '2020-03-06', '855 Sixth Avenue', NULL, 'LA', 'Norco', '70047'),
    (938513672, '2020-04-02', '4 Pivet Drive', NULL, 'LA', 'New Orleans', '70131'),
    (938866730, '2020-04-09', '742 Evergreen Terrace', NULL, 'LA', 'Clinton', '70722'),
    (938219788, '2020-04-29', '1725 Slough Avenue', NULL, 'LA', 'Lafayette', '70501'),
    (938572846, '2020-04-30', '2119 S Homan Ave', NULL, 'LA', 'Monroe', '71202'),
    (938925904, '2020-05-07', '1418 W 126 Street', NULL, 'LA', 'Thibodaux', '70301'),
    (938278962, '2020-05-21', '2121 Avenue', NULL, 'LA', 'Slidell', '70458'),
    (938632020, '2020-07-01', '5655 Murietta Avenue', NULL, 'LA', 'New Orleans', '70131'),
    (938985078, '2010-08-15', '2358 Highland Avenue', NULL, 'LA', 'Norco', '70047'),
    (938338136, '2020-09-27', '0001 Cemetery Lane', NULL, 'LA', 'New Orleans', '70122');

#### Adding Values into RT Medicaid Plan ####
Insert Into rt_medicaid_plan Values
	('LA05', 'Supplemental Security Income (SSI)', 18, 65, '800', 'N', NULL),
    ('LA10', 'Disabled Adult Children', 21, 26, '1200', 'N', NULL),
    ('LA15', 'Disabled Widows/Widowers and Divorced Spouses', 50, 65, '2500', 'N', 'F'),
    ('LA20', 'Early Widows/Widowers', 55, 65, '2000', 'N', 'F'),
    ('LA25', 'Pickle', 60, 100, '3500', 'Y', 'F'),
    ('LA30', 'State Retirees', 62, NULL, NULL, NULL, NULL),
    ('LA35', 'Medicaid Purchase Plan', 65, NULL, '1800', NULL, NULL),
    ('LA40', 'Provisional Medicaid', 18, 64, '2200', NULL, NULL),
    ('LA45', 'Family Opportunity Act Buy-In', 18, 64, '2500', NULL, NULL),
    ('LA50', 'Acute Care Hospital', 18, NULL, NULL, NULL, NULL),
    ('LA55', 'Act 421 Childrens Medicaid Option (TEFRA)', 0, 17, '1000', NULL, NULL),
    ('LA60', 'ABD Spend-Down Medically Needy', 0, 64, '2000', 'N', NULL),
    ('LA65', 'Category F Medicaid', 0, NULL, NULL, NULL, NULL),
    ('LA70', 'Category I Medicaid', 0, NULL, NULL, NULL, 'N'),
    ('LA75', 'Category O Medicaid', 0, NULL, NULL, NULL, 'N'),
    ('LA80', 'Category V Medicaid', 0, NULL, NULL, NULL, 'N'),
    ('LA85', 'Category C Medicaid', 0, NULL, NULL, NULL, NULL),
    ('LA90', 'ELE', 0, NULL, NULL, NULL, NULL),
    ('LA95', 'MAGI- Long Term Care', 0, NULL, NULL, NULL, NULL),
    ('LA100', 'Long Term Care', 65, NULL, NULL, NULL, NULL),
    ('LA105', 'Long Term Care Spend-Down', 65, NULL, NULL, NULL, NULL),
    ('LA110', 'LTC Co-Insurance', 65, NULL, NULL, NULL, NULL),
    ('LA115', 'LTC Co-Insurance Spend down', 65, NULL, NULL, NULL, NULL),
    ('LA120', 'Deemed Eligible Child', 0, 18, '1500', 'N', NULL),
    ('LA125', 'CHAMP Pregnant Women', 0, 64, '2000', 'Y', 'F'),
    ('LA130', 'LaCHIP', 0, 19, '2500', 'N', NULL),
    ('LA135', 'CHAMP Child', 0, 18, '1200', 'N', NULL),
    ('LA140', 'LaCHIP Phase 2 and 3', 0, 19, '2000', 'N', NULL),
    ('LA145', 'LaCHIP Affordable Plan', 0, 19, '1800', 'N', NULL),
    ('LA150', 'Parent/Caretaker Relative', 0, 19, '2500', 'N', NULL),
    ('LA155', 'Transitional Medicaid', 0, 64, NULL, NULL, NULL),
    ('LA160', 'ACA Adult Expansion', 18, 64, '2500', 'N', NULL),
    ('LA165', 'LaCHIP Phase IV - Prenatal Care', 0, 19, '1800', 'N', NULL),
    ('LA170', 'Regular Medically Needy', 0, 64, '2000', 'N', NULL),
    ('LA175', 'MAGI Spend-Down Medically Needy', 0, NULL, '2000', 'Y', 'F'),
    ('LA180', 'Qualified Medicare Beneficiary', 65, NULL, NULL, NULL, NULL),
    ('LA185', 'Specified Low-Income Medicare Beneficiary', 65, NULL, NULL, NULL, NULL),
    ('LA190', 'Qualified Individuals', 65, NULL, NULL, NULL, NULL),
    ('LA195', 'Qualified Disabled Working Individuals', 18, NULL, NULL, NULL, NULL),
    ('LA200', 'Low Income Subsidy', 65, NULL, NULL, NULL, NULL),
    ('LA205', 'Breast and Cervical Cancer', 18, NULL, NULL, NULL, NULL),
    ('LA210', 'Refugee Medical Assistance', 0, NULL, NULL, NULL, NULL),
    ('LA215', 'Emergency Services Only', 0, NULL, NULL, NULL, NULL),
    ('LA220', 'Former Foster Care Children', 18, 25, '1200', NULL, NULL),
    ('LA225', 'Refugee Cash Assistance', 0, NULL, NULL, NULL, NULL),
    ('LA230', 'Youth Aging Out of Foster Care', 18, 25, '2500', NULL, NULL),
    ('LA235', 'Tuberculosis Infected Individuals', 0, NULL, '1200', NULL, NULL),
    ('LA240', 'Take Charge Plus', 0, 64, '1200', NULL, NULL),
    ('LA245', 'Hospital Presumptive Eligibility-Former Foster Care', 18, 25, '2000', NULL, NULL),
    ('LA250', 'Hospital Presumptive Eligibility-CHAMP Child', 0, 19, '2000', NULL, NULL),
    ('LA255', 'Hospital Presumptive Eligibility-LaCHIP', 0, 19, '2500', NULL, NULL),
    ('LA260', 'Hospital Presumptive Eligibility-Pregnant Women', 0, 64, '2500', 'Y', 'F'),
    ('LA265', 'Hospital Presumptive Eligibility-Parent/Caretaker Relatives', 0, 64, '2500', NULL, NULL),
    ('LA270', 'Hospital Presumptive Eligibility-Breast and Cervical Cancer', 0, 64, '2000', NULL, NULL),
    ('LA275', 'Hospital Presumptive Eligibility-Take Charge Plus', 0, 64, '2500', NULL, NULL),
    ('LA280', 'Hospital Presumptive Eligibility-ACA Adult', 18, 64, '1200', NULL, NULL),
    ('LA285', 'FITAP', 0, NULL, 800, 'N', NULL),
    ('LA290', 'Adult Day Health Care (ADHC)', 18, 64, NULL, NULL, NULL),
    ('LA295', 'Community Choices Waiver (CC)', 18, NULL, NULL, NULL, NULL),
    ('LA300', 'New Opportunities Waiver (NOW)', 18, NULL, NULL, NULL, NULL),
    ('LA305', 'New Opportunities Waiver-Fund', 18, NULL, NULL, NULL, NULL),
    ('LA310', 'Childrens Choice Waiver (CCW)', 0, NULL, NULL, NULL, NULL),
    ('LA315', 'Supports Waiver (SW)', 0, NULL, NULL, NULL, NULL),
    ('LA320', 'Residential Options Waiver (ROW)', 21, NULL, NULL, NULL, NULL),
    ('LA325', 'Coordinated System of Care - Severely Emotionally Disturbed Waiver (CSoC-SED)', 18, NULL, NULL, NULL, NULL),
    ('LA330', 'PACE', 18, NULL, NULL, NULL, NULL),
    ('LA335', 'Act 421 Childrens Medicaid Option (CMO)', 0, 17, NULL, NULL, NULL),
    ('LA340', 'ADHC Waiver Spend-down MNP', 18, NULL, NULL, NULL, NULL),
    ('LA345', 'Community Choices Waiver Spend-down MNP', 65, NULL, '2000', NULL, NULL),
    ('LA350', 'New Opportunities Waiver Spend-down MNP', 65, NULL, '1200', NULL, NULL),
    ('LA355', 'Residential Options Waiver Spend-down MNP', 65, NULL, '2500', NULL, NULL),
    ('LA360', 'Supports Waiver Spend-down MNP', 55, NULL, '2000', NULL, NULL);

#### Adding Values into Individual ####
Insert into individual Values 
	(4580967, '222017069', 'Siobhan', 'S', 'Roy', '5042278212', 'sroy@gmail.com', '1990-05-08', 'F', 'Y', 'Parent', 'Y', '938985078', 'LA125'),
	(4582234, '222013326', 'Tom', NULL, 'Wambsgans', '5046934902', 'tomwam@gmail.com', '1989-08-03', 'M', 'N', 'Parent', 'Y', '938985078', 'LA35'),
	(4581235, '222014997', 'Peter', 'F', 'Griffin', '5040079235', 'peterygriffin@yahoo.com', '1959-07-11', 'M', 'N', NULL, 'Y', '938866730', 'LA30'),
	(4580009, '222013059', 'Lois', 'P', 'Griffin', '5047229835', 'thatgirllois@outlook.com', '1964-01-30', 'F', 'Y', NULL, 'N', '938706444', 'LA210'),
	(4587091, '222012023', 'Joe', NULL, 'Swanson', '9856130347', 'jswanson@gmail.com', '2000-02-22', 'M', 'N', 'Child', 'Y', '938632020', 'LA120'),
	(4583421, '222010987', 'Bonnie', NULL, 'Swanson', '9856930267', 'bswanson@gmail.com', '1971-12-21', 'F', 'N', 'Parent', 'Y', '938632020', 'LA150'),
	(4586919, '222009951', 'Glenn', NULL, 'Quagmire', '9857730187', 'glennq@aol.com', '1970-05-31', 'M', 'N', NULL, 'N', '938656722', 'LA225'),
	(4588625, '222008915', 'Cleveland', NULL, 'Brown', '9858530107', 'cleveeee@hotmail.com', '1968-05-31', 'M', 'N', 'Parent', 'Y', '938632020', 'LA150'),
	(4580331, '222007879', 'Cleveland', NULL, 'Brown Jr.', '2259330027', 'clevelandjunior@yahoo.com', '1988-06-13', 'M', 'N', NULL, 'N', '938576523', 'LA210'),
	(4582037, '222006843', 'Diane', NULL, 'Simmons', '2250129948', 'disimmons@outlook.com', '1995-06-15', 'F', 'N', 'Parent', 'Y', '938576523', 'LA150'),
	(4583743, '222005807', 'Thomas', NULL, 'Tucker', '2250929868', 'ttucker@gmail.com', '2017-02-23', 'M', 'N', 'Child', 'Y', '938576523', 'LA120'),
	(4585449, '222004771', 'Carter', NULL, 'Pewterschmidt', '2251729788', 'cartpewt@yahoo.com', '2023-04-10', 'M', 'N', 'Child', 'Y', '938576523', 'LA120'),
	(4587155, '222003735', 'Barbara', 'B', 'Pewterschmidt', '3372529708', 'babspewt@gmail.com', '2020-03-29', 'F', 'N', 'Child', 'Y', '938576523', 'LA120'),
	(4588861, '222002699', 'Stan', NULL, 'Smith', '3373329628', 'stantheman@gmail.com', '2015-03-12', 'M', 'N', 'Child', 'Y', '938576523', 'LA120'),
	(4580567, '222001663', 'Francine', NULL, 'Smith', '3374129549', 'frannyfran@outlook.com', '2001-09-17', 'F', 'N', 'Child', 'Y', '938632020', 'LA120'),
	(4582273, '222000627', 'Steven', 'A', 'Smith', '3374929469', 'stevenanita@gmail.com', '1999-10-30', 'M', 'N', 'Child', 'Y', '938632020', 'LA120'),
	(4583979, '222999591', 'Meg', NULL, 'Griffin', '3185729389', 'griffinmeg@aol.com', '1928-05-21', 'F', 'N', 'Spouse', 'Y', '938219788', 'LA100'),
	(4585685, '222998555', 'Terry', NULL, 'Bates', '3186529309', 'terryb@gmail.com', '1926-03-01', 'M', 'N', 'Spouse', 'Y', '938219788', 'LA100'),
	(4587391, '222997519', 'Greg', NULL, 'Corbin', '3187329229', 'gregtbaker@gmail.com', '1993-08-14', 'M', 'N', 'Parent', 'N', '938576523', 'LA150'),
	(4589097, '222996483', 'Hailey', NULL, 'Smith', '3188129150', 'hsmith@aol.com', '1920-05-17', 'F', 'Y', NULL, 'Y', '938000328', 'LA100');

#### Adding Values into Income ####
Insert into income Values
	(1001, 3500, 'Salary', 'Engineer', 'Y', 10000, 4580967),
	(1002, 2000, 'Salary', 'Teacher', 'Y', 5000, 4582234),
	(1003, 1500, 'Salary', 'Artist', 'N', NULL, 4581235),
	(1004, 2500, 'Salary', 'Doctor', 'Y', 800, 4580009),
	(1005, NULL, NULL, NULL, NULL, NULL, 4587091),
	(1006, 1800, 'Part-Time', 'Student', 'N', NULL, 4583421),
	(1007, 4000, 'Salary', 'Accountant', 'Y', 1000, 4586919),
	(1008, 2200, 'Salary', 'Manager', 'Y', 2500, 4588625),
	(1009, 2800, 'Salary', 'Waiter', 'Y', 300, 4580331),
	(1010, 3200, 'Salary', 'Engineer', 'Y', 3000, 4582037),
	(1011, NULL, NULL, NULL, NULL, NULL, 4583743),
	(1012, NULL, NULL, NULL, NULL, NULL, 4585449),
	(1013, NULL, NULL, NULL, NULL, NULL, 4587155),
	(1014, NULL, NULL, NULL, NULL, NULL, 4588861),
	(1015, NULL, NULL, NULL, NULL, NULL, 4580567),
	(1016, NULL, NULL, NULL, NULL, NULL, 4582273),
	(1017, 2800, 'Retirement', 'Retired', 'Y', 10000, 4583979),
	(1018, 3200, 'Retirement', 'Retired', 'N', NULL, 4585685),
	(1019, 1900, 'Part-Time', 'Student', 'Y', 1200, 4587391),
	(1020, 2300, 'Retirement', 'Retired', 'Y', 3000, 4589097);

#### Adding Values into Medicaid Summary ####
INSERT INTO medicaid_summary VALUES
	(2134,	"LA335",	4580967,     '2020-11-25', '2021-11-25',    'pending','Closed'),
	(2135,	"LA295",	4582234,    '2022-04-12',  '2023-04-12',	'pending',	'Ongoing'),
	(2136,	"LA250",	4581235,	'2022-09-07',	'2023-09-07',	'denied',	'Closed'),
	(2137,	"LA180",	4580009,	'2022-07-15',	'2023-07-15',	'approved',	'Closed'),
	(2138,	"LA225",	4587091,	'2021-10-31',	'2022-10-31',	'denied',	'Ongoing'),
	(2139,	"LA305",	4583421,	'2023-02-10',	'2024-02-10',	'approved',	'Closed'),
	(2140,	"LA110",	4586919,	'2021-11-17',	'2022-11-17',	'approved',	'Closed'),
	(2141,	"LA225",	4588625,	'2022-01-02',	'2023-01-02',	'denied',	'Ongoing'),
	(2142,	"LA230",	4580331,	'2020-03-20',	'2021-03-20',	'approved',	'Closed'),
	(2143,	"LA290",	4582037,	'2023-08-05',	'2024-08-05',	'approved',	'Closed'),
	(2144,	"LA160",	4583743,	'2020-05-13',	'2021-05-13',	'denied',	'Closed'),
	(2145,	"LA350",	4585449,	'2021-06-25',	'2022-06-25',	'pending',	'Closed'),
	(2146,	"LA295",	4587155,	'2021-01-15',	'2022-01-15',	'denied',	'Closed'),
	(2147,	"LA335",	4588861,	'2022-12-07',	'2023-12-07',	'approved',	'Closed'),
	(2148,	"LA230",	4580567,	'2020-08-11',	'2021-08-11',	'pending',	'Ongoing'),
	(2149,	"LA315",	4582273,	'2021-05-20',	'2022-05-20',	'approved',	'Closed'),
	(2150,	"LA85",	    4583979,	'2023-01-29',	'2024-01-29',	'approved',	'Closed'),
	(2151,	"LA275",	4585685,	'2020-09-10',	'2021-09-10',	'pending',	'Closed'),
	(2152,	"LA250",	4587391,	'2022-06-01',	'2023-06-01',	'approved',	'Ongoing'),
	(2153,	"LA110",	4589097,	'2021-03-10',	'2022-03-10',	'pending',	'Ongoing'),
	(2154,	"LA70",	4580967,	'2020-12-04',	'2021-12-04',	'approved',	'Ongoing'),
	(2155,	"LA205",	4582234,	'2023-03-16',	'2024-03-16',	'denied',	'Closed'),
	(2156,	"LA180", 4581235,	'2022-05-10',	'2023-05-10',	'approved',	'Closed'),
	(2157,	"LA295", 4580009,	'2022-08-25',	'2023-08-25',	'denied',	'Closed'),
	(2158,	"LA335",	4587091,	'2020-01-30',	'2021-01-30',	'approved',	'Ongoing'),
	(2159,	"LA85",	4583421,	'2021-01-22',	'2022-01-22',	'pending',	'Closed'),
	(2160,	"LA220",	4586919,	'2023-05-08',	'2024-05-08',	'approved',	'Closed'),
	(2161,	"LA265",	4588625,	'2022-04-08',	'2023-04-08',	'approved',	'Ongoing'),
	(2162,	"LA275",	4580331,	'2020-07-05',	'2021-07-05',	'pending',	'Closed'),
	(2163,	"LA335",	4582037,	'2020-06-15',	'2021-06-15',	'denied',	'Closed'),
	(2164,	"LA305",	4583743,	'2023-06-14',	'2024-06-14',	'approved',	'Closed'),
	(2165,	"LA125",	4585449,	'2022-03-01',	'2022-12-01',	'approved',	'Closed'),
	(2166,	"LA260",	4587155,	'2021-07-15',	'2022-04-15',	'approved',	'Ongoing'),
	(2167,	"LA55",	4580967,	'2020-06-15',	'2021-06-15',	'approved',	'Ongoing'),
	(2168,	"LA60",	4582234,	'2023-06-14',	'2024-06-14',	'approved',	'Ongoing'),
	(2169,	"LA65",	4581235,	'2022-03-01',	'2022-12-01',	'approved',	'Ongoing'),
	(2170,	"LA70",	4580009,	'2021-07-15',	'2022-04-15',	'approved',	'Ongoing'),
	(2171,	"LA75",	4587091,	'2020-06-15',	'2021-06-15',	'approved',	'Ongoing'),
	(2172,	"LA80",	4580967,	'2023-06-14',	'2024-06-14',	'approved',	'Ongoing'),
	(2173,	"LA85",	4582234,	'2022-03-01',	'2022-12-01',	'approved',	'Ongoing'),
	(2174,	"LA90",	4581235,	'2021-07-15',	'2022-04-15',	'approved',	'Ongoing'),
	(2175,	"LA95",	4580009,	'2020-06-15',	'2021-06-15',	'approved',	'Ongoing'),
	(2176,	"LA100",	4587091,	'2022-05-10',	'2023-05-10',	'approved',	'Ongoing'),
	(2177,	"LA105",	4580967,	'2022-08-25',	'2023-08-25',	'approved',	'Ongoing'),
	(2178,	"LA110",	4582234,	'2020-01-30',	'2021-01-30',	'approved',	'Ongoing'),
	(2179,	"LA115",	4581235,	'2021-01-22',	'2022-01-22',	'approved',	'Ongoing'),
	(2180,	"LA120",	4580009,	'2023-05-08',	'2024-05-08',	'approved',	'Ongoing'),
	(2181,	"LA125",	4587091,	'2022-04-08',	'2023-04-08',	'approved',	'Ongoing'),
	(2182,	"LA130",	4586919,	'2020-06-15',	'2022-04-15', 'approved',	'Ongoing'),
	(2183,	"LA135",	4588625,	'2023-06-14',	'2021-06-15',	'approved',	'Ongoing'),
	(2184,	"LA140",	4580331,	'2022-03-01',	'2024-06-14',	'denied',	'Closed'),
	(2185,	"LA145",	4582037,	'2021-07-15',	'2022-12-01',	'denied',	'Closed'),
	(2186,	"LA150",	4583743,	'2020-06-15',	'2022-04-15',	'denied',	'Closed'),
	(2187,	"LA155",	4585449,	'2023-06-14',	'2021-06-15',	'denied',	'Closed'),
	(2188,	"LA160",	4586919,	'2022-03-01',	'2023-05-10',	'denied',	'Closed'),
	(2189,	"LA165",	4588625,	'2021-07-15',	'2023-08-25',	'denied',	'Closed'),
	(2190,	"LA170",	4580331,	'2020-06-15',	'2021-01-30',	'denied',	'Closed'),
	(2191,	"LA175",	4582037,	'2022-05-10',	'2022-01-22',	'pending',	'Ongoing'),
	(2192,	"LA180",	4583743,	'2022-08-25',	'2024-05-08',	'pending',	'Ongoing'),
	(2193,	"LA185",	4585449,	'2020-01-30',	'2023-04-08',	'pending',	'Ongoing'),
	(2194,	"LA190",	4586919,	'2021-01-22',	'2022-04-15',	'pending',	'Ongoing'),
	(2195,	"LA195",	4588625,	'2023-05-08',	'2021-06-15',	'pending',	'Closed'),
	(2196,	"LA200",	4580331,	'2022-04-08',	'2024-06-14',	'pending',	'Closed'),
	(2197,	"LA205",	4582037,	'2020-06-15',	'2022-12-01',	'pending',	'Closed');
    
#### Adding Values into Correspondence ####

### Placeholder ###

################## Queries ##################

#### Query 1 ####
# Anytime that there is an update to contact information, account notes need to be 
# inserted into the account table and changes need to be logged separately. 
DROP TRIGGER IF EXISTS update_individual;
DROP TRIGGER IF EXISTS update_individual_address;
DROP TABLE IF EXISTS update_individual_log;
DROP TABLE IF EXISTS update_individual_address_log;

# Create update individual personal information log table
CREATE TABLE update_individual_log(
	Individual_ID int(11),
    updated_field CHAR(20),
    old_value CHAR(50),
    new_value CHAR(50), 
    update_time TIMESTAMP NOT NULL,
    PRIMARY KEY(update_time)
);

# Create update individual address information log table
CREATE TABLE update_individual_address_log(
	Account_ID int(11),
    updated_field CHAR(20),
    old_value VARCHAR(255),
    new_value VARCHAR(255), 
    update_time TIMESTAMP NOT NULL,
    PRIMARY KEY(update_time)
);

# Create trigger to update individual log whenever any personal information changes
delimiter $
CREATE TRIGGER update_individual
BEFORE UPDATE ON individual
FOR EACH ROW 
BEGIN
	# Logs any name change
	IF (old.First_Name <> new.First_Name OR old.Last_Name <> new.Last_Name) THEN
		INSERT INTO update_individual_log VALUES
			(old.Individual_ID, 'Name change', CONCAT(old.First_Name, ' ', old.Last_Name), CONCAT(new.First_Name, ' ', new.Last_Name), CURRENT_TIMESTAMP);
	# Logs phone number change
    ELSEIF (old.Phone_Num <> new.Phone_Num) THEN
		INSERT INTO update_individual_log VALUES
			(old.Individual_ID, 'Phone number change', old.Phone_Num, new.Phone_Num, CURRENT_TIMESTAMP);
	# Logs email change
	ELSEIF (old.Email <> new.Email) THEN
		INSERT INTO update_individual_log VALUES(
			old.Individual_ID, 'Email change', old.Email, new.Email, CURRENT_TIMESTAMP);
	END IF;
END; $

# Create trigger to update individual log whenever any address information changes
delimiter $
CREATE TRIGGER update_individual_address
BEFORE UPDATE ON account
FOR EACH ROW 
BEGIN
	# Logs any change to address
	IF (old.Addr_1 <> new.Addr_1 OR old.Addr_2 <> new.Addr_2 OR old.Addr_State <> new.Addr_State OR old.Addr_City <> new.Addr_City OR old.Addr_Zip <> new.Addr_Zip) THEN
		INSERT INTO update_individual_address_log VALUES
			(old.Account_Num, 'Address change', CONCAT(old.Addr_1, '', IFNULL(CONCAT(' ', old.Addr_2), ''), ', ', old.Addr_City, ', ', old.Addr_State, ', ', old.Addr_Zip),
				CONCAT(new.Addr_1, '', IFNULL(CONCAT(' ', new.Addr_2), ''), ', ', new.Addr_City, ', ', new.Addr_State, ', ', new.Addr_Zip), CURRENT_TIMESTAMP);
	END IF;
END; $

# Examples for each change in personal information
delimiter ;
UPDATE individual
SET Last_Name = 'Quagmire'
WHERE Individual_ID = 4580009;

DO SLEEP(1);

UPDATE individual
SET Phone_Num = '5043865555'
WHERE Individual_ID = 4580331;

DO SLEEP(1);

UPDATE individual
SET Email = 'frannyfran@gmail.com'
WHERE Individual_ID = 4580567;

UPDATE account
SET Addr_1 = '123 Main Street',
	Addr_2 = null,
    Addr_State = 'LA',
    Addr_City = 'New Orleans',
    Addr_Zip = '70123'
WHERE Account_Num = 938000328;

#### Query 2 ####
# Medicaid is interesting in exploring the demographics of Medicaid applicants. They want to explore 
# statistics regarding average age, age distribution, frequency of pregnant individuals.  

# Create a frequency distribution of female recipients who are/are not pregnant. 
SELECT Pregnancy_Indicator, COUNT(Pregnancy_Indicator) AS FREQUENCY FROM individual WHERE Sex = 'F' GROUP BY Pregnancy_Indicator; 

# Determine the average age of recipients based on dob. 
SELECT AVG(DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0) AS avg_age FROM individual;

# Create a grouped frequency distribution of number of recipients in different age brackets. 
SELECT
    CASE
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 19 THEN 'Under 19'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 19 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 26 THEN 'Between 19 and 25'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 26 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 36 THEN 'Between 26 and 35'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 36 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 51 THEN 'Between 36 and 50'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 51 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 66 THEN 'Between 51 and 65'
        ELSE '65 and older'
    END AS age_group,
    COUNT(*) AS frequency
FROM
    individual
GROUP BY
    CASE
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 19 THEN 'Under 19'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 19 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 26 THEN 'Between 19 and 25'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 26 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 36 THEN 'Between 26 and 35'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 36 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 51 THEN 'Between 36 and 50'
        WHEN DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 >= 51 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),dob)), '%Y')+0 < 66 THEN 'Between 51 and 65'
        ELSE '65 and older'
    END;
    
#### Query 3 ####
# The Medicaid website will display to applicants the top 3 plans that match their inputted information. 
# This is based on reported monthly income, age, sex, and if the individual is pregnant. These top 3 are 
# from the most frequently used by existing Medicaid recipients. 

# Test User - Adult Pregnant Female
SET @age := 35,
	@sex := 'F',
	@pregnancy_indicator := 'Y',
	@income := 2000;
    
# Another Test User - Child Male (If needed)
#SET @age := 17,
#	@sex := 'M',
#	@pregnancy_indicator := 'N',
#	@income := 1000;
    
# Joins two tables together and matches user with 3 most popular plans that fit his or her demographics. 
SELECT r.Plan_ID, r.Plan_Description, COUNT(i.Plan_ID) AS frequency 
FROM rt_medicaid_plan r
LEFT JOIN individual i ON r.Plan_ID = i.Plan_ID
WHERE @age >= IFNULL(r.Minimum_Age, @age) 
AND @age <= IFNULL(r.Maximum_Age, @age)
AND @sex = IFNULL(r.Sex, @sex)
AND @pregnancy_indicator = IFNULL(r.Pregnancy_Indicator, @pregnancy_indicator)
AND @income <= IFNULL(r.Maximum_Income, @income)
GROUP BY r.Plan_ID
ORDER BY frequency DESC
LIMIT 3
;
