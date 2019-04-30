CREATE DATABASE `cultivatedstrength` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

CREATE TABLE `employees` (
  `Emp ID` int(11) NOT NULL,
  `F Name` varchar(45) DEFAULT NULL,
  `L Name` varchar(45) DEFAULT NULL,
  `Position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Emp ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `fitnessclasses` (
  `Class ID` int(11) NOT NULL,
  `Class Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Class ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `gyms` (
  `Gym ID` int(11) NOT NULL,
  `Gym Name` varchar(45) DEFAULT NULL,
  `Gym Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Gym ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `managers` (
  `Emp ID` int(11) NOT NULL,
  `F Name` varchar(45) DEFAULT NULL,
  `L Name` varchar(45) DEFAULT NULL,
  `Title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Emp ID`),
  CONSTRAINT `empman` FOREIGN KEY (`Emp ID`) REFERENCES `employees` (`Emp ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `members` (
  `Mem ID` int(11) NOT NULL,
  `F Name` varchar(45) DEFAULT NULL,
  `L Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Phone Number` int(11) DEFAULT NULL,
  PRIMARY KEY (`Mem ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `trainers` (
  `T ID` int(11) NOT NULL,
  `F Name` varchar(45) DEFAULT NULL,
  `L Name` varchar(45) DEFAULT NULL,
  `Fitness Speciality` varchar(45) DEFAULT NULL,
  `Classes Taught` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`T ID`),
  CONSTRAINT `emptrain` FOREIGN KEY (`T ID`) REFERENCES `employees` (`Emp ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

