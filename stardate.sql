-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema stardatedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stardatedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stardatedb` DEFAULT CHARACTER SET utf8 ;
USE `stardatedb` ;

-- -----------------------------------------------------
-- Table `stardatedb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stardatedb`.`users` (
  `id` BIGINT(255) NOT NULL,
  `name` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stardatedb`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stardatedb`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `distance` INT NULL,
  `diameter` INT NULL,
  `date` DATETIME NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stardatedb`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stardatedb`.`messages` (
  `id` INT NOT NULL,
  `message` LONGTEXT NULL,
  `location` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `user_id` BIGINT(255) NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_users_idx` (`user_id` ASC),
  INDEX `fk_posts_events1_idx` (`event_id` ASC),
  CONSTRAINT `fk_posts_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `stardatedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `stardatedb`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stardatedb`.`users_has_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stardatedb`.`users_has_events` (
  `user_id` BIGINT(255) NOT NULL,
  `event_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_users_has_events_events1_idx` (`event_id` ASC),
  INDEX `fk_users_has_events_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_users_has_events_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `stardatedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_events_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `stardatedb`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stardatedb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stardatedb`.`comments` (
  `id` INT NOT NULL,
  `comment` LONGTEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `user_id` BIGINT(255) NOT NULL,
  `message_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_users_idx` (`user_id` ASC),
  INDEX `fk_comments_messages1_idx` (`message_id` ASC),
  CONSTRAINT `fk_posts_users0`
    FOREIGN KEY (`user_id`)
    REFERENCES `stardatedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_messages1`
    FOREIGN KEY (`message_id`)
    REFERENCES `stardatedb`.`messages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
