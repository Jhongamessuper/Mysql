
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`));

-- -----------------------------------------------------
-- Table `mydb`.`Raca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Raca` (
  `idRaca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `porte` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRaca`));
  
-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `numeroCasa` VARCHAR(45) NULL,
  `fkEndereco` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
    FOREIGN KEY (`fkEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`));

-- -----------------------------------------------------
-- Table `mydb`.`Pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pet` (
  `idPet` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` DECIMAL(2) NULL,
  `sexo` TINYINT NULL,
  `fkRaca` INT NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idPet`),
    FOREIGN KEY (`fkRaca`)
    REFERENCES `mydb`.`Raca` (`idRaca`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`));

-- -----------------------------------------------------
-- Table `mydb`.`Agenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agenda` (
  `idAgenda` INT NOT NULL,
  `data` DATETIME NULL,
  `fkPet` INT NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `valorTotal` FLOAT NOT NULL,
  PRIMARY KEY (`idAgenda`),
    FOREIGN KEY (`fkPet`)
    REFERENCES `mydb`.`Pet` (`idPet`));
    
-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `ddd` DECIMAL(2) NULL,
  `numero` DECIMAL(9) NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`));

-- -----------------------------------------------------
-- Table `mydb`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idServico`));

-- -----------------------------------------------------
-- Table `mydb`.`ServicosFeitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ServicosFeitos` (
  `idServicosFeitos` INT NOT NULL AUTO_INCREMENT,
  `fkServico` INT NOT NULL,
  `fkAgenda` INT NOT NULL,
  PRIMARY KEY (`idServicosFeitos`),
    FOREIGN KEY (`fkServico`)
    REFERENCES `mydb`.`Servico` (`idServico`),
    FOREIGN KEY (`fkAgenda`)
    REFERENCES `mydb`.`Agenda` (`idAgenda`));