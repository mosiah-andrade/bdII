create schema malibu;
use malibu;

create table malibu.funcionario (
	cpf varchar(14) primary key not null,
    nome varchar(80) not null,
    nomeSocial VARCHAR(45),
    genero CHAR(1),
    dataNasc DATE NOT NULL,
    email VARCHAR(45) UNIQUE NOT NULL,
    salario DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
	`status` TINYINT NOT NULL,
    fg DECIMAL(6,2)
);
CREATE TABLE malibu.endereco (
	Funcionario_cpf VARCHAR(14) PRIMARY KEY NOT NULL,
    UF CHAR(2) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    rua VARCHAR(45) NOT NULL,
    numero INT NOT NULL,
    comp VARCHAR(45),
    cep VARCHAR(9) NOT NULL,
    foreign key (funcionario_cpf) 
    references malibu.funcionario (cpf)
		on update cascade
        on delete cascade
	);
    
desc malibu.endereco;

rename table endereco to endereço;
);

alter table malibu.funcionario 
	add column 
		comissao decimal(6,2) null;
alter table malibu.funcionario 
	add column 
		RG varchar(15) unique not null after cpf;
        
alter table malibu.funcionario change column fg funcaoGrat decimal(5,2) null;
alter table malibu.funcionario change column funcaoGrat funcaoGrat decimal(6,2) unsigned zerofill null;

alter table malibu.funcionario
	drop column comissao;
    
drop table malibu.endereço;
drop table malibu.funcionario;

drop schema malibu;