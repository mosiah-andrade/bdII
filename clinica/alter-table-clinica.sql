-- ==============================
-- ALTERAÇÕES NAS ESTRUTURAS DAS TABELAS DO BANCO ClinicaDB
-- ==============================

-- 1. Adicionar coluna de status à tabela Paciente
ALTER TABLE Paciente
ADD status VARCHAR(20) DEFAULT 'Ativo';

-- 2. Alterar tipo da coluna telefone na tabela Dentista para permitir mais caracteres
ALTER TABLE Dentista
MODIFY telefone VARCHAR(25);

-- 3. Adicionar coluna de RG na tabela Funcionario
ALTER TABLE Funcionario
ADD RG VARCHAR(20);

-- 4. Adicionar coluna de horário de atendimento na tabela Dentista
ALTER TABLE Dentista
ADD horarioAtendimento VARCHAR(100);

-- 5. Adicionar coluna para indicar se o agendamento foi confirmado
ALTER TABLE Agendamento
ADD confirmado BOOLEAN DEFAULT FALSE;

-- 6. Renomear a coluna statusPag na tabela Faturamento para statusPagamento
ALTER TABLE Faturamento
CHANGE statusPag statusPagamento VARCHAR(50);

-- 7. Adicionar coluna de data de criação na tabela RegistroClin
ALTER TABLE RegistroClin
ADD dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 8. Adicionar campo de observações na tabela Despesa
ALTER TABLE Despesa
ADD observacoes TEXT;

-- 9. Tornar o campo email da tabela Paciente único
ALTER TABLE Paciente
ADD CONSTRAINT unique_email_paciente UNIQUE (email);

-- 10. Adicionar chave estrangeira idSeguro em Paciente (relaciona com SeguroSaude)
ALTER TABLE Paciente
ADD idSeguro INT,
ADD CONSTRAINT fk_seguro_paciente FOREIGN KEY (idSeguro) REFERENCES SeguroSaude(idSeguro);


