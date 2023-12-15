-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema economius
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `economius` ;

-- -----------------------------------------------------
-- Schema economius
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `economius` DEFAULT CHARACTER SET utf8mb4 ;
USE `economius` ;

-- -----------------------------------------------------
-- Table `economius`.`insurance_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`insurance_type` (
  `insurance_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type_code` VARCHAR(2) NOT NULL,
  `type_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`insurance_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`event_money`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`event_money` (
  `event_money_id` INT(11) NOT NULL AUTO_INCREMENT,
  `insurance_type_id` INT(11) NOT NULL, 
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `money` INT(11) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`event_money_id`),
  INDEX `fk_event_money_insurance_type1_idx` (`insurance_type_id` ASC),
  CONSTRAINT `fk_event_money_insurance_type1`
    FOREIGN KEY (`insurance_type_id`)
    REFERENCES `economius`.`insurance_type` (`insurance_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`stock_industry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`stock_industry` (
  `stock_industry_id` INT(11) NOT NULL AUTO_INCREMENT,
  `industry` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`stock_industry_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`event_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`event_stock` (
  `event_stock_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `rate` INT(11) NULL DEFAULT NULL,
  `stock_industry_id` INT(11) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`event_stock_id`),
  INDEX `fk_event_stock_stock_industry1_idx` (`stock_industry_id` ASC),
  CONSTRAINT `fk_event_stock_stock_industry1`
    FOREIGN KEY (`stock_industry_id`)
    REFERENCES `economius`.`stock_industry` (`stock_industry_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`insurance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`insurance` (
  `insurance_id` INT(11) NOT NULL AUTO_INCREMENT,
  `insurance_type_id` INT(11) NOT NULL,
  `product_name` VARCHAR(100) NOT NULL,
  `product_code` VARCHAR(2) NOT NULL,
  `monthly_deposit` INT(11) NOT NULL,
  `guarantee_rate` INT(11) NOT NULL,
  PRIMARY KEY (`insurance_id`),
  INDEX `fk_insurance_insurance_type1_idx` (`insurance_type_id` ASC),
  CONSTRAINT `fk_insurance_insurance_type1`
    FOREIGN KEY (`insurance_type_id`)
    REFERENCES `economius`.`insurance_type` (`insurance_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`issue` (
  `issue_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type` TINYINT(4) NOT NULL,
  `country` VARCHAR(10) NOT NULL,
  `year` VARCHAR(30) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`issue_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`issue_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`issue_stock` (
  `issue_stock_id` INT(11) NOT NULL AUTO_INCREMENT,
  `issue_id` INT(11) NOT NULL,
  `asset_type` VARCHAR(10) NULL DEFAULT NULL,
  `asset_id` INT(11) NULL DEFAULT NULL,
  `change_unit` INT(11) NOT NULL,
  `change_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`issue_stock_id`),
  INDEX `fk_issue_stock_issue1_idx` (`issue_id` ASC),
  CONSTRAINT `fk_issue_stock_issue1`
    FOREIGN KEY (`issue_id`)
    REFERENCES `economius`.`issue` (`issue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`member` (
  `member_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) ,
  `nickname` VARCHAR(30) NOT NULL,
  `edit_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `join_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`), 
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`prev_issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`prev_issue` (
  `prev_issue_id` INT(11) NOT NULL AUTO_INCREMENT,
  `issue_id` INT(11) NOT NULL,
  `foretoken` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`prev_issue_id`),
  INDEX `fk_prev_issue_issue1_idx` (`issue_id` ASC),
  CONSTRAINT `fk_prev_issue_issue1`
    FOREIGN KEY (`issue_id`)
    REFERENCES `economius`.`issue` (`issue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`savings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`savings` (
  `savings_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `monthly_deposit` INT(11) NOT NULL,
  `finish_count` INT(11) NOT NULL,
  `finish_rate` INT(11) NOT NULL,
  PRIMARY KEY (`savings_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`stock` (
  `stock_id` INT(11) NOT NULL AUTO_INCREMENT,
  `stock_industry_id` INT(11) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `company` VARCHAR(255) NOT NULL,
  `initial_value` INT(11) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`stock_id`),
  INDEX `fk_stock_stock_industry1_idx` (`stock_industry_id` ASC),
  CONSTRAINT `fk_stock_stock_industry1`
    FOREIGN KEY (`stock_industry_id`)
    REFERENCES `economius`.`stock_industry` (`stock_industry_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `economius`.`volatile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `economius`.`volatile` (
  `volatile_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(50) NULL DEFAULT NULL,
  `initial_value` INT(11) NOT NULL,
  PRIMARY KEY (`volatile_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
