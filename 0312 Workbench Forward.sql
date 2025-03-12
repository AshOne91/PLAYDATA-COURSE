-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`subject`
-- -----------------------------------------------------
drop table if exists project.subject;
CREATE TABLE `project`.`subject` (
  `subject_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`subject_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`students`
-- -----------------------------------------------------
drop table if exists project.students;
CREATE TABLE  `project`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`student_subject`
-- -----------------------------------------------------
drop table if exists project.student_subject;
CREATE TABLE  `project`.`student_subject` (
  `student_subject_id` INT NOT NULL AUTO_INCREMENT,
  `score` INT NULL,
  `students_student_id` INT NOT NULL,
  `subject_subject_id` INT NOT NULL,
  PRIMARY KEY (`student_subject_id`, `students_student_id`, `subject_subject_id`),
  INDEX `fk_student_subject_students_idx` (`students_student_id` ASC) VISIBLE,
  INDEX `fk_student_subject_subject1_idx` (`subject_subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_subject_students`
    FOREIGN KEY (`students_student_id`)
    REFERENCES `project`.`students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_subject_subject1`
    FOREIGN KEY (`subject_subject_id`)
    REFERENCES `project`.`subject` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `project` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from students;
