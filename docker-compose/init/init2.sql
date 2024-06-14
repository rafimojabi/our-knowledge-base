-- create databases
CREATE DATABASE IF NOT EXISTS `wiki3`;
CREATE DATABASE IF NOT EXISTS `flarum2`;

-- create root user and grant rights
CREATE USER 'adminuser'@'%' IDENTIFIED BY '123456';
GRANT ALL ON *.* TO 'adminuser'@'%' IDENTIFIED BY '123456';
