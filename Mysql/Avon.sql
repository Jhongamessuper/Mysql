
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cep` DECIMAL(8) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`idEndereco`));

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fkEndereco` INT NOT NULL,
  `numeroCasa` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idCliente`),
    FOREIGN KEY (`fkEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`));
    
-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL,
  `ddd` DECIMAL(2) NOT NULL,
  `numeroTelefone` DECIMAL(9) NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`));

-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `idEmpresa` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpresa`));

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `tamanho` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(15) NOT NULL,
  `valor` FLOAT NOT NULL,
  `fkEmpresa` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
    FOREIGN KEY (`fkEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`));

-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `dataPagamento` DATETIME NOT NULL,
  `valor` FLOAT NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`));

-- -----------------------------------------------------
-- Table `mydb`.`ItensVendidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItensVendidos` (
  `idItensVendidos` INT NOT NULL,
  `quantidade` DECIMAL NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `fkProduto` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  `checagem` CHAR(3) NOT NULL,
  PRIMARY KEY (`idItensVendidos`),
    FOREIGN KEY (`fkProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`),
    FOREIGN KEY (`fkVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`));

-- -----------------------------------------------------
-- Table `mydb`.`Troca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Troca` (
  `idTroca` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  `fkItensVendidos` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `checagem` CHAR(3) NOT NULL,
  PRIMARY KEY (`idTroca`),
    FOREIGN KEY (`fkVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`),
    FOREIGN KEY (`fkItensVendidos`)
    REFERENCES `mydb`.`ItensVendidos` (`idItensVendidos`));
