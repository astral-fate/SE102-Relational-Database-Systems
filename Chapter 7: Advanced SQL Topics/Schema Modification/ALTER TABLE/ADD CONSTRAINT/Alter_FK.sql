Create Book (
  Book_ id int PRIMARY KEY,
  Title VARCHAR(100),
  Publisher_name VARCHAR(300)
)

Create Book_Authors (
  Book_id int PRIMARY KEY,
  Author_name VARCHAR(100) PRIMARY KEY
)

-- Insert sample data into BOOK
INSERT INTO BOOK (Book_id, Title, Publisher_name) VALUES 
(1, 'Database Systems', 'Pearson'),
(2, 'SQL Basics', 'O''Reilly'),
(3, 'Data Mining', 'Wiley');

-- Insert sample data into BOOK_AUTHORS
INSERT INTO BOOK_AUTHORS (Book_id, Author_name) VALUES
(1, 'John Smith'),
(1, 'Jane Doe'),
(2, 'Mike Johnson'),
(3, 'Sarah Wilson');

Alter table Book_authors
add constraint FK Foreign Key (Bood_id) REFERENCES Book(Book_id) 
