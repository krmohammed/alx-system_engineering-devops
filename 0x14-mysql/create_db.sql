-- creates a db

CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE IF NOT EXISTS nexus6 (
	id INT AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(255)
);

INSERT INTO nexus6 (name) VALUES ('Khalil');
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
