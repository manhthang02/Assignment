create database IF NOT EXISTS Testing_System_Assignment_1;
use Testing_System_Assignment_1;
create table Deparment (
DeparmentID tinyint auto_increment primary key,
DeparmentName varchar(30)
);
create table position (
positionID tinyint auto_increment primary key,
positionName varchar(30)
);
create table Account(
AccountID varchar(50) auto_increment unique key,
UseName varchar(30),
DeparmentID smallint ,
positionID smallint,
CreateDate date,
FOREIGN key(positionID) references position (positionID),
FOREIGN key(DeparmentID) references Deparment(DeparmentID)
);
create table `Group`(
GroupID tinyint auto_increment primary key,
GroupName varchar(30),
CreatorID smallint,
CreateDate date,
FOREIGN key (CreateDate) references Account(CreateDate)
);
create table GroupAccount(
GroupID smallint,
AccountID smallint,
JoinDate date,
FOREIGN key (GroupID) references `group`(GroupID),
FOREIGN key(AccountID) references account(AccountID)
);
create table TypeQuestion(
TypeID tinyint auto_increment primary key,
TypeName text
);
create table CategoryQuestion(
CategoryID tinyint auto_increment primary key,
CategoryName text
);


create table Question(
QuestionID smallint auto_increment primary key,
Content text,
CategoryID int,
TypeID int,
CreatorID int,
CreateDate date,
FOREIGN key(CategoryID) references CategoryQuestion(CategoryID),
FOREIGN key (TypeID) references TypeQuestion(TypeID),
FOREIGN key(CreatorID) references `Group`(CreatorID),
FOREIGN key (CreateDate) references `Group`(CreateDate)
);
create table Answer(
AnswerID tinyint auto_increment primary key,
Content text,
QuestionID int,
isCorrect Enum('true','falue'),
FOREIGN key(Content) references Question(Content),
FOREIGN key (QuestionID) references Question(QuestionID)
);
create table Exam(
ExamID tinyint auto_increment primary key,
Code int,
Title varchar(50),
CategoryID int,
Duration time,
CreatoriD int,
CreateDate date,
FOREIGN key (CategoryiD) references CategoryQuestion(CategoryID),
FOREIGN key (CreatorID) references `Group`(CreatorID),
FOREIGN key (CreateDate) references Account(CreatorID)
);
create table ExamQuestion(
ExamID tinyint,
QuestionID int,
FOREIGN key(ExamID) references Exam(ExamID),
FOREIGN key(QuestionID) references Question(QuestionID)
);
