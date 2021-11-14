CREATE DATABASE library;
USE library;
CREATE TABLE Book_Details (
	Book_id TINYINT,
	Book_Name VARCHAR(20),
	Book_Author VARCHAR(30),
	Book_Price FLOAT,
	Publication_Year YEAR,
	Volume CHAR(10)
);
DESCRIBE Book_Details;
INSERT INTO Book_Details VALUE
	(4, 'DBMS', 'balguru swamy', 495.00,'2005', 'v5'),
	(5, 'Data Structure', 'Padma reddy', 595.00,'2017', 'v6');
SELECT * FROM Book_Details;
SELECT Book_Name FROM Book_Details WHERE publication_Year >= "2015";
SELECT * FROM Book_Details WHERE Book_Id = 1;
SELECT COUNT(*) FROM Book_Details;
ALTER TABLE Book_Details ADD COLUMN No_Of_Pages INT;
ALTER TABLE Book_Details DROP COLUMN No_Of_Pages;
ALTER TABLE Book_Details ADD COLUMN No_Of_Pages INT AFTER Book_Name;
ALTER TABLE Book_Details RENAME COLUMN Book_Price to Book_Amount;
ALTER TABLE Book_Details RENAME TO Books;
SELECT * FROM Books;
TRUNCATE Books;
DROP TABLE books;
DROP DATABASE library;

CREATE TABLE Book_Details (
	Book_id TINYINT,
	Book_Name VARCHAR(20) UNIQUE,
	Book_Author VARCHAR(30) NOT NULL,
	Book_Price FLOAT DEFAULT (500),
	Publication_Year YEAR CHECK(Publication_Year > "2000"),
	Volume CHAR(10),
    PRIMARY KEY(Book_Id)
);
DESCRIBE Book_Details;
INSERT INTO Book_Details VALUE
	(1, 'DBMS', 'balguru swamy', 495.00,'2005', 'v5'),
	(2, 'Data Structure', 'Padma reddy', 595.00,'2017', 'v6'),
    (3, 'Python', 'Padma reddy', 595.00,'2020', 'v6'),
    (4, 'jungle book', 'Rudyard Kipling', 501.00,'2110', 'v5');
SELECT * FROM Book_Details;

INSERT INTO Book_Details(Book_Id, Book_Name, Book_Author, Publication_Year) VALUE 
	(5, "C++", "Padma reddy", "2022");
INSERT INTO Book_Details(Book_Id, Book_Name, Book_Author, Publication_Year) VALUE 
	(6, "Micro processor", "Albert P Malbino", "2023");
    
SELECT * FROM Book_Details WHERE Volume IS NULL;
SELECT * FROM Book_Details WHERE Volume IS NOT NULL;

ALTER TABLE Book_Details MODIFY Book_Name VARCHAR(35) NOT NULL;

SELECT DISTINCT Book_Author FROM Book_Details;

-- todays
INSERT INTO Book_Details VALUE
	(7, 'Harry potter', 'J J Rollings', 495.00,'2010', 'v9'),
	(8, 'Snow White', 'Jackob Grimn', 654.00,'2017', 'v6'),
    (9, 'Broken Glass', 'Alain Mabanccku', 595.00,'2005', 'v7'),
    (10, 'A little life', ' Hanya Yanagihara', 501.00,'2015', 'v5'),
    (11, 'Chronicles', 'Bob Dylan', 758.00,'2004', 'v1'),
    (12, 'Darkmans', 'Nicola Barker', 890.00,'2007', 'v2'),
    (13, 'Light', 'M John Harrison', 250.00,'2010', 'v5'),
    (14, 'Bad Blood', 'Lorna Sage', 350.00,'2001', 'v7'),
    (15, 'The Cost of Living', 'Deborah Levy', 620.00,'2018', 'v5');
    
UPDATE Book_Details SET Volume = 'v1' WHERE Book_Id = 5;
UPDATE Book_Details SET Volume = 'v1' WHERE Book_Id = 6;

DELETE FROM Book_Details WHERE Book_id = 1;
SELECT * FROM Book_Details;
SELECT * FROM Book_Details ORDER BY Book_Price;
SELECT * FROM Book_Details ORDER BY Book_Price DESC;
SELECT * FROM Book_Details LIMIT 10;
SELECT * FROM Book_Details ORDER BY Book_Id DESC LIMIT 10;
SELECT * FROM Book_Details WHERE Book_Name IN('Bad Blood', 'Light', 'Darkmans');
SELECT * FROM Book_Details WHERE Book_Price BETWEEN 500 AND 700;
SELECT Book_Price AS Book_Amount FROM Book_DetaiLs WHERE Book_Price > 500;


select * from Book_Details;
SELECT * FROM Book_Details WHERE Book_Name LIKE '%potter';
SELECT * FROM Book_Details WHERE Book_Name LIKE 'THE%'; 
SELECT * FROM Book_Details WHERE Book_Name LIKE '%of%';
SELECT * FROM Book_Details WHERE Book_Name LIKE '_h%';
SELECT * FROM Book_Details WHERE Book_Name LIKE '___a_a%';

-- date and time function

SELECT CURDATE(); -- to get current date
SELECT CURTIME(); -- TO GET CURRENT TIME
SELECT NOW(); -- TO GET BOTH CURRENT DATE AAND TIME
SELECT DATE(NOW()); -- IT WILL EXTRACT ONLY DATE
SELECT TIME(NOW()); -- IT WILL EXTRACT ONLY TIME
SELECT DAYOFMONTH(NOW()); -- IT WILL EXTRACT  THE DAY OF MONTH
SELECT MONTH(NOW()); -- IT WILL GIVE THE MONTHS
SELECT YEAR(NOW()); -- IT WILL GIVE THE CURRENT YEAR
SELECT WEEK(NOW()); -- IT WILL GIVE THE NUMBER OF WEEK PASSED TILL NOW
SELECT DAYNAME(NOW()); -- IT WILL GIVE THE NAME OF TODAYS DAY
SELECT DAYOFWEEK(NOW()); -- IT WILL GIVE THE DAY NUMBER PASSED IN THE CURRENT WEEK
SELECT DAYOFYEAR(NOW()); -- IT WILL GIVE THE NUMBER OF DAYS PASSED IN CURRENT YEAR

-- AGREGATE FUNCTION

SELECT MAX(Book_Price) AS maximum FROM Book_Details; -- it will give the maximum price from the book_price
SELECT MIN(Book_Price) AS Minumum FROM Book_Details; -- it will give the minimum price from the book_price
SELECT AVG(Book_Price) AS average FROM Book_Details; -- it will give the average
SELECT SUM(Book_price) AS Total FROM Book_Details; -- it will give the total sum
SELECT COUNT(*) AS Total_count FROM Book_Details; -- it will give the total count


INSERT INTO Book_Details VALUE
	(16, 'Darkness to Light', 'J J Rollings', 495.00,'2010', 'v9'),
	(17, 'Listening, Learning And Leading', 'J J Rollings', 654.00,'2017', 'v6'),
    (18, 'We Are Displaced', 'Alain Mabanccku', 595.00,'2005', 'v7'),
    (19, 'I Am Malala', ' Hanya Yanagihara', 501.00,'2015', 'v5'),
    (20, 'Obama-The Call of History', 'Bob Dylan', 758.00,'2004', 'v1'),
    (21, 'Baburnama: Babur', 'Hanya Yanagihara', 890.00,'2007', 'v2'),
    (22, 'Mein Kampf: Adolf Hitler', 'M John Harrison', 250.00,'2010', 'v5'),
    (23, 'Utopia: Sir Thomas Moor', 'Hanya Yanagihara', 350.00,'2001', 'v7'),
    (24, 'Bisarjan: R.N.Tagore', 'Bob Dylan', 620.00,'2018', 'v5');
    
SELECT * FROM Book_Details;
SELECT Book_Author, COUNT(Book_Name) AS Count_Book_Author FROM Book_details GROUP BY Book_Author;
SELECT Book_Name, COUNT(Book_Price) AS Count_Book_Price FROM Book_Details GROUP BY Book_Price;
SELECT Publication_Year, COUNT(Book_Name)
 AS count_book_name, Book_Name
 FROM Book_Details
 WHERE Publication_Year > 2005 
 GROUP BY Publication_Year;
 
SELECT Book_Name, COUNT(Book_Name) AS Count_Book FROM Book_Details GROUP BY Book_Name;
SELECT Publication_Year, MAX(Book_Price) AS max_in_year FROM Book_Details GROUP BY Publication_Year;
SELECT Publication_Year, MIN(Book_Price) AS min_in_year FROM Book_Details GROUP BY Publication_year;
SELECT Book_Author, Publication_Year, COUNT(Book_Name) AS no_of_Book FROM Book_Details GROUP BY Book_Author, Publication_Year;
SELECT Publication_Year, MAX(Book_Price) as maximum, MAX(Book_Price) AS minimum FROM Book_Details GROUP BY Publication_Year;
SELECT Publication_Year,SUM(Book_Price) AS Total FROM Book_Details GROUP BY Publication_Year;
SELECT Publication_Year,SUM(Book_Price) AS Total From Book_Details GROUP BY Publication_Year ORDER BY Publication_Year;
SELECT Publication_Year, SUM(Book_Price) AS Total From Book_Details GROUP BY Publication_Year HAVING Publication_Year > 2005;
SELECT Volume, COUNT(Book_Name) AS Book_Count FROM Book_Details GROUP BY Volume HAVING Book_Count > 2;
SELECT Book_Name, MIN(Book_Price) AS minimum FROM Book_Details GROUP BY Book_Author HAVING minimum < 500;

