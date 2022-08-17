
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` DECIMAL NOT NULL,
  PRIMARY KEY (`idCliente`));

-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncionario`));

-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `valor` FLOAT NOT NULL,
  `fkCliente` INT NOT NULL,
  `fkFuncionario` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
    FOREIGN KEY (`fkCliente`) REFERENCES `mydb`.`Cliente` (`idCliente`),
    FOREIGN KEY (`fkFuncionario`) REFERENCES `mydb`.`Funcionario` (`idFuncionario`));

-- -----------------------------------------------------
-- Table `mydb`.`Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servicos` (
  `idServicos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idServicos`));

-- -----------------------------------------------------
-- Table `mydb`.`ServicosFeitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ServicosFeitos` (
  `idServicosFeitos` INT NOT NULL AUTO_INCREMENT,
  `fkServicos` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  PRIMARY KEY (`idServicosFeitos`),
    FOREIGN KEY (`fkServicos`) REFERENCES `mydb`.`Servicos` (`idServicos`),
    FOREIGN KEY (`fkVenda`) REFERENCES `mydb`.`Venda` (`idVenda`));

-- -----------------------------------------------------
-- Table `mydb`.`idAgenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agenda` (
  `idAgenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `fkCliente` INT NOT NULL,
  `fkFuncionario` INT NOT NULL,
  `fkServicosFeitos` INT NOT NULL,
  PRIMARY KEY (`idAgenda`),
	FOREIGN KEY (`fkCliente`) REFERENCES `mydb`.`Cliente` (`idCliente`),
    FOREIGN KEY (`fkFuncionario`) REFERENCES `mydb`.`Funcionario` (`idFuncionario`),
    FOREIGN KEY (`fkServicosFeitos`) REFERENCES `mydb`.`ServicosFeitos` (`idServicosFeitos`));