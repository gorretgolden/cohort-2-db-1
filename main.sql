CREATE DATABASE library;

/*create libraries table*/
CREATE TABLE libraries(
    id int auto_increment primary key,
    name varchar(30) not null
  
);

/*create shifts table*/
CREATE TABLE shifts(
    id int auto_increment primary key,
    name varchar(30) not null
);

/*create librarians table*/
CREATE TABLE librarians(
    id int auto_increment primary key,
    name varchar(30) not null,
    email varchar(30) UNIQUE not null,
    contact varchar(30) UNIQUE  not null,
    shiftId int not null,
    libraryId int not null,
    FOREIGN KEY (ShiftId) REFERENCES shifts(id),
    FOREIGN KEY (libraryId) REFERENCES libraries(id)
);



/*create authors table*/
CREATE TABLE authors(
    id int auto_increment primary key,
    name varchar(30) not null,
    email varchar(100) unique not null,
    contact varchar(30) unique not null,
    bio varchar(100) not null,
);

/*create publishing companies table*/
CREATE TABLE publishing_companies(
    id int auto_increment primary key,
    name varchar(30) not null

);


/*create books table*/
CREATE TABLE books(
    id int auto_increment primary key,
    authorId int  not null,
    publishingCompanyId int not null,
    libraryId int not null,
    title varchar(100) not null,
    price INT not null,
    description varchar(100) not null,
    image varchar(255) null,
    isbn_number int not null UNIQUE,
    publish_date varchar(100) not null,
    FOREIGN KEY (libraryId) REFERENCES libraries(id),
    FOREIGN KEY (authorId) REFERENCES authors(id),
    FOREIGN KEY (publishingCompanyId) REFERENCES publishing_companies(id)


);

CREATE TABLE borrowers(
  id int auto_increment primary key,
  bookId int,
  name varchar(100) not null,
  contact int  unique not null,
  address varchar(100)  not null,
  dateOfBorrowing varchar(255) not null,
  dateOfReturn varchar(255) not null,
     isReturned boolean default 0,
  FOREIGN KEY (bookId) REFERENCES books(id)
);