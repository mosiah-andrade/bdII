-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tropicana
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tropicana
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tropicana` DEFAULT CHARACTER SET utf8 ;
USE `tropicana` ;

-- -----------------------------------------------------
-- Table `tropicana`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`cargo` (
  `cbo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cbo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`funcionario` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `nomeSocial` VARCHAR(45) NULL DEFAULT NULL,
  `genero` CHAR(1) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  `status` TINYINT NOT NULL,
  `fg` DECIMAL(6,2) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`departamento` (
  `idDepartamento` INT NOT NULL,
  `nome` VARCHAR(25) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Gerente_cpf` VARCHAR(14) NULL DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Departamento_Funcionario1_idx` (`Gerente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Funcionario1`
    FOREIGN KEY (`Gerente_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`dependente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `genero` CHAR(1) NOT NULL,
  `parentesco` VARCHAR(15) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Dependente_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`endereco` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `comp` VARCHAR(45) NULL DEFAULT NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Funcionario_cpf`),
  INDEX `fk_Endereco_Funcionario_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Funcionario`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`ferias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`ferias` (
  `idFerias` INT NOT NULL AUTO_INCREMENT,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `addDecimal` TINYINT NOT NULL,
  `valor` DECIMAL(6,2) UNSIGNED ZEROFILL NOT NULL,
  `periodoAqt` INT NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idFerias`),
  INDEX `fk_Ferias_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Ferias_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`hospede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`hospede` (
  `cpf_passaporte` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `telefone` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`cpf_passaporte`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`reserva` (
  `idReserva` INT NOT NULL,
  `qtdHospedes` INT NOT NULL,
  `status` VARCHAR(15) NOT NULL,
  `dataEntrada` DATETIME NOT NULL,
  `dataSaída` DATETIME NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Responsavel_cpf_passaporte` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Reserva_Hospede1_idx` (`Responsavel_cpf_passaporte` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reserva_Hospede1`
    FOREIGN KEY (`Responsavel_cpf_passaporte`)
    REFERENCES `tropicana`.`hospede` (`cpf_passaporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`hospedagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`hospedagem` (
  `Reserva_idReserva` INT NOT NULL,
  `valorTotal` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  `checkIn` DATETIME NOT NULL,
  `checkOut` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Reserva_idReserva`),
  CONSTRAINT `fk_Hospedagem_Reserva1`
    FOREIGN KEY (`Reserva_idReserva`)
    REFERENCES `tropicana`.`reserva` (`idReserva`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`hospedar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`hospedar` (
  `Hospedagem_Reserva_idReserva` INT NOT NULL,
  `Hospede_cpf_passaporte` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`Hospedagem_Reserva_idReserva`, `Hospede_cpf_passaporte`),
  INDEX `fk_Hospedagem_has_Hospede_Hospede1_idx` (`Hospede_cpf_passaporte` ASC) VISIBLE,
  INDEX `fk_Hospedagem_has_Hospede_Hospedagem1_idx` (`Hospedagem_Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Hospedagem_has_Hospede_Hospedagem1`
    FOREIGN KEY (`Hospedagem_Reserva_idReserva`)
    REFERENCES `tropicana`.`hospedagem` (`Reserva_idReserva`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Hospedagem_has_Hospede_Hospede1`
    FOREIGN KEY (`Hospede_cpf_passaporte`)
    REFERENCES `tropicana`.`hospede` (`cpf_passaporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`incidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`incidente` (
  `idIncidente` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  `momento` DATETIME NOT NULL,
  `descricao` VARCHAR(280) NOT NULL,
  `Hospedagem_Reserva_idReserva` INT NOT NULL,
  PRIMARY KEY (`idIncidente`),
  INDEX `fk_Incidente_Hospedagem1_idx` (`Hospedagem_Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Incidente_Hospedagem1`
    FOREIGN KEY (`Hospedagem_Reserva_idReserva`)
    REFERENCES `tropicana`.`hospedagem` (`Reserva_idReserva`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`ocorrencia` (
  `idOcorrencia` INT NOT NULL,
  `dataHoraIni` DATETIME NOT NULL,
  `dataHoraFim` DATETIME NOT NULL,
  `tipo` VARCHAR(25) NOT NULL,
  `obs` VARCHAR(150) NULL DEFAULT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idOcorrencia`),
  INDEX `fk_Ocorrencia_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Ocorrencia_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`regponto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`regponto` (
  `idRegPonto` INT NOT NULL,
  `tipoES` VARCHAR(10) NOT NULL,
  `dataHora` DATETIME NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idRegPonto`),
  INDEX `fk_RegPonto_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_RegPonto_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`uh`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`uh` (
  `idUH` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valorDiaria` DECIMAL(6,2) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `qtdMaxHospedes` INT NOT NULL,
  PRIMARY KEY (`idUH`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`reserva_uh`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`reserva_uh` (
  `Reserva_idReserva` INT NOT NULL,
  `UH_idUH` INT NOT NULL,
  PRIMARY KEY (`Reserva_idReserva`, `UH_idUH`),
  INDEX `fk_Reserva_has_UH_UH1_idx` (`UH_idUH` ASC) VISIBLE,
  INDEX `fk_Reserva_has_UH_Reserva1_idx` (`Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_has_UH_Reserva1`
    FOREIGN KEY (`Reserva_idReserva`)
    REFERENCES `tropicana`.`reserva` (`idReserva`),
  CONSTRAINT `fk_Reserva_has_UH_UH1`
    FOREIGN KEY (`UH_idUH`)
    REFERENCES `tropicana`.`uh` (`idUH`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NULL DEFAULT NULL,
  `Departamento_idDepartamento` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idTelefone`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  INDEX `fk_Telefone_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Telefone_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `tropicana`.`departamento` (`idDepartamento`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Telefone_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tropicana`.`trabalhar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tropicana`.`trabalhar` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `Cargo_cbo` INT NOT NULL,
  `dataInicio` DATETIME NOT NULL,
  `dataFim` DATETIME NOT NULL,
  PRIMARY KEY (`Funcionario_cpf`, `Departamento_idDepartamento`, `Cargo_cbo`),
  INDEX `fk_Funcionario_has_Departamento_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Departamento_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Departamento_Cargo1_idx` (`Cargo_cbo` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_has_Departamento_Cargo1`
    FOREIGN KEY (`Cargo_cbo`)
    REFERENCES `tropicana`.`cargo` (`cbo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Funcionario_has_Departamento_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `tropicana`.`departamento` (`idDepartamento`),
  CONSTRAINT `fk_Funcionario_has_Departamento_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `tropicana`.`funcionario` (`cpf`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
