create database library;
use library;

create table Branch(
Branch_no int primary key, 
Manager_Id int,
Branch_address varchar(20),
Contact_no bigint
);

create table Employee(
Emp_Id int primary key, 
Emp_name varchar(20),
Position varchar(20),
Salary int,
Branch_no int,
foreign key (Branch_no) references Branch(Branch_no)
);

create table Books(
ISBN varchar(20) primary key,
Book_title varchar(50),
Category varchar(20),
Rental_Price int,
Status enum('yes','no'),
Author varchar(30),
Publisher varchar(50)
);

create table Customer(
Customer_Id int primary key,
Customer_name varchar(20),
Customer_address varchar(20),
Reg_date date
);

Create table  IssueStatus(Issue_id int primary key,
Issued_cust int,
foreign key (issued_cust) references Customer (Customer_id),
Issued_book_name varchar(50),
Issue_date date, 
Isbn_book varchar(50),
foreign key(Isbn_book) references Books(ISBN)
);

create table ReturnStatus(
Return_Id int primary key,
Return_cust varchar(20),
Return_book_name varchar(50),
Return_date date,
isbn_book2 varchar(20),
foreign key (isbn_book2) references Books(isbn)
);

-- Insert values into Branch table

insert into Branch(Branch_no,Manager_Id,Branch_address,Contact_no)
values
(1,101,'Hyderabad',9075381823),
(2,102,'Trivandrum',8129330133),
(3,103,'Mumbai',9446109734),
(4,104,'Chennai',9947183391),
(5,105,'Kolkata',9895391143);

select * from Branch;

-- Insert values into Employee table

insert into Employee(Emp_id,Emp_name ,Position,Salary,Branch_no)
values
(201,'Alice','Manager',80000,1),
(202,'Johnson','Librarian',55000,1),
(203,'Dean','Clerk',60000,2),
(204,'David','Accountant',41000,1),
(205,'Smriti','Library Assistant',32000,3),
(206,'Rohit','Librarian',44000,1),
(207,'Taylor','Library Assistant',42000,1),
(208,'James','Clerk',53000,4),
(209,'Virat','Cateloger',33000,5),
(210,'Siraj','Librarian',46000,1),
(211,'Basheer','Accountant',31000,2),
(212,'Priya','Library Assistant',22000,3),
(213,'Hannah','Librarian',34000,4);

select * from Employee;

-- Insert values into Books table

insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) values
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Fiction', 100, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-452-28423-4', '1984', 'Fiction', 150, 'yes', 'George Orwell', 'Secker & Warburg'),
('978-0-7432-7356-5', 'The Great Gatsby', 'Fiction', 120, 'no', 'F. Scott Fitzgerald', 'Charles Scribners Sons'),
('978-0-393-05889-6', 'Sapiens: A Brief History of Humankind', 'History', 200, 'yes', 'Yuval Noah Harari', 'Harper'),
('978-0-670-03282-1', 'Guns, Germs, and Steel', 'History', 180, 'yes', 'Jared Diamond', 'W.W. Norton'),
('978-0-141-04847-4', 'The Silk Roads: A New History of the World', 'History', 160, 'yes', 'Peter Frankopan', 'Bloomsbury'),
('978-0-316-76948-8', 'The Catcher in the Rye', 'Fiction', 130, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-670-82162-3', 'The Book Thief', 'Fiction', 140, 'yes', 'Markus Zusak', 'Knopf'),
('978-0-679-78161-9', 'Pride and Prejudice', 'Fiction', 110, 'yes', 'Jane Austen', 'T. Egerton'),
('978-0-679-76244-1', 'The Collected Poems of W.B. Yeats', 'Poems', 90, 'yes', 'W.B. Yeats', 'Scribner'),
('978-0-7432-7358-8', 'Steve Jobs', 'Biography', 250, 'yes', 'Walter Isaacson', 'Simon & Schuster'),
('978-0-375-50420-2', 'The Autobiography of Malcolm X', 'Autobiography', 220, 'yes', 'Malcolm X', 'Ballantine Books'),
('978-1-4767-2765-8', 'The Wright Brothers', 'Biography', 240, 'no', 'David McCullough', 'Simon & Schuster'),
('978-0-451-52919-3', 'Long Walk to Freedom', 'Autobiography', 230, 'yes', 'Nelson Mandela', 'Little, Brown and Company'),
('978-0-374-53012-4', 'Leaves of Grass', 'Poems', 100, 'yes', 'Walt Whitman', 'Dover Publications');

select * from books;


-- Insert values into Customer table

insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date) values
(1001, 'Aryan', '123 Main St', '2020-05-20'),
(1002, 'Justin', '456 Oak St', '2021-06-15'),
(1003, 'Stuart', '789 Pine St', '2022-01-10'),
(1004, 'Kelly', '101 Maple St', '2022-02-05'),
(1005, 'Kristie', '202 Birch St', '2022-03-20'),
(1006, 'Collins', '303 Cedar St', '2023-04-25'),
(1007, 'Robinson', '404 Spruce St', '2020-05-30'),
(1008, 'Grace', '505 Redwood St', '2023-06-10'),
(1009, 'Mark', '606 Sequoia St', '2023-07-15'),
(1010, 'Dominic', '707 Fir St', '2023-08-20'),
(1011, 'Nadal', '888 Elm St', '2022-11-11'),
(1012, 'Joe', '999 Pine St', '2020-09-09'),
(1013, 'Evans', '111 Maple St', '2022-02-28'),
(1014, 'Mathew', '222 Birch St', '2023-01-10'),
(1015, 'Alexander', '333 Cedar St', '2023-03-15');

select * from customer;


-- Insert values into IssueStatus table 

insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) values
(301,1002, 'To Kill a Mockingbird', '2023-05-20', '978-0-06-112008-4'),
(302, 1002, '1984', '2023-05-21', '978-0-452-28423-4'),
(303, 1003, 'The Great Gatsby', '2023-05-22', '978-0-7432-7356-5'),
(304, 1004, 'Sapiens: A Brief History of Humankind', '2023-06-01', '978-0-393-05889-6'),
(305, 1005, 'Guns, Germs, and Steel', '2023-06-02', '978-0-670-03282-1'),
(306, 1006, 'The Silk Roads: A New History of the World', '2023-06-03', '978-0-141-04847-4'),
(307, 1008, 'The Catcher in the Rye', '2023-06-04', '978-0-316-76948-8'),
(308, 1008, 'The Book Thief', '2023-06-05', '978-0-670-82162-3'),
(309, 1009, 'Pride and Prejudice', '2023-06-06', '978-0-679-78161-9'),
(310, 1010, 'The Collected Poems of W.B. Yeats', '2023-06-07', '978-0-679-76244-1'),
(311, 1011, 'Steve Jobs', '2023-06-08', '978-0-7432-7358-8'),
(312, 1011, 'The Autobiography of Malcolm X', '2023-06-09', '978-0-375-50420-2'),
(313, 1013, 'The Wright Brothers', '2023-06-10', '978-1-4767-2765-8'),
(314, 1014, 'Long Walk to Freedom', '2023-06-11', '978-0-451-52919-3'),
(315, 1015, 'Leaves of Grass', '2023-06-12', '978-0-374-53012-4');

select * from IssueStatus;

-- Insert values into ReturnStatus table 

insert into  (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) values
(401, 1002, 'To Kill a Mockingbird', '2023-05-30', '978-0-06-112008-4'),
(402, 1002, '1984', '2023-05-31', '978-0-452-28423-4'),
(403, 1003, 'The Great Gatsby', '2023-06-01', '978-0-7432-7356-5'),
(404, 1004, 'Sapiens: A Brief History of Humankind', '2023-06-10', '978-0-393-05889-6'),
(405, 1005, 'Guns, Germs, and Steel', '2023-06-11', '978-0-670-03282-1'),
(406, 1006, 'The Silk Roads: A New History of the World', '2023-06-12', '978-0-141-04847-4'),
(407, 1008, 'The Catcher in the Rye', '2023-06-13', '978-0-316-76948-8'),
(408, 1008, 'The Book Thief', '2023-06-14', '978-0-670-82162-3'),
(409, 1009, 'Pride and Prejudice', '2023-06-15', '978-0-679-78161-9'),
(410, 1010, 'The Collected Poems of W.B. Yeats', '2023-06-16', '978-0-679-76244-1'),
(411, 1011, 'Steve Jobs', '2023-06-17', '978-0-7432-7358-8'),
(412, 1011, 'The Autobiography of Malcolm X', '2023-06-18', '978-0-375-50420-2'),
(413, 1013, 'The Wright Brothers', '2023-06-19', '978-1-4767-2765-8'),
(414, 1014, 'Long Walk to Freedom', '2023-06-20', '978-0-451-52919-3'),
(415, 1015, 'Leaves of Grass', '2023-06-21', '978-0-374-53012-4');

select * from ReturnStatus;


-- Retrieve the book title, category, and rental price of all available books.
select Book_title,Category,Rental_Price 
from Books 
where status='yes';

-- List the employee names and their respective salaries in descending order of salary.
select Emp_name as 'Employee name',Salary 
from Employee 
order by Salary desc;

-- Retrieve the book titles and the corresponding customers who have issued those books.
select c.Customer_name as 'Customer name',i.Issued_book_name as 'Book issued'
from Customer c 
right join IssueStatus i on c.Customer_id = i.Issued_cust;

-- Display the total count of books in each category.
select Category, COUNT(*) as 'no.of books' 
FROM Books  
group by Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name as name,Position 
from Employee 
where salary>50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet.
select c.Customer_name as 'customer name'
from Customer c
left join IssueStatus i on c.Customer_Id = i.Issued_cust
where i.Issued_cust is null
and c.Reg_date < '2022-01-01';

-- Display the branch numbers and the total count of employees in each branch.
select  B.Branch_no,count(E.Emp_id) as 'no.of employees' 
from  Branch B 
left join Employee E on B.Branch_no=E.Branch_no 
group by Branch_no;

-- Display the names of customers who have issued books in the month of June 2023.

select c.customer_name 
from customer c 
join issuestatus i on c.customer_id = i.issued_cust 
where i.issue_date between '2023-06-01' and '2023-06-30';


-- Retrieve book_title from book table containing history.
select Book_title 
from Books 
where Category='history';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select b.Branch_no,Branch_address as branch_name,count(e.Emp_id) as 'employee count'
from Branch b 
left join Employee e on b.Branch_no=e.Branch_no 
Group by Branch_no,B.Branch_address
having count(E.Emp_id)>5;



