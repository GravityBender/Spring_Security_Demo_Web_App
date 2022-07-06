DROP DATABASE IF EXISTS `spring_security_demo`;

CREATE DATABASE IF NOT EXISTS `spring_security_demo`;
USE `spring_security_demo`;

DROP TABLE IF EXISTS `users`;
-- CREATE TABLE `users` (
-- 	`username` varchar(50) NOT NULL,
--     `password` varchar(50) NOT NULL,
--     `enabled` tinyint(1) NOT NULL,
--     PRIMARY KEY(`username`)
-- )ENGINE = InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users`(
	`username` varchar(50) NOT NULL,
    `password` char(68) NOT NULL,
    `enabled` tinyint(1) NOT NULL,
    PRIMARY KEY(`username`)
)ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- INSERT INTO `users` VALUES
-- ('John', '{noop}password1', 1),
-- ('Mary', '{noop}password2', 1),
-- ('Susan', '{noop}password3', 1);

INSERT INTO `users` VALUES
('John', '{bcrypt}$2a$10$Asemvf02CaSA6HjlpIdz3.OBccijTFRYKXhNs3XahDKoW81B3IpV2', 1),
('Mary', '{bcrypt}$2a$10$37xqzQv1ABI1uZugeN0fXe8mt9678cisWui2N4jpHsEjuw8dfxMH.', 1),
('Susan', '{bcrypt}$2a$10$qXcNjeJf1d/FkIX2yMhVfuzBQqRxi4tiu/ZY6FpTF.iVeiRv6mPb6', 1);

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`(
	`username` varchar(50) NOT NULL,
    `authority` varchar(50) NOT NULL,
    UNIQUE KEY `authorities_idx_1`(`username`, `authority`),
    CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`)
    REFERENCES `users`(`username`)
)ENGINE = InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` VALUES
('John', 'ROLE_EMPLOYEE'),
('Mary', 'ROLE_EMPLOYEE'),
('Mary', 'ROLE_MANAGER'),
('Susan', 'ROLE_EMPLOYEE'),
('Susan', 'ROLE_ADMIN');
