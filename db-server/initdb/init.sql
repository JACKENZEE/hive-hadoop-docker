CREATE DATABASE IF NOT EXISTS metastore default character set 'latin1';
USE metastore;
CREATE USER IF NOT EXISTS 'hiveuser'@'%' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'hiveuser'@'%';
FLUSH  PRIVILEGES;