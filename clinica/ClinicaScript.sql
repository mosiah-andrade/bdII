CREATE DATABASE ClinicaDB;
USE ClinicaDB;

-- Tabela: Clinica
CREATE TABLE Clinica (
    idClinica INT PRIMARY KEY,
    nomeFantasia VARCHAR(100),
    nome VARCHAR(100),
    CNPJ VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(100),
    horarioFuncionamento VARCHAR(100),
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    UF CHAR(2),
    CEP VARCHAR(10),
    complemento VARCHAR(100)
);

-- Tabela: Endereco (para laboratórios)
CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY,
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    UF CHAR(2),
    CEP VARCHAR(10),
    complemento VARCHAR(100)
);

-- Tabela: labExterno
CREATE TABLE labExterno (
    idLaboratorio INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    idEndereco INT,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
);

-- Tabela: procedimentoOdont
CREATE TABLE procedimentoOdont (
    idProcedimento INT PRIMARY KEY,
    nomeProcedimento VARCHAR(100),
    descricao TEXT,
    valor DECIMAL(10,2)
);

-- Tabela: Dentista
CREATE TABLE Dentista (
    idDentista INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    especialidade VARCHAR(100),
    CFO VARCHAR(20)
);

-- Tabela: Paciente
CREATE TABLE Paciente (
    idPaciente INT PRIMARY KEY,
    nome VARCHAR(100),
    CPF VARCHAR(14),
    dataNasc DATE,
    genero VARCHAR(10),
    telefone VARCHAR(20),
    email VARCHAR(100),
    historico TEXT,
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    UF CHAR(2),
    CEP VARCHAR(10),
    complemento VARCHAR(100)
);

-- Tabela: Funcionario
CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY,
    nome VARCHAR(100),
    CPF VARCHAR(14),
    dataNasc DATE,
    genero VARCHAR(10),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    status VARCHAR(20),
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    UF CHAR(2),
    CEP VARCHAR(10),
    complemento VARCHAR(100)
);

-- Tabela: Agendamento
CREATE TABLE Agendamento (
    idAgendamento INT PRIMARY KEY,
    dataHora DATETIME,
    idPaciente INT,
    idDentista INT,
    idFuncionario INT,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idDentista) REFERENCES Dentista(idDentista),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);

-- Tabela: RegistroClin
CREATE TABLE RegistroClin (
    idRegistroClin INT PRIMARY KEY AUTO_INCREMENT,
    idAgendamento INT,
    idPaciente INT,
    idDentista INT,
    idProcedimento INT,
    dataHora DATETIME,
    diagnostico TEXT,
    FOREIGN KEY (idAgendamento) REFERENCES Agendamento(idAgendamento),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idDentista) REFERENCES Dentista(idDentista),
    FOREIGN KEY (idProcedimento) REFERENCES procedimentoOdont(idProcedimento)
);

-- Tabela: SeguroSaude
CREATE TABLE SeguroSaude (
    idSeguro INT PRIMARY KEY,
    nomeSeguro VARCHAR(100),
    cobertura TEXT,
    planoSaude VARCHAR(100)
);

-- Tabela: Faturamento
CREATE TABLE Faturamento (
    idFaturamento INT PRIMARY KEY,
    idPaciente INT,
    valorTotal DECIMAL(10,2),
    statusPag VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
);

-- Tabela: Receita
CREATE TABLE Receita (
    idReceita INT PRIMARY KEY,
    categoria VARCHAR(50),
    tipo VARCHAR(50),
    valor DECIMAL(10,2)
);

-- Tabela: Despesa
CREATE TABLE Despesa (
    idDespesa INT PRIMARY KEY,
    categoria VARCHAR(50),
    tipo VARCHAR(50),
    valor DECIMAL(10,2)
);
