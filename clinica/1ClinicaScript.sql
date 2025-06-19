
CREATE SCHEMA IF NOT EXISTS `clinicadb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clinicadb` ;

-- -----------------------------------------------------
-- Table `clinicadb`.`dentista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`dentista` (
  `idDentista` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `especialidade` VARCHAR(100) NULL DEFAULT NULL,
  `CFO` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idDentista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`funcionario` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `CPF` VARCHAR(14) NULL DEFAULT NULL,
  `dataNasc` DATE NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `cargo` VARCHAR(50) NULL DEFAULT NULL,
  `salario` DECIMAL(10,2) NULL DEFAULT NULL,
  `status` VARCHAR(20) NULL DEFAULT NULL,
  `rua` VARCHAR(100) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `UF` CHAR(2) NULL DEFAULT NULL,
  `CEP` VARCHAR(10) NULL DEFAULT NULL,
  `complemento` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`clinica` (
  `idClinica` INT NOT NULL,
  `nomeFantasia` VARCHAR(100) NULL DEFAULT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `CNPJ` VARCHAR(20) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `horarioFuncionamento` VARCHAR(100) NULL DEFAULT NULL,
  `rua` VARCHAR(100) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `UF` CHAR(2) NULL DEFAULT NULL,
  `CEP` VARCHAR(10) NULL DEFAULT NULL,
  `complemento` VARCHAR(100) NULL DEFAULT NULL,
  `dentista_idDentista` INT NOT NULL,
  PRIMARY KEY (`idClinica`),
  INDEX `fk_clinica_dentista1_idx` (`dentista_idDentista` ASC) VISIBLE,
  CONSTRAINT `fk_clinica_dentista1`
    FOREIGN KEY (`dentista_idDentista`)
    REFERENCES `clinicadb`.`dentista` (`idDentista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`endereco` (
  `idEndereco` INT NOT NULL,
  `rua` VARCHAR(100) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `UF` CHAR(2) NULL DEFAULT NULL,
  `CEP` VARCHAR(10) NULL DEFAULT NULL,
  `complemento` VARCHAR(100) NULL DEFAULT NULL,
  `dentista_idDentista` INT NOT NULL,
  `funcionario_idFuncionario` INT NOT NULL,
  `clinica_idClinica` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_endereco_dentista1_idx` (`dentista_idDentista` ASC) VISIBLE,
  INDEX `fk_endereco_funcionario1_idx` (`funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_endereco_clinica1_idx` (`clinica_idClinica` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_dentista1`
    FOREIGN KEY (`dentista_idDentista`)
    REFERENCES `clinicadb`.`dentista` (`idDentista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_funcionario1`
    FOREIGN KEY (`funcionario_idFuncionario`)
    REFERENCES `clinicadb`.`funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_clinica1`
    FOREIGN KEY (`clinica_idClinica`)
    REFERENCES `clinicadb`.`clinica` (`idClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`paciente` (
  `idPaciente` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `CPF` VARCHAR(14) NULL DEFAULT NULL,
  `dataNasc` DATE NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `historico` TEXT NULL DEFAULT NULL,
  `rua` VARCHAR(100) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `UF` CHAR(2) NULL DEFAULT NULL,
  `CEP` VARCHAR(10) NULL DEFAULT NULL,
  `complemento` VARCHAR(100) NULL DEFAULT NULL,
  `endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `fk_paciente_endereco1_idx` (`endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_endereco1`
    FOREIGN KEY (`endereco_idEndereco`)
    REFERENCES `clinicadb`.`endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`agendamento` (
  `idAgendamento` INT NOT NULL AUTO_INCREMENT,
  `dataHora` DATETIME NULL DEFAULT NULL,
  `idPaciente` INT NULL DEFAULT NULL,
  `idDentista` INT NULL DEFAULT NULL,
  `idFuncionario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idAgendamento`),
  INDEX `idPaciente` (`idPaciente` ASC) VISIBLE,
  INDEX `idDentista` (`idDentista` ASC) VISIBLE,
  INDEX `idFuncionario` (`idFuncionario` ASC) VISIBLE,
  CONSTRAINT `agendamento_ibfk_1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinicadb`.`paciente` (`idPaciente`),
  CONSTRAINT `agendamento_ibfk_2`
    FOREIGN KEY (`idDentista`)
    REFERENCES `clinicadb`.`dentista` (`idDentista`),
  CONSTRAINT `agendamento_ibfk_3`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `clinicadb`.`funcionario` (`idFuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`faturamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`faturamento` (
  `idFaturamento` INT NOT NULL,
  `idPaciente` INT NULL DEFAULT NULL,
  `valorTotal` DECIMAL(10,2) NULL DEFAULT NULL,
  `statusPag` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idFaturamento`),
  INDEX `idPaciente` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `faturamento_ibfk_1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinicadb`.`paciente` (`idPaciente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`labexterno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`labexterno` (
  `idLaboratorio` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `idEndereco` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idLaboratorio`),
  INDEX `idEndereco` (`idEndereco` ASC) VISIBLE,
  CONSTRAINT `labexterno_ibfk_1`
    FOREIGN KEY (`idEndereco`)
    REFERENCES `clinicadb`.`endereco` (`idEndereco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`procedimentoodont`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`procedimentoodont` (
  `idProcedimento` INT NOT NULL,
  `nomeProcedimento` VARCHAR(100) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `valor` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idProcedimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`receita` (
  `idReceita` INT NOT NULL,
  `categoria` VARCHAR(50) NULL DEFAULT NULL,
  `tipo` VARCHAR(50) NULL DEFAULT NULL,
  `valor` DECIMAL(10,2) NULL DEFAULT NULL,
  `paciente_idPaciente` INT NOT NULL,
  PRIMARY KEY (`idReceita`),
  INDEX `fk_receita_paciente1_idx` (`paciente_idPaciente` ASC) VISIBLE,
  CONSTRAINT `fk_receita_paciente1`
    FOREIGN KEY (`paciente_idPaciente`)
    REFERENCES `clinicadb`.`paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`registroclin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`registroclin` (
  `idRegistroClin` INT NOT NULL AUTO_INCREMENT,
  `idAgendamento` INT NULL DEFAULT NULL,
  `idPaciente` INT NULL DEFAULT NULL,
  `idDentista` INT NULL DEFAULT NULL,
  `idProcedimento` INT NULL DEFAULT NULL,
  `dataHora` DATETIME NULL DEFAULT NULL,
  `diagnostico` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idRegistroClin`),
  INDEX `idAgendamento` (`idAgendamento` ASC) VISIBLE,
  INDEX `idPaciente` (`idPaciente` ASC) VISIBLE,
  INDEX `idDentista` (`idDentista` ASC) VISIBLE,
  INDEX `idProcedimento` (`idProcedimento` ASC) VISIBLE,
  CONSTRAINT `registroclin_ibfk_1`
    FOREIGN KEY (`idAgendamento`)
    REFERENCES `clinicadb`.`agendamento` (`idAgendamento`),
  CONSTRAINT `registroclin_ibfk_2`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `clinicadb`.`paciente` (`idPaciente`),
  CONSTRAINT `registroclin_ibfk_3`
    FOREIGN KEY (`idDentista`)
    REFERENCES `clinicadb`.`dentista` (`idDentista`),
  CONSTRAINT `registroclin_ibfk_4`
    FOREIGN KEY (`idProcedimento`)
    REFERENCES `clinicadb`.`procedimentoodont` (`idProcedimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinicadb`.`segurosaude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinicadb`.`segurosaude` (
  `idSeguro` INT NOT NULL,
  `nomeSeguro` VARCHAR(100) NULL DEFAULT NULL,
  `cobertura` TEXT NULL DEFAULT NULL,
  `planoSaude` VARCHAR(100) NULL DEFAULT NULL,
  `paciente_idPaciente` INT NOT NULL,
  PRIMARY KEY (`idSeguro`),
  INDEX `fk_segurosaude_paciente1_idx` (`paciente_idPaciente` ASC) VISIBLE,
  CONSTRAINT `fk_segurosaude_paciente1`
    FOREIGN KEY (`paciente_idPaciente`)
    REFERENCES `clinicadb`.`paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
