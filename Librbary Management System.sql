#T1
use library_management;
#Create lms_members
create table lms_members (
    member_id varchar(10) primary key,
    member_name varchar(30),
    city varchar(20),
    date_register date,
    date_expire date,
    membership_status varchar(15)
);
#Create lms_suppliers_details
create table lms_suppliers_details (
    supplier_id varchar(3) primary key,
    supplier_name varchar(30),
    address varchar(50),
    contact bigint,
    email varchar(30)
);
#Create lms_book_details
create table lms_book_details (
    book_code varchar(10) primary key,
    book_title varchar(50),
    category varchar(15),
    author varchar(30),
    publication varchar(30),
    publish_date date,
    book_edition int,
    price decimal(10,2),
    rack_num varchar(3),
    date_arrival date,
    supplier_id varchar(3),
    constraint fk_book_supplier
    foreign key (supplier_id)
    references lms_suppliers_details(supplier_id)
);
#Create lms_fine_details
create table lms_fine_details (
    fine_range varchar(3) primary key,
    fine_amount decimal(10,2)
);
#Create lms_book_issue
create table lms_book_issue (
    book_issue_no int primary key,
    member_id varchar(10),
    book_code varchar(10),
    date_issue date,
    date_return date,
    date_returned date,
    book_issue_status varchar(20),
    fine_range varchar(3),

    constraint fk_issue_member
    foreign key (member_id)
    references lms_members(member_id),

    constraint fk_issue_book
    foreign key (book_code)
    references lms_book_details(book_code),

    constraint fk_issue_fine
    foreign key (fine_range)
    references lms_fine_details(fine_range)
);
#Check that all 5 tables were created
show tables;
#T2
#insert 20 records into lms_members
insert into lms_members
(member_id, member_name, city, date_register, date_expire, membership_status)
values
('lm001', 'rahul', 'hyderabad', '2012-01-10', '2014-01-10', 'permanent'),
('lm002', 'priya', 'chennai', '2012-01-15', '2013-01-15', 'temporary'),
('lm003', 'arun', 'bangalore', '2012-01-20', '2014-01-20', 'permanent'),
('lm004', 'sneha', 'hyderabad', '2012-02-05', '2013-02-05', 'temporary'),
('lm005', 'kiran', 'vijayawada', '2012-02-12', '2014-02-12', 'permanent'),
('lm006', 'anjali', 'chennai', '2012-02-18', '2013-02-18', 'temporary'),
('lm007', 'ravi', 'hyderabad', '2012-02-25', '2014-02-25', 'permanent'),
('lm008', 'pooja', 'bangalore', '2012-02-28', '2013-02-28', 'temporary'),
('lm009', 'vamsi', 'chennai', '2012-03-05', '2014-03-05', 'permanent'),
('lm010', 'divya', 'hyderabad', '2012-03-10', '2013-03-10', 'temporary'),
('lm011', 'suresh', 'vijayawada', '2012-03-15', '2014-03-15', 'permanent'),
('lm012', 'meena', 'chennai', '2012-03-20', '2013-03-20', 'temporary'),
('lm013', 'ramesh', 'hyderabad', '2012-03-25', '2014-03-25', 'permanent'),
('lm014', 'kavya', 'chennai', '2012-04-02', '2013-04-02', 'temporary'),
('lm015', 'manoj', 'bangalore', '2012-04-10', '2014-04-10', 'permanent'),
('lm016', 'swathi', 'vijayawada', '2012-04-18', '2013-04-18', 'temporary'),
('lm017', 'naveen', 'hyderabad', '2012-04-25', '2014-04-25', 'permanent'),
('lm018', 'harini', 'chennai', '2012-05-02', '2013-05-02', 'temporary'),
('lm019', 'vikram', 'bangalore', '2012-05-10', '2014-05-10', 'permanent'),
('lm020', 'lakshmi', 'vijayawada', '2012-05-18', '2013-05-18', 'temporary');

#insert 20 records into lms_suppliers_details
insert into lms_suppliers_details
(supplier_id, supplier_name, address, contact, email)
values
('s01', 'abc books', 'hyderabad', 9876543210, 'abc@gmail.com'),
('s02', 'xyz books', 'chennai', 9876543211, 'xyz@gmail.com'),
('s03', 'prime books', 'bangalore', 9876543212, 'prime@gmail.com'),
('s04', 'national books', 'vijayawada', 9876543213, 'national@gmail.com'),
('s05', 'modern books', 'hyderabad', 9876543214, 'modern@gmail.com'),
('s06', 'sun books', 'chennai', 9876543215, 'sun@gmail.com'),
('s07', 'city books', 'bangalore', 9876543216, 'city@gmail.com'),
('s08', 'green books', 'vijayawada', 9876543217, 'green@gmail.com'),
('s09', 'star books', 'hyderabad', 9876543218, 'star@gmail.com'),
('s10', 'bright books', 'chennai', 9876543219, 'bright@gmail.com'),
('s11', 'classic books', 'bangalore', 9876543220, 'classic@gmail.com'),
('s12', 'royal books', 'vijayawada', 9876543221, 'royal@gmail.com'),
('s13', 'knowledge books', 'hyderabad', 9876543222, 'knowledge@gmail.com'),
('s14', 'readers books', 'chennai', 9876543223, 'readers@gmail.com'),
('s15', 'wisdom books', 'bangalore', 9876543224, 'wisdom@gmail.com'),
('s16', 'future books', 'vijayawada', 9876543225, 'future@gmail.com'),
('s17', 'classic publications', 'hyderabad', 9876543226, 'classicpub@gmail.com'),
('s18', 'new age books', 'chennai', 9876543227, 'newage@gmail.com'),
('s19', 'academic books', 'bangalore', 9876543228, 'academic@gmail.com'),
('s20', 'student books', 'vijayawada', 9876543229, 'student@gmail.com');

#insert 20 records into lms_book_details
insert into lms_book_details
(book_code, book_title, category, author, publication, publish_date, book_edition, price, rack_num, date_arrival, supplier_id)
values
('b001', 'python programming', 'computer', 'john smith', 'abc publications', '2020-01-10', 1, 450.00, 'r01', '2021-01-10', 's01'),
('b002', 'data science', 'computer', 'robert john', 'xyz publications', '2020-02-15', 2, 550.00, 'r02', '2021-02-15', 's02'),
('b003', 'database systems', 'computer', 'elmasri', 'prime publications', '2019-03-20', 3, 600.00, 'r03', '2021-03-20', 's03'),
('b004', 'machine learning', 'computer', 'tom mitchell', 'national publications', '2019-04-10', 2, 650.00, 'r04', '2021-04-10', 's04'),
('b005', 'web development', 'computer', 'jon duckett', 'modern publications', '2021-05-12', 1, 500.00, 'r05', '2021-06-12', 's05'),
('b006', 'operating systems', 'computer', 'galvin', 'sun publications', '2018-06-18', 5, 700.00, 'r06', '2021-07-18', 's06'),
('b007', 'computer networks', 'computer', 'forouzan', 'city publications', '2019-07-22', 4, 750.00, 'r07', '2021-08-22', 's07'),
('b008', 'artificial intelligence', 'computer', 'rich', 'green publications', '2020-08-15', 2, 800.00, 'r08', '2021-09-15', 's08'),
('b009', 'cloud computing', 'computer', 'rajkumar buyya', 'star publications', '2020-09-10', 1, 600.00, 'r09', '2021-10-10', 's09'),
('b010', 'cyber security', 'security', 'william stallings', 'bright publications', '2019-10-20', 3, 850.00, 'r10', '2021-11-20', 's10'),
('b011', 'java programming', 'computer', 'herbert schildt', 'classic publications', '2018-11-12', 8, 650.00, 'r11', '2021-12-12', 's11'),
('b012', 'c programming', 'computer', 'dennis ritchie', 'royal publications', '2017-12-15', 4, 400.00, 'r12', '2022-01-15', 's12'),
('b013', 'python basics', 'computer', 'mark lutz', 'knowledge publications', '2021-01-18', 3, 480.00, 'r13', '2022-02-18', 's13'),
('b014', 'software engineering', 'computer', 'ian sommerville', 'readers publications', '2018-02-20', 9, 720.00, 'r14', '2022-03-20', 's14'),
('b015', 'data analytics', 'computer', 'james evans', 'wisdom publications', '2020-03-25', 2, 580.00, 'r15', '2022-04-25', 's15'),
('b016', 'deep learning', 'computer', 'ian goodfellow', 'future publications', '2019-04-28', 1, 900.00, 'r16', '2022-05-28', 's16'),
('b017', 'computer graphics', 'computer', 'donald hearn', 'classic publications', '2017-05-30', 5, 620.00, 'r17', '2022-06-30', 's17'),
('b018', 'mobile computing', 'computer', 'jochen schiller', 'new age publications', '2018-06-15', 3, 680.00, 'r18', '2022-07-15', 's18'),
('b019', 'statistics', 'education', 'murray spiegel', 'academic publications', '2019-07-20', 6, 520.00, 'r19', '2022-08-20', 's19'),
('b020', 'discrete mathematics', 'education', 'kenneth rosen', 'student publications', '2020-08-25', 8, 590.00, 'r20', '2022-09-25', 's20');

#insert 20 records into lms_fine_details
insert into lms_fine_details
(fine_range, fine_amount)
values
('f01', 10.00),
('f02', 20.00),
('f03', 30.00),
('f04', 40.00),
('f05', 50.00),
('f06', 60.00),
('f07', 70.00),
('f08', 80.00),
('f09', 90.00),
('f10', 100.00),
('f11', 110.00),
('f12', 120.00),
('f13', 130.00),
('f14', 140.00),
('f15', 150.00),
('f16', 160.00),
('f17', 170.00),
('f18', 180.00),
('f19', 190.00),
('f20', 200.00);

#insert 20 records into lms_book_issue
insert into lms_book_issue
(book_issue_no, member_id, book_code, date_issue, date_return, date_returned, book_issue_status, fine_range)
values
(1, 'lm001', 'b001', '2022-01-05', '2022-01-15', '2022-01-14', 'book_return', 'f01'),
(2, 'lm002', 'b002', '2022-01-10', '2022-01-20', '2022-01-20', 'book_return', 'f02'),
(3, 'lm003', 'b003', '2022-01-15', '2022-01-25', '2022-01-27', 'book_return', 'f03'),
(4, 'lm004', 'b004', '2022-02-01', '2022-02-11', '2022-02-10', 'book_return', 'f04'),
(5, 'lm005', 'b005', '2022-02-05', '2022-02-15', null, 'book_issue', 'f05'),
(6, 'lm006', 'b006', '2022-02-10', '2022-02-20', '2022-02-22', 'book_return', 'f06'),
(7, 'lm007', 'b007', '2022-02-15', '2022-02-25', null, 'book_issue', 'f07'),
(8, 'lm008', 'b008', '2022-03-01', '2022-03-11', '2022-03-10', 'book_return', 'f08'),
(9, 'lm009', 'b009', '2022-03-05', '2022-03-15', null, 'book_issue', 'f09'),
(10, 'lm010', 'b010', '2022-03-10', '2022-03-20', '2022-03-25', 'book_return', 'f10'),
(11, 'lm011', 'b011', '2022-03-15', '2022-03-25', null, 'book_issue', 'f11'),
(12, 'lm012', 'b012', '2022-04-01', '2022-04-11', '2022-04-10', 'book_return', 'f12'),
(13, 'lm013', 'b013', '2022-04-05', '2022-04-15', null, 'book_issue', 'f13'),
(14, 'lm014', 'b014', '2022-04-10', '2022-04-20', '2022-04-19', 'book_return', 'f14'),
(15, 'lm015', 'b015', '2022-05-01', '2022-05-11', null, 'book_issue', 'f15'),
(16, 'lm016', 'b016', '2022-05-05', '2022-05-15', '2022-05-14', 'book_return', 'f16'),
(17, 'lm017', 'b017', '2022-05-10', '2022-05-20', null, 'book_issue', 'f17'),
(18, 'lm018', 'b018', '2022-06-01', '2022-06-11', '2022-06-12', 'book_return', 'f18'),
(19, 'lm019', 'b019', '2022-06-05', '2022-06-15', null, 'book_issue', 'f19'),
(20, 'lm020', 'b020', '2022-06-10', '2022-06-20', '2022-06-20', 'book_return', 'f20');

#1. display member id, member name, city and membership status for lifetime membership

select member_id, member_name, city, membership_status
from lms_members
where membership_status = 'Permanent';
#2. display member id and member name who have not returned the books
select m.member_id, m.member_name
from lms_members m
join lms_book_issue bi
on m.member_id = bi.member_id
where bi.book_issue_status = 'N';
#3. display member id and member name who have taken book code BL000002
select m.member_id, m.member_name
from lms_members m
join lms_book_issue bi
on m.member_id = bi.member_id
where bi.book_code = 'BL000002';
#4. display book code, book title and author of books whose author name begins with P
select book_code, book_title, author
from lms_book_details
where author like 'P%';
#5. display total number of Java books with alias NO_OF_BOOKS
select count(*) as no_of_books
from lms_book_details
where book_title like '%Java%';
#6. list category and number of books in each category with alias NO_OF_BOOKS
select category, count(*) as no_of_books
from lms_book_details
group by category;
#7. display number of books published by Prentice Hall with alias NO_OF_BOOKS
select count(*) as no_of_books
from lms_book_details
where publication = 'Prentice Hall';
#8.display book code and book title of books issued on 1st April 2012
select bd.book_code, bd.book_title
from lms_book_details bd
join lms_book_issue bi
on bd.book_code = bi.book_code
where bi.date_issue = '2012-04-01';
#9. display member id, member name, date of registration and membership status of members who registered before March 2012 and whose membership status is Temporary
select member_id, member_name, date_register, membership_status
from lms_members
where date_register < '2012-03-01'
and membership_status = 'Temporary';
#10. display member id, member name, date of registration and expiry date of members whose membership expiry date is before April 2013
select member_id, member_name, date_register, date_expire
from lms_members
where date_expire < '2013-04-01';
select * from lms_book_issue;
select * from lms_members;
select * from lms_book_details;