-- replica user setup

CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
