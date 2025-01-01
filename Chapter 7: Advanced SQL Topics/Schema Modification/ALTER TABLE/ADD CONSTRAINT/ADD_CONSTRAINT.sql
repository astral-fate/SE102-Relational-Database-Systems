-- Create a "Book_ID" table that 
--     * Has a postive integer
--     * Maximum 5000 char

-- Create BOOK table
CREATE TABLE BOOK_ID (
    Book_ID INT
);

-- Insert sample data
INSERT INTO BOOK (Book_ID) VALUES (1);
INSERT INTO BOOK (Book_ID) VALUES (100);
INSERT INTO BOOK (Book_ID) VALUES (4999);

-- Add primary key and constraints
ALTER TABLE BOOK ADD Book_ID INT PRIMARY KEY;
ALTER TABLE BOOK ADD CONSTRAINT C CHECK(Book_ID>0 AND Book_ID<=5000);
