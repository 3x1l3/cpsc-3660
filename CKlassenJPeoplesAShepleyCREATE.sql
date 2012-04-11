create database exile_3660;
CREATE USER 'exile_3660'@'localhost' IDENTIFIED BY '3660pr0j3ct';
GRANT ALL PRIVILEGES ON exile_3660.* TO 'exile_3660'@'localhost' WITH GRANT OPTION;
use exile_3660;

create table organization (ID int (11) not null auto_increment,
summary text not null,
name varchar(255),
primary key (ID)
) engine=innodb auto_increment=1;

create table client (
ID int (11) not null auto_increment, name varchar(255) not null, 
sex enum('male', 'female') not null,
age int(11) not null,
orgID int (11) default null,
added_date date not null,
summary text not null, 
primary key(ID), 
foreign key 
(orgID) 
references 
organization 
(ID) 
on delete restrict on update cascade) engine=innodb auto_increment=1;


create table users(
ID int(11) not null auto_increment,
username varchar(255) not null,
name varchar(255) not null,
password varchar(255) not null,
admin_level int(11) not null,
primary key(ID)
)
engine=innodb
auto_increment=1;


create table commrecord(
ID int (11) not null auto_increment,
userID int (11) not null,
clientID int (11) not null,
summary text not null,
medium enum('phone_call', 'text_message', 'email', 'in_person', 

'voice_mail', 'postal_letter', 'video_conference', 'instant_messenger') not null,
date date not null,
primary key(userID, clientID),
key ID (ID),
foreign key(userID) references users (ID) on delete restrict on update cascade,
foreign key(clientID) references client (ID) on delete restrict on update cascade
)
engine=innodb
auto_increment=1;



create table customer (
ID int (11) not null auto_increment,
total_sales decimal(10,2) not null,
amount_owing decimal(10,2) not null,
last_transaction_date date not null,
name varchar(255),
primary key (ID)
)
engine=innodb
auto_increment=1;


create table supplier(
ID int (11) not null auto_increment,
owing decimal(10,2) not null,
amount_purchased decimal(10,2) not null,
last_transaction_date date not null,
name varchar(255),
primary key (ID)
)
engine=innodb
auto_increment=1;


create table partner(
ID int (11) not null auto_increment,
contract_start date not null,
contract_end date not null,
venture_info text not null,
name varchar(255),
primary key (ID)
)
engine=innodb
auto_increment=1;


create table association(
ID int (11) not null auto_increment,
clientID int(11)not null,
description text not null,
customerID int(11) default null,
supplierID int(11) default null,
partnerID int(11) default null,
primary key (ID),
foreign key (clientID) references client (ID) on delete restrict on update cascade,
foreign key (customerID) references customer (ID) on delete restrict on update cascade,
foreign key (supplierID) references supplier (ID) on delete restrict on update cascade,
foreign key (partnerID) references partner (ID) on delete restrict on update cascade)
engine=innodb
auto_increment=1;


insert into customer values ('0','0','0','0000-00-00','NULL (default)');
update customer set ID = 0 where name="NULL (default)";

insert into partner values ('0','0','0','0000-00-00','NULL (default)');
update partner set ID = 0 where name="NULL (default)";

insert into supplier values ('0','0','0','0000-00-00','NULL (default)');
update supplier set ID = 0 where name="NULL (default)";

insert into users values ('0', 'Admin', 'AdminName', 'password', '10');
update supplier set ID = 0 where name="Admin";
