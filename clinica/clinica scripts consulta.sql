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



-- ===============================
-- DESTRUIÇÃO COMPLETA DO BANCO ClinicaDB
-- Remove views, procedimentos, funções, tabelas e constraints
-- ===============================

-- Etapa 1: Remover VIEWS (se existirem)
-- DROP VIEW IF EXISTS nome_da_view; -- (Adicione suas views aqui, se houver)
-- Exemplo:
-- DROP VIEW IF EXISTS view_AgendamentosCompletos;

-- Etapa 2: Desabilitar verificação de chaves estrangeiras temporariamente
SET FOREIGN_KEY_CHECKS = 0;

-- Etapa 3: DROP TABLES em ordem inversa de dependência
DROP TABLE IF EXISTS Despesa;
DROP TABLE IF EXISTS Receita;
DROP TABLE IF EXISTS Faturamento;
DROP TABLE IF EXISTS SeguroSaude;
DROP TABLE IF EXISTS RegistroClin;
DROP TABLE IF EXISTS Agendamento;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS Dentista;
DROP TABLE IF EXISTS procedimentoOdont;
DROP TABLE IF EXISTS labExterno;
DROP TABLE IF EXISTS Endereco;
DROP TABLE IF EXISTS Clinica;

-- Etapa 4: Dropar o banco de dados completamente
-- DROP DATABASE IF EXISTS ClinicaDB;


-- ========================
-- TABELA: Clinica
-- ========================
INSERT INTO Clinica (idClinica, nomeFantasia, nome, CNPJ, telefone, email, horarioFuncionamento, rua, numero, bairro, cidade, UF, CEP, complemento) VALUES
(1, 'Sorriso Feliz', 'Clinica Odontológica Sorriso Feliz', '12.345.678/0001-90', '(11) 99888-7766', 'contato@sorrisofeliz.com', 'Seg a Sex, 08h às 18h', 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01000-000', 'Sala 10'),
(2, 'Bem Dente', 'Bem Dente Odontologia Integrada', '98.765.432/0001-01', '(21) 99999-1234', 'atendimento@bemdente.com', 'Seg a Sáb, 09h às 17h', 'Av. Brasil', '500', 'Jardins', 'Rio de Janeiro', 'RJ', '20000-000', '3º andar'),
(3, 'Odonto Top', 'Odonto Top Especialidades', '22.333.444/0001-55', '(31) 98888-1122', 'contato@odontotop.com', 'Seg a Sex, 07h às 19h', 'Rua Central', '45', 'Savassi', 'Belo Horizonte', 'MG', '30100-000', ''),
(4, 'DentalCare', 'DentalCare Centro Odonto', '11.111.222/0001-33', '(41) 99123-4567', 'info@dentalcare.com', 'Seg a Sáb, 08h às 16h', 'Rua Curitiba', '76', 'Água Verde', 'Curitiba', 'PR', '80000-000', ''),
(5, 'OrtoMais', 'OrtoMais Clínica de Ortodontia', '55.666.777/0001-88', '(51) 99222-3344', 'contato@ortomais.com', 'Seg a Sex, 08h às 18h', 'Rua São João', '999', 'Centro', 'Porto Alegre', 'RS', '90000-000', ''),
(6, 'SorrisoBranco', 'Clínica Sorriso Branco', '88.999.000/0001-77', '(62) 98765-4321', 'sorrisobranco@clinicabr.com', 'Seg a Sex, 09h às 19h', 'Rua da Alegria', '210', 'Centro', 'Goiânia', 'GO', '74000-000', ''),
(7, 'Clínica Odonto Sul', 'Odonto Sul', '33.222.111/0001-99', '(19) 98456-7890', 'contato@odontosul.com', 'Seg a Sáb, 08h às 17h', 'Av. Independência', '55', 'Centro', 'Campinas', 'SP', '13000-000', ''),
(8, 'OralMais', 'OralMais Odontologia', '77.888.999/0001-66', '(82) 98888-5566', 'contato@oralmais.com', 'Seg a Sex, 08h às 18h', 'Rua Principal', '300', 'Farol', 'Maceió', 'AL', '57000-000', ''),
(9, 'Clínica Central', 'Clínica Central de Odonto', '44.555.666/0001-22', '(95) 99876-5432', 'central@clinicacentral.com', 'Seg a Sex, 07h às 19h', 'Av. das Américas', '1000', 'Centro', 'Boa Vista', 'RR', '69300-000', ''),
(10, 'Nova Odonto', 'Nova Odonto Clínica Geral', '10.000.111/0001-44', '(71) 99123-1234', 'nova@odontologia.com', 'Seg a Sáb, 08h às 16h', 'Rua Nova', '456', 'Barra', 'Salvador', 'BA', '40000-000', '');

-- ========================
-- TABELA: Endereco
-- ========================
INSERT INTO Endereco (idEndereco, rua, numero, bairro, cidade, UF, CEP, complemento) VALUES
(1, 'Rua das Laranjeiras', '101', 'Centro', 'Rio de Janeiro', 'RJ', '20031-002', 'Bloco A'),
(2, 'Av. Paulista', '1578', 'Bela Vista', 'São Paulo', 'SP', '01310-200', 'Conjunto 202'),
(3, 'Rua Goiás', '80', 'Funcionários', 'Belo Horizonte', 'MG', '30150-330', ''),
(4, 'Av. Sete de Setembro', '456', 'Centro', 'Curitiba', 'PR', '80060-000', ''),
(5, 'Rua Padre Cacique', '999', 'Praia de Belas', 'Porto Alegre', 'RS', '90810-240', 'Próximo ao estádio'),
(6, 'Rua 9', '150', 'Setor Sul', 'Goiânia', 'GO', '74080-120', ''),
(7, 'Av. Barão de Studart', '1200', 'Aldeota', 'Fortaleza', 'CE', '60120-002', ''),
(8, 'Av. Afonso Pena', '3000', 'Centro', 'Campo Grande', 'MS', '79002-972', ''),
(9, 'Rua da Aurora', '200', 'Boa Vista', 'Recife', 'PE', '50050-000', 'Fundos'),
(10, 'Av. das Nações Unidas', '7777', 'Brooklin', 'São Paulo', 'SP', '04578-000', 'Torre Norte');


-- ========================
-- TABELA: labExterno
-- ========================
INSERT INTO labExterno (idLaboratorio, nome, email, telefone, idEndereco) VALUES
(1, 'Laboratório São Lucas', 'contato@labsaoLucas.com', '(21) 3355-1234', 1),
(2, 'Laboratório OdontoPlus', 'atendimento@odontoplus.com', '(11) 2222-5678', 2),
(3, 'Laboratório BioOdonto', 'bio@bioodonto.com', '(31) 3421-4567', 3),
(4, 'Laboratório Nova Era', 'novo@novaera.com', '(41) 3222-7890', 4),
(5, 'Laboratório Omega', 'omega@omega.com.br', '(51) 3030-2323', 5),
(6, 'Laboratório Ponto Odonto', 'ponto@pontoOdonto.com', '(62) 3256-7890', 6),
(7, 'Laboratório Laboris', 'contato@laboris.com', '(85) 3333-1111', 7),
(8, 'Laboratório Alpha Odonto', 'alpha@alphaodonto.com', '(67) 3222-1234', 8),
(9, 'Laboratório Vital', 'vital@laboratoriovital.com', '(81) 3222-9999', 9),
(10, 'Laboratório Bioscience', 'bioscience@bioscience.com', '(31) 3333-8888', 10);

-- ========================
-- TABELA: Dentista
-- ========================
INSERT INTO Dentista (idDentista, nome, email, telefone, especialidade, CFO) VALUES
(1, 'Dr. Ana Silva', 'ana.silva@odontomax.com.br', '(11) 99999-1234', 'Ortodontia', 'CFO-SP-12345'),
(2, 'Dr. João Oliveira', 'joao.oliveira@clinicafeliz.com.br', '(21) 98876-5432', 'Implantes', 'CFO-RJ-23456'),
(3, 'Dra. Maria Costa', 'maria.costa@dentistasantos.com', '(31) 98765-4321', 'Periodontia', 'CFO-MG-34567'),
(4, 'Dr. Pedro Souza', 'pedro.souza@clinicasorriso.com', '(41) 98765-4321', 'Endodontia', 'CFO-PR-45678'),
(5, 'Dra. Júlia Lima', 'julia.lima@ortosorriso.com.br', '(51) 99876-5432', 'Odontopediatria', 'CFO-RS-56789'),
(6, 'Dr. Felipe Almeida', 'felipe.almeida@clinicadental.com', '(62) 99456-7890', 'Clínico Geral', 'CFO-GO-67890'),
(7, 'Dra. Carla Pereira', 'carla.pereira@odontoss.com.br', '(85) 98765-4321', 'Próteses Dentárias', 'CFO-CE-78901'),
(8, 'Dr. Marcos Rocha', 'marcos.rocha@rochasorriso.com.br', '(67) 99654-3210', 'Cirurgia Buco-Maxilo', 'CFO-MS-89012'),
(9, 'Dra. Paula Almeida', 'paula.almeida@odontoplan.com', '(81) 99543-2109', 'Ortodontia', 'CFO-PE-90123'),
(10, 'Dr. André Souza', 'andre.souza@odontocare.com', '(11) 97765-4321', 'Implantes', 'CFO-SP-01234');

-- ========================
-- TABELA: Paciente
-- ========================
INSERT INTO Paciente (idPaciente, nome, CPF, dataNasc, genero, telefone, email, historico, rua, numero, bairro, cidade, UF, CEP, complemento) VALUES
(1, 'Carlos Souza', '123.456.789-00', '1980-05-15', 'Masculino', '(11) 99888-1122', 'carlos.souza@gmail.com', 'Sem histórico', 'Rua das Palmeiras', '15', 'Jardim Paulista', 'São Paulo', 'SP', '01420-000', ''),
(2, 'Fernanda Oliveira', '234.567.890-11', '1992-03-21', 'Feminino', '(21) 98876-5432', 'fernanda.oliveira@gmail.com', 'Histórico de cirurgia', 'Av. Rio Branco', '200', 'Centro', 'Rio de Janeiro', 'RJ', '20031-005', ''),
(3, 'Pedro Santos', '345.678.901-22', '1975-07-10', 'Masculino', '(31) 98765-4321', 'pedro.santos@yahoo.com', 'Nenhum histórico', 'Rua dos Três Rios', '50', 'Centro', 'Belo Horizonte', 'MG', '30120-000', ''),
(4, 'Juliana Costa', '456.789.012-33', '1987-12-05', 'Feminino', '(41) 99988-7766', 'juliana.costa@hotmail.com', 'Historico de tratamento ortodontico', 'Rua Paraná', '300', 'Centro', 'Curitiba', 'PR', '80010-100', ''),
(5, 'Luiz Pereira', '567.890.123-44', '1995-01-01', 'Masculino', '(51) 98877-6655', 'luiz.pereira@gmail.com', 'Histórico de extração', 'Rua dos Alpes', '123', 'Vila Flores', 'Porto Alegre', 'RS', '90010-300', ''),
(6, 'Ana Clara Rocha', '678.901.234-55', '2000-08-25', 'Feminino', '(62) 99999-1234', 'anaclara.rocha@gmail.com', 'Nenhum histórico', 'Av. Brasil', '500', 'Setor Central', 'Goiânia', 'GO', '74000-000', ''),
(7, 'Gabriel Alves', '789.012.345-66', '1993-10-14', 'Masculino', '(85) 98865-4321', 'gabriel.alves@outlook.com', 'Tratamento em andamento', 'Rua Bela Vista', '700', 'Vila Esperança', 'Fortaleza', 'CE', '60000-001', ''),
(8, 'Mariana Lima', '890.123.456-77', '1983-04-09', 'Feminino', '(67) 99854-3210', 'mariana.lima@uol.com.br', 'Histórico de cárie', 'Av. dos Estados', '1020', 'Vila Nova', 'Campo Grande', 'MS', '79000-003', ''),
(9, 'João Paulo Silva', '901.234.567-88', '1978-02-18', 'Masculino', '(81) 99653-2109', 'joaopaulo.silva@hotmail.com', 'Histórico de implante', 'Rua da Paz', '90', 'Centro', 'Recife', 'PE', '50050-100', ''),
(10, 'Lúcia Martins', '012.345.678-99', '1990-06-30', 'Feminino', '(11) 98877-6655', 'lucia.martins@gmail.com', 'Sem histórico', 'Rua das Rosas', '15', 'Vila Rica', 'São Paulo', 'SP', '01230-100', '');

-- ========================
-- TABELA: Funcionario
-- ========================
INSERT INTO Funcionario (idFuncionario, nome, CPF, dataNasc, genero, telefone, email, cargo, salario, status, rua, numero, bairro, cidade, UF, CEP, complemento) VALUES
(1, 'Roberto Silva', '123.456.789-01', '1985-06-22', 'Masculino', '(11) 99123-4567', 'roberto.silva@clinicafacil.com', 'Recepcionista', 2500.00, 'Ativo', 'Rua das Flores', '55', 'Centro', 'São Paulo', 'SP', '01000-000', ''),
(2, 'Fernanda Almeida', '234.567.890-12', '1990-11-10', 'Feminino', '(21) 98876-5432', 'fernanda.almeida@clinicafacil.com', 'Assistente Administrativa', 3000.00, 'Ativo', 'Av. Paulista', '1234', 'Bela Vista', 'São Paulo', 'SP', '01310-200', ''),
(3, 'Carlos Costa', '345.678.901-23', '1980-09-25', 'Masculino', '(31) 98765-4321', 'carlos.costa@odontoplan.com', 'Dentista', 8000.00, 'Ativo', 'Rua Goiás', '789', 'Funcionários', 'Belo Horizonte', 'MG', '30150-330', ''),
(4, 'Juliana Souza', '456.789.012-34', '1986-02-15', 'Feminino', '(41) 99123-4567', 'juliana.souza@clinicafeliz.com', 'Gerente de Consultório', 5000.00, 'Ativo', 'Av. Brasil', '345', 'Centro', 'Curitiba', 'PR', '80000-000', ''),
(5, 'Marcos Lima', '567.890.123-45', '1984-12-30', 'Masculino', '(51) 99876-5432', 'marcos.lima@odontoplano.com', 'Secretário', 2200.00, 'Ativo', 'Rua dos Três Rios', '200', 'Centro', 'Porto Alegre', 'RS', '90000-000', ''),
(6, 'Priscila Martins', '678.901.234-56', '1992-04-07', 'Feminino', '(62) 99456-7890', 'priscila.martins@odontosystem.com', 'Recepcionista', 2500.00, 'Ativo', 'Av. Afonso Pena', '300', 'Centro', 'Goiânia', 'GO', '74000-000', ''),
(7, 'Ricardo Oliveira', '789.012.345-67', '1981-01-18', 'Masculino', '(85) 98865-4321', 'ricardo.oliveira@odontosul.com.br', 'Enfermeiro', 3500.00, 'Ativo', 'Rua Bela Vista', '1000', 'Vila Esperança', 'Fortaleza', 'CE', '60000-001', ''),
(8, 'Patrícia Rocha', '890.123.456-78', '1990-03-03', 'Feminino', '(67) 99654-3210', 'patricia.rocha@clinicasorriso.com', 'Recepcionista', 2700.00, 'Ativo', 'Rua da Paz', '150', 'Centro', 'Campo Grande', 'MS', '79000-003', ''),
(9, 'Gustavo Alves', '901.234.567-89', '1987-07-17', 'Masculino', '(81) 99653-2109', 'gustavo.alves@clinicacare.com', 'Auxiliar de Dentista', 2900.00, 'Ativo', 'Rua das Rosas', '25', 'Vila Rica', 'São Paulo', 'SP', '01230-100', ''),
(10, 'Tatiane Costa', '012.345.678-90', '1995-10-22', 'Feminino', '(11) 99765-4321', 'tatiane.costa@clinicadental.com', 'Técnica em Saúde Bucal', 3300.00, 'Ativo', 'Rua das Laranjeiras', '250', 'Jardim Paulista', 'São Paulo', 'SP', '01420-000', '');

-- ========================
-- TABELA: Agendamento
-- ========================
INSERT INTO Agendamento (idAgendamento, dataHora, idPaciente, idDentista, idFuncionario) VALUES
(1, '2025-05-10 09:00:00', 1, 2, 3),
(2, '2025-05-10 11:00:00', 2, 1, 4),
(3, '2025-05-10 13:00:00', 3, 5, 2),
(4, '2025-05-10 15:00:00', 4, 3, 5),
(5, '2025-05-11 09:30:00', 5, 4, 1),
(6, '2025-05-11 11:30:00', 6, 2, 3),
(7, '2025-05-11 14:00:00', 7, 6, 4),
(8, '2025-05-11 16:00:00', 8, 7, 2),
(9, '2025-05-12 09:30:00', 9, 1, 5),
(10, '2025-05-12 11:00:00', 10, 9, 6);

-- ========================
-- TABELA: RegistroClin
-- ========================
INSERT INTO RegistroClin (idRegistroClin, idAgendamento, idPaciente, idDentista, idProcedimento, dataHora, diagnostico) VALUES
(1, 1, 1, 2, 1, '2025-05-10 09:00:00', 'Diagnóstico: Cárie dental'),
(2, 2, 2, 1, 2, '2025-05-10 11:00:00', 'Diagnóstico: Periodontite'),
(3, 3, 3, 5, 3, '2025-05-10 13:00:00', 'Diagnóstico: Sensibilidade dental'),
(4, 4, 4, 3, 4, '2025-05-10 15:00:00', 'Diagnóstico: Necessidade de endodontia'),
(5, 5, 5, 4, 5, '2025-05-11 09:30:00', 'Diagnóstico: Problemas na arcada dentária'),
(6, 6, 6, 2, 6, '2025-05-11 11:30:00', 'Diagnóstico: Cirurgia dentária agendada'),
(7, 7, 7, 6, 7, '2025-05-11 14:00:00', 'Diagnóstico: Implante dentário necessário'),
(8, 8, 8, 7, 8, '2025-05-11 16:00:00', 'Diagnóstico: Limpeza e manutenção dental'),
(9, 9, 9, 1, 9, '2025-05-12 09:30:00', 'Diagnóstico: Exame de rotina realizado'),
(10, 10, 10, 4, 10, '2025-05-12 11:00:00', 'Diagnóstico: Problemas gengivais');

-- ========================
-- TABELA: SeguroSaude
-- ========================
INSERT INTO SeguroSaude (idSeguro, nomeSeguro, cobertura, planoSaude) VALUES
(1, 'Unimed', 'Cobertura completa', 'Plano Unimed 100%'),
(2, 'Amil', 'Cobertura dentária e hospitalar', 'Amil Dentário Plus'),
(3, 'Bradesco Saúde', 'Cobertura hospitalar e exames', 'Bradesco Saúde Premium'),
(4, 'SulAmérica', 'Cobertura básica e emergencial', 'SulAmérica Essencial'),
(5, 'Porto Seguro', 'Cobertura completa', 'Porto Seguro Saúde Família'),
(6, 'Intermédica', 'Cobertura odontológica e hospitalar', 'Intermédica Odonto'),
(7, 'Itaú Saúde', 'Cobertura hospitalar', 'Itaú Saúde Família'),
(8, 'São Cristóvão Saúde', 'Cobertura dentária e urgências', 'São Cristóvão Plus'),
(9, 'Prevent Senior', 'Cobertura médica e exames', 'Prevent Senior 24h'),
(10, 'Golden Cross', 'Cobertura hospitalar e emergencial', 'Golden Cross Completo');

-- ========================
-- TABELA: Faturamento
-- ========================
INSERT INTO Faturamento (idFaturamento, idPaciente, valorTotal, statusPag) VALUES
(1, 1, 1500.00, 'Pago'),
(2, 2, 2000.00, 'Pendente'),
(3, 3, 1200.00, 'Pago'),
(4, 4, 2500.00, 'Pago'),
(5, 5, 1800.00, 'Pendente'),
(6, 6, 2200.00, 'Pago'),
(7, 7, 1600.00, 'Pendente'),
(8, 8, 1300.00, 'Pago'),
(9, 9, 1400.00, 'Pendente'),
(10, 10, 1900.00, 'Pago');

-- ========================
-- TABELA: Receita
-- ========================
INSERT INTO Receita (idReceita, categoria, tipo, valor) VALUES
(1, 'Medicamentos', 'Analgésico', 50.00),
(2, 'Tratamento', 'Ortodontia', 800.00),
(3, 'Tratamento', 'Endodontia', 600.00),
(4, 'Medicamentos', 'Antibiótico', 120.00),
(5, 'Exame', 'Radiografia', 200.00),
(6, 'Tratamento', 'Implante', 1500.00),
(7, 'Medicamentos', 'Antisséptico', 40.00),
(8, 'Tratamento', 'Limpeza dental', 100.00),
(9, 'Exame', 'Exame de sangue', 150.00),
(10, 'Tratamento', 'Clareamento dental', 700.00);

-- ========================
-- TABELA: Despesa
-- ========================
INSERT INTO Despesa (idDespesa, categoria, tipo, valor) VALUES
(1, 'Manutenção', 'Equipamentos odontológicos', 500.00),
(2, 'Salários', 'Funcionários', 10000.00),
(3, 'Materiais', 'Materiais de odontologia', 3000.00),
(4, 'Serviços', 'Limpeza do consultório', 600.00),
(5, 'Materiais', 'Produtos de higiene', 400.00),
(6, 'Manutenção', 'Software de gestão', 800.00),
(7, 'Salários', 'Dentistas', 12000.00),
(8, 'Serviços', 'Contabilidade', 1500.00),
(9, 'Manutenção', 'Ar-condicionado', 200.00),
(10, 'Serviços', 'Internet e telefonia', 300.00);

-- 1. Deletar clínica com idClinica = 1
DELETE FROM Clinica WHERE idClinica = 1;

-- 2. Deletar clínica onde o nome é 'Clinica Sorriso'
DELETE FROM Clinica WHERE nome = 'Clinica Sorriso';

-- 3. Atualizar o telefone da clínica com idClinica = 2
UPDATE Clinica
SET telefone = '(11) 98765-4321'
WHERE idClinica = 2;

-- 4. Atualizar o horário de funcionamento da clínica 'Clínica Bem Estar'
UPDATE Clinica
SET horarioFuncionamento = 'Segunda a Sexta, 08:00-18:00'
WHERE nome = 'Clínica Bem Estar';

-- 5. Deletar o endereço com idEndereco = 5
DELETE FROM Endereco WHERE idEndereco = 5;

-- 6. Deletar endereço na cidade de 'Curitiba'
DELETE FROM Endereco WHERE cidade = 'Curitiba';

-- 7. Atualizar o bairro do endereço com idEndereco = 4 para 'Vila das Flores'
UPDATE Endereco
SET bairro = 'Vila das Flores'
WHERE idEndereco = 4;

-- 8. Atualizar o complemento de endereço na cidade 'São Paulo'
UPDATE Endereco
SET complemento = 'Próximo ao Shopping'
WHERE cidade = 'São Paulo';

-- 9. Deletar o paciente com idPaciente = 3
DELETE FROM Paciente WHERE idPaciente = 3;

-- 10. Deletar todos os pacientes com gênero 'Masculino'
DELETE FROM Paciente WHERE genero = 'Masculino';

-- 11. Atualizar o telefone do paciente com idPaciente = 2
UPDATE Paciente
SET telefone = '(21) 98888-8888'
WHERE idPaciente = 2;

-- 12. Atualizar o histórico do paciente com nome 'Carlos Souza'
UPDATE Paciente
SET historico = 'Paciente com histórico de cirurgia dental'
WHERE nome = 'Carlos Souza';

-- 13. Deletar o funcionário com idFuncionario = 6
DELETE FROM Funcionario WHERE idFuncionario = 6;

-- 14. Deletar todos os funcionários que possuem cargo 'Recepcionista'
DELETE FROM Funcionario WHERE cargo = 'Recepcionista';

-- 15. Atualizar o salário do funcionário com idFuncionario = 1 para 3000.00
UPDATE Funcionario
SET salario = 3000.00
WHERE idFuncionario = 1;

-- 16. Atualizar o status de funcionário com idFuncionario = 4 para 'Inativo'
UPDATE Funcionario
SET status = 'Inativo'
WHERE idFuncionario = 4;

-- 17. Deletar o agendamento com idAgendamento = 5
DELETE FROM Agendamento WHERE idAgendamento = 5;

-- 18. Deletar todos os agendamentos relacionados ao paciente com idPaciente = 7
DELETE FROM Agendamento WHERE idPaciente = 7;

-- 19. Atualizar o horário do agendamento com idAgendamento = 8 para '2025-05-12 10:00:00'
UPDATE Agendamento
SET dataHora = '2025-05-12 10:00:00'
WHERE idAgendamento = 8;

-- 20. Atualizar o dentista do agendamento com idAgendamento = 3 para idDentista = 6
UPDATE Agendamento
SET idDentista = 6
WHERE idAgendamento = 3;

-- 21. Deletar o registro com idRegistroClin = 2
DELETE FROM RegistroClin WHERE idRegistroClin = 2;

-- Relatório que exibe o nome da clínica e o endereço completo (rua, bairro, cidade, UF)
SELECT c.nomeFantasia, e.rua, e.bairro, e.cidade, e.UF
FROM Clinica c
JOIN Endereco e ON c.idClinica = e.idEndereco;

-- Relatório que exibe os dentistas e os procedimentos que realizaram
SELECT d.nome, p.nomeProcedimento, p.valor
FROM Dentista d
JOIN RegistroClin r ON d.idDentista = r.idDentista
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento;

-- Relatório que exibe pacientes que realizaram um procedimento específico
SELECT pa.nome, p.nomeProcedimento, r.diagnostico
FROM Paciente pa
JOIN RegistroClin r ON pa.idPaciente = r.idPaciente
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento
WHERE p.nomeProcedimento = 'Implante';

-- Relatório de faturamento por paciente
SELECT pa.nome, f.valorTotal, f.statusPag
FROM Paciente pa
JOIN Faturamento f ON pa.idPaciente = f.idPaciente;

-- Relatório de todos os funcionários e seus cargos
SELECT f.nome, f.cargo
FROM Funcionario f;

-- Relatório de agendamentos feitos com cada dentista
SELECT d.nome, a.dataHora, pa.nome AS paciente_nome
FROM Agendamento a
JOIN Dentista d ON a.idDentista = d.idDentista
JOIN Paciente pa ON a.idPaciente = pa.idPaciente;

-- Relatório de procedimentos realizados por dentistas
SELECT d.nome, p.nomeProcedimento, COUNT(r.idRegistroClin) AS num_procedimentos
FROM Dentista d
JOIN RegistroClin r ON d.idDentista = r.idDentista
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento
GROUP BY d.nome, p.nomeProcedimento;

-- Relatório de pacientes com seus respectivos seguros de saúde
SELECT pa.nome, ss.nomeSeguro
FROM Paciente pa
JOIN SeguroSaude ss ON pa.idPaciente = ss.idPaciente;

-- Relatório de faturamento com valor total superior a 2000
SELECT pa.nome, f.valorTotal, f.statusPag
FROM Paciente pa
JOIN Faturamento f ON pa.idPaciente = f.idPaciente
WHERE f.valorTotal > 2000;

-- Relatório de consultas realizadas e seus diagnósticos
SELECT pa.nome, r.diagnostico, p.nomeProcedimento
FROM Paciente pa
JOIN RegistroClin r ON pa.idPaciente = r.idPaciente
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento;

-- Relatório de todos os procedimentos realizados em uma clínica
SELECT c.nomeFantasia, p.nomeProcedimento, COUNT(r.idRegistroClin) AS num_procedimentos
FROM Clinica c
JOIN Dentista d ON c.idClinica = d.idClinica
JOIN RegistroClin r ON d.idDentista = r.idDentista
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento
GROUP BY c.nomeFantasia, p.nomeProcedimento;
	
    -- Relatório de funcionários com salário superior a 5000
SELECT f.nome, f.salario, f.cargo
FROM Funcionario f
WHERE f.salario > 5000;

-- Relatório de dentistas e seus agendamentos
SELECT d.nome, a.dataHora, pa.nome AS paciente_nome
FROM Dentista d
JOIN Agendamento a ON d.idDentista = a.idDentista
JOIN Paciente pa ON a.idPaciente = pa.idPaciente;

-- Relatório de todas as despesas de uma clínica
SELECT c.nomeFantasia, d.categoria, d.valor
FROM Clinica c
JOIN Funcionario f ON c.idClinica = f.idClinica
JOIN Despesa d ON f.idFuncionario = d.idFuncionario
WHERE c.idClinica = 1;

-- Relatório de pacientes com procedimentos realizados em 2025-05-10
SELECT pa.nome, p.nomeProcedimento, r.diagnostico
FROM Paciente pa
JOIN RegistroClin r ON pa.idPaciente = r.idPaciente
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento
WHERE r.dataHora = '2025-05-10';

-- Relatório de agendamentos e seus funcionários responsáveis
SELECT a.dataHora, pa.nome AS paciente_nome, f.nome AS funcionario_nome
FROM Agendamento a
JOIN Funcionario f ON a.idFuncionario = f.idFuncionario
JOIN Paciente pa ON a.idPaciente = pa.idPaciente;

-- Relatório de pacientes e seus históricos médicos
SELECT pa.nome, pa.historico
FROM Paciente pa;

-- Relatório de pacientes que têm agendamentos com status 'Pendente'
SELECT pa.nome, a.dataHora, a.idAgendamento
FROM Agendamento a
JOIN Paciente pa ON a.idPaciente = pa.idPaciente
WHERE a.status = 'Pendente';

-- Relatório de dentistas que realizaram procedimentos com valor acima de 500
SELECT d.nome, p.nomeProcedimento, p.valor
FROM Dentista d
JOIN RegistroClin r ON d.idDentista = r.idDentista
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento
WHERE p.valor > 500;

-- Relatório de pacientes com seus seguros de saúde e faturamento
SELECT pa.nome, ss.nomeSeguro, f.valorTotal
FROM Paciente pa
JOIN SeguroSaude ss ON pa.idPaciente = ss.idPaciente
JOIN Faturamento f ON pa.idPaciente = f.idPaciente;

-- 1. View: Relatório de Clínicas e Seus Endereços
CREATE VIEW vw_Clinicas_Enderecos AS
SELECT c.nomeFantasia, e.rua, e.bairro, e.cidade, e.UF
FROM Clinica c
JOIN Endereco e ON c.idClinica = e.idEndereco;

-- 2. View: Relatório de Dentistas e Seus Procedimentos Realizados
CREATE VIEW vw_Dentistas_Procedimentos AS
SELECT d.nome, p.nomeProcedimento, p.valor
FROM Dentista d
JOIN RegistroClin r ON d.idDentista = r.idDentista
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento;

-- 3. View: Relatório de Pacientes que Realizaram Procedimentos Específicos
CREATE VIEW vw_Pacientes_Procedimentos_Especificos AS
SELECT pa.nome AS paciente_nome, p.nomeProcedimento, r.diagnostico
FROM Paciente pa
JOIN RegistroClin r ON pa.idPaciente = r.idPaciente
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento
WHERE p.nomeProcedimento = 'Implante';

-- 4. View: Relatório de Faturamento por Paciente
CREATE VIEW vw_Faturamento_Paciente AS
SELECT pa.nome AS paciente_nome, f.valorTotal, f.statusPag
FROM Paciente pa
JOIN Faturamento f ON pa.idPaciente = f.idPaciente;

-- 5. View: Relatório de Funcionários e Seus Cargos
CREATE VIEW vw_Funcionarios_Cargos AS
SELECT f.nome, f.cargo
FROM Funcionario f;

-- 6. View: Relatório de Agendamentos de Dentistas
CREATE VIEW vw_Agendamentos_Dentistas AS
SELECT d.nome AS dentista_nome, a.dataHora, pa.nome AS paciente_nome
FROM Agendamento a
JOIN Dentista d ON a.idDentista = d.idDentista
JOIN Paciente pa ON a.idPaciente = pa.idPaciente;

-- 7. View: Relatório de Procedimentos Odontológicos Realizados por Dentista
CREATE VIEW vw_Procedimentos_Dentistas AS
SELECT d.nome AS dentista_nome, p.nomeProcedimento, COUNT(r.idRegistroClin) AS num_procedimentos
FROM Dentista d
JOIN RegistroClin r ON d.idDentista = r.idDentista
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento
GROUP BY d.nome, p.nomeProcedimento;

-- 8. View: Relatório de Pacientes com Seguro de Saúde
CREATE VIEW vw_Pacientes_Seguro_Saude AS
SELECT pa.nome AS paciente_nome, ss.nomeSeguro
FROM Paciente pa
JOIN SeguroSaude ss ON pa.idPaciente = ss.idPaciente;

-- 9. View: Relatório de Faturamento Acima de um Valor Específico
CREATE VIEW vw_Faturamento_Acima_Valor AS
SELECT pa.nome AS paciente_nome, f.valorTotal, f.statusPag
FROM Paciente pa
JOIN Faturamento f ON pa.idPaciente = f.idPaciente
WHERE f.valorTotal > 2000;

-- 10. View: Relatório de Consultas e Seus Diagnósticos
CREATE VIEW vw_Consultas_Diagnosticos AS
SELECT pa.nome AS paciente_nome, p.nomeProcedimento, r.diagnostico
FROM Paciente pa
JOIN RegistroClin r ON pa.idPaciente = r.idPaciente
JOIN procedimentoOdont p ON r.idProcedimento = p.idProcedimento;
