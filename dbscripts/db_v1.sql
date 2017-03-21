##creating database medhelp
create database medhelp;

##selecting the current db...only after this the tables can be created or used from the current db
use medhelp;

##creating table login...sid is the unique identification id(not more than 10 digits) and type represents patient or physician
create table login(sid VARCHAR(10) NOT NULL, pswd VARCHAR(15) NOT NULL, type VARCHAR(10) NOT NULL, PRIMARY KEY(sid));


##creating table hospital for storing the details of the hospital...hid is the unique identification id(not more than 10 digits) of the hospital
create table hospital(hid VARCHAR(10) NOT NULL, hname VARCHAR(200) NOT NULL, address TEXT NOT NULL, hcity VARCHAR(100) NOT NULL, hstate VARCHAR(200) NOT NULL, hpin VARCHAR(6), hcontact INTEGER(10), details TEXT, PRIMARY KEY(hid));

##creating table physician for storing the details of the physician...where phid is the unique identification id(not more than 10 digits) of the ##physician and did is the id of the department(foreign key) and hid is the id of the hospital(foreign key) which help us fetch the corresponding data
##from the corresponding tables
create table physician(phid VARCHAR(10) NOT NULL, phname VARCHAR(200) NOT NULL, phcontact INTEGER(10), experience varchar(5), details TEXT,  did VARCHAR(10), hid VARCHAR(10) NOT NULL);

##creating table department for the type of department like EnT, General physician, etc...where did is the unique department identification id
create table department(did VARCHAR(10), dname VARCHAR(50));

##creating table patient containing the one time details of each patient...each record identified by a unique patient identification id....
##relwithHOF stands for relation with head of family
create table patient(paid VARCHAR(10) NOT NULL, pname VARCHAR(200) NOT NULL, age INTEGER(5) NOT NULL, gender VARCHAR(10) NOT NULL, pcity VARCHAR(100) NOT NULL, pcontact INTEGER(10), bloodgroup VARCHAR(5), allergies TEXT, diseasetype VARCHAR(500), relwithHOF VARCHAR(100), familyhistory TEXT);

##creating table pslot for storing the slots allocated to a particular patient
create table pslot(aid VARCHAR(10) NOT NULL, slot integer(1), paid VARCHAR(10) NOT NULL, phyid VARCHAR(10) NOT NULL, hid VARCHAR(10) NOT NULL, did VARCHAR(10));

##creating table dslot for storing the slots during which the doctor sits
create table dslot(slid VARCHAR(10) NOT NULL, phid VARCHAR(10) NOT NULL, start INTEGER(10) NOT NULL, finish INTEGER(10) NOT NULL, day VARCHAR(20));

##creating table patientMH for storing the medical history of the patient, i.e., the record of each visit to the doctor by the patient...bpsys stands ##for blood pressure systolic and bpdias for bp diastolic...bsugarlvl for blood sugar level....current and updated fields for telling about follow up ##or new
create table patientmh(recordid VARCHAR(10) NOT NULL, paid VARCHAR(10) NOT NULL, symptoms TEXT, test TEXT, medicine TEXT, comments TEXT, operation TEXT, bpsys INTEGER(5), bpdias INTEGER(5), bsugarlvl INTEGER(10), current INTEGER, updated INTEGER);
