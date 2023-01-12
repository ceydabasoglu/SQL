-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Member` (
  `MemberID` INT NOT NULL AUTO_INCREMENT,
  `MemberTCNO` VARCHAR(45) NOT NULL,
  `MemberName` VARCHAR(100) NOT NULL,
  `MemberSurname` VARCHAR(100) NOT NULL,
  `MemberGender` VARCHAR(45) NULL,
  `MemberE-mail` VARCHAR(200) NOT NULL,
  `MemberPhoneNumber` VARCHAR(45) NOT NULL,
  `MemberBirthDate` DATE NULL,
  `MemberJoinDate` DATE NOT NULL,
  `MemberLanguage` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`MemberID`),
  UNIQUE INDEX `MembersTCNO_UNIQUE` (`MemberTCNO` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Type` (
  `TypeID` INT NOT NULL AUTO_INCREMENT,
  `TypeName` VARCHAR(45) NOT NULL,
  `TypeOfToy` VARCHAR(45) NOT NULL,
  `TypeCategory` VARCHAR(45) NULL,
  PRIMARY KEY (`TypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Toy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Toy` (
  `ToyID` INT NOT NULL AUTO_INCREMENT,
  `ToyName` VARCHAR(45) NOT NULL,
  `ToyAgeRate` VARCHAR(45) NOT NULL,
  `ToyColor` VARCHAR(45) NULL,
  `Type_TypeID` INT NOT NULL,
  PRIMARY KEY (`ToyID`, `Type_TypeID`),
  INDEX `fk_Toy_Type1_idx` (`Type_TypeID` ASC) VISIBLE,
  CONSTRAINT `fk_Toy_Type1`
    FOREIGN KEY (`Type_TypeID`)
    REFERENCES `mydb`.`Type` (`TypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Login` (
  `LoginID` INT NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `LoginDate` DATE NOT NULL,
  `LoginAim` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LoginID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeName` VARCHAR(45) NOT NULL,
  `EmployeeSurname` VARCHAR(45) NOT NULL,
  `EmployeeTCNO` VARCHAR(45) NOT NULL,
  `EmployeeGender` VARCHAR(45) NULL,
  `EmployeePhoneNumber` VARCHAR(45) NOT NULL,
  `EmployeeBirthDate` DATE NOT NULL,
  `EmployeeDepartment` VARCHAR(45) NOT NULL,
  `EducationStatus` VARCHAR(45) NOT NULL,
  `EmployeeE-mail` VARCHAR(55) NOT NULL,
  `EmployeeSalary` INT NOT NULL,
  `Login_LoginID` INT NOT NULL,
  `EmployeeAddress` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `Login_LoginID`),
  INDEX `fk_Employee_Login1_idx` (`Login_LoginID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Login1`
    FOREIGN KEY (`Login_LoginID`)
    REFERENCES `mydb`.`Login` (`LoginID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rent` (
  `Member_MemberID` INT NOT NULL,
  `Toy_ToyID` INT NOT NULL,
  `RentID` VARCHAR(25) NOT NULL,
  `deliveryTime` DATE NOT NULL,
  `RecievedTime` DATE NOT NULL,
  `Employee_EmployeeID` INT NOT NULL,
  `Employee_Login_LoginID` INT NOT NULL,
  PRIMARY KEY (`Member_MemberID`, `Toy_ToyID`, `RentID`, `Employee_EmployeeID`, `Employee_Login_LoginID`),
  INDEX `fk_Member_has_Toy_Toy1_idx` (`Toy_ToyID` ASC) VISIBLE,
  INDEX `fk_Member_has_Toy_Member_idx` (`Member_MemberID` ASC) VISIBLE,
  INDEX `fk_Rent_Employee1_idx` (`Employee_EmployeeID` ASC, `Employee_Login_LoginID` ASC) VISIBLE,
  CONSTRAINT `fk_Member_has_Toy_Member`
    FOREIGN KEY (`Member_MemberID`)
    REFERENCES `mydb`.`Member` (`MemberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Member_has_Toy_Toy1`
    FOREIGN KEY (`Toy_ToyID`)
    REFERENCES `mydb`.`Toy` (`ToyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rent_Employee1`
    FOREIGN KEY (`Employee_EmployeeID` , `Employee_Login_LoginID`)
    REFERENCES `mydb`.`Employee` (`EmployeeID` , `Login_LoginID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `AddressType` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostCode` VARCHAR(45) NOT NULL,
  `Neighbourhood` VARCHAR(45) NOT NULL,
  `StreetName` VARCHAR(45) NOT NULL,
  `BuildingNumber` INT NOT NULL,
  `ResidenceNumber` INT NOT NULL,
  `AddressDescription` VARCHAR(150) NOT NULL,
  `Member_MemberID` INT NOT NULL,
  PRIMARY KEY (`AddressID`, `Member_MemberID`),
  INDEX `fk_Address_Member1_idx` (`Member_MemberID` ASC) VISIBLE,
  CONSTRAINT `fk_Address_Member1`
    FOREIGN KEY (`Member_MemberID`)
    REFERENCES `mydb`.`Member` (`MemberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
