-- Inserir dados na tabela `dentista`
INSERT INTO `clinicadb`.`dentista` (`idDentista`, `nome`, `email`, `telefone`, `especialidade`, `CFO`)
VALUES
(1, 'Dr. Ana Souza', 'ana.souza@clinica.com', '99999-0001', 'Ortodontia', '1234567'),
(2, 'Dr. João Silva', 'joao.silva@clinica.com', '99999-0002', 'Periodontia', '2345678'),
(3, 'Dr. Carlos Pereira', 'carlos.pereira@clinica.com', '99999-0003', 'Endodontia', '3456789'),
(4, 'Dr. Maria Oliveira', 'maria.oliveira@clinica.com', '99999-0004', 'Implantes', '4567890'),
(5, 'Dr. Pedro Almeida', 'pedro.almeida@clinica.com', '99999-0005', 'Clínico Geral', '5678901'),
(6, 'Dr. Fernanda Costa', 'fernanda.costa@clinica.com', '99999-0006', 'Odontopediatria', '6789012'),
(7, 'Dr. Marcos Gomes', 'marcos.gomes@clinica.com', '99999-0007', 'Cirurgia Oral', '7890123'),
(8, 'Dr. Beatriz Martins', 'beatriz.martins@clinica.com', '99999-0008', 'Ortodontia', '8901234'),
(9, 'Dr. Eduardo Lima', 'eduardo.lima@clinica.com', '99999-0009', 'Periodontia', '9012345'),
(10, 'Dr. Simone Rocha', 'simone.rocha@clinica.com', '99999-0010', 'Endodontia', '0123456');

-- Inserir dados na tabela `funcionario`
INSERT INTO `clinicadb`.`funcionario` (`idFuncionario`, `nome`, `CPF`, `dataNasc`, `genero`, `telefone`, `email`, `cargo`, `salario`, `status`, `rua`, `numero`, `bairro`, `cidade`, `UF`, `CEP`, `complemento`)
VALUES
(1, 'Carlos Oliveira', '123.456.789-00', '1985-03-15', 'Masculino', '99999-0101', 'carlos.oliveira@clinicafunc.com', 'Recepcionista', 2500.00, 'Ativo', 'Rua A', '123', 'Centro', 'São Paulo', 'SP', '01010-000', 'Apto 101'),
(2, 'Ana Costa', '234.567.890-01', '1990-05-20', 'Feminino', '99999-0102', 'ana.costa@clinicafunc.com', 'Auxiliar de Consultório', 2000.00, 'Ativo', 'Rua B', '456', 'Bela Vista', 'São Paulo', 'SP', '01020-000', 'Apto 102'),
(3, 'Juliana Lima', '345.678.901-02', '1988-07-10', 'Feminino', '99999-0103', 'juliana.lima@clinicafunc.com', 'Dentista', 5000.00, 'Ativo', 'Rua C', '789', 'Vila Mariana', 'São Paulo', 'SP', '01030-000', 'Apto 103'),
(4, 'Roberto Silva', '456.789.012-03', '1982-11-25', 'Masculino', '99999-0104', 'roberto.silva@clinicafunc.com', 'Assistente Administrativo', 3000.00, 'Ativo', 'Rua D', '1011', 'Pinheiros', 'São Paulo', 'SP', '01040-000', 'Apto 104'),
(5, 'Lucas Santos', '567.890.123-04', '1995-09-30', 'Masculino', '99999-0105', 'lucas.santos@clinicafunc.com', 'Coordenador de Clínica', 6000.00, 'Ativo', 'Rua E', '1213', 'Moema', 'São Paulo', 'SP', '01050-000', 'Apto 105'),
(6, 'Vanessa Pereira', '678.901.234-05', '1992-01-17', 'Feminino', '99999-0106', 'vanessa.pereira@clinicafunc.com', 'Secretária', 2200.00, 'Ativo', 'Rua F', '1415', 'Jardins', 'São Paulo', 'SP', '01060-000', 'Apto 106'),
(7, 'Marcos Rocha', '789.012.345-06', '1987-08-22', 'Masculino', '99999-0107', 'marcos.rocha@clinicafunc.com', 'Recepcionista', 2400.00, 'Ativo', 'Rua G', '1617', 'Itaim', 'São Paulo', 'SP', '01070-000', 'Apto 107'),
(8, 'Letícia Martins', '890.123.456-07', '1993-06-05', 'Feminino', '99999-0108', 'leticia.martins@clinicafunc.com', 'Auxiliar de Consultório', 2100.00, 'Ativo', 'Rua H', '1819', 'Vila Olímpia', 'São Paulo', 'SP', '01080-000', 'Apto 108'),
(9, 'Eduardo Costa', '901.234.567-08', '1989-12-30', 'Masculino', '99999-0109', 'eduardo.costa@clinicafunc.com', 'Administrador de Sistemas', 4500.00, 'Ativo', 'Rua I', '2021', 'Tatuapé', 'São Paulo', 'SP', '01090-000', 'Apto 109'),
(10, 'Patricia Alves', '012.345.678-09', '1991-04-11', 'Feminino', '99999-0110', 'patricia.alves@clinicafunc.com', 'Gerente de Clínica', 7500.00, 'Ativo', 'Rua J', '2223', 'Bairro do Limão', 'São Paulo', 'SP', '01100-000', 'Apto 110');

-- Inserir dados na tabela `clinica`
INSERT INTO `clinicadb`.`clinica` (`idClinica`, `nomeFantasia`, `nome`, `CNPJ`, `telefone`, `email`, `horarioFuncionamento`, `rua`, `numero`, `bairro`, `cidade`, `UF`, `CEP`, `complemento`, `dentista_idDentista`)
VALUES
(1, 'Clinica OdontoMais', 'Clínica Odontológica Mais', '12.345.678/0001-90', '99999-1234', 'contato@odontomais.com', 'Seg a Sex: 8h às 18h', 'Rua A', '100', 'Centro', 'São Paulo', 'SP', '01010-001', 'Sala 201', 1),
(2, 'Clínica Saúde Dental', 'Clínica Odontológica Saúde', '23.456.789/0001-91', '99999-1235', 'contato@saudedental.com', 'Seg a Sex: 9h às 17h', 'Rua B', '200', 'Vila Mariana', 'São Paulo', 'SP', '01020-002', 'Sala 202', 2),
(3, 'Clínica Sorriso Perfeito', 'Clínica Odontológica Sorriso', '34.567.890/0001-92', '99999-1236', 'contato@sorrisoperfeito.com', 'Seg a Sex: 8h às 18h', 'Rua C', '300', 'Bela Vista', 'São Paulo', 'SP', '01030-003', 'Sala 203', 3),
(4, 'Clínica Nova Odonto', 'Clínica Odontológica Nova', '45.678.901/0001-93', '99999-1237', 'contato@novaodonto.com', 'Seg a Sex: 10h às 19h', 'Rua D', '400', 'Jardins', 'São Paulo', 'SP', '01040-004', 'Sala 204', 4),
(5, 'OdontoPrime', 'Clínica Odontológica Prime', '56.789.012/0001-94', '99999-1238', 'contato@odontoprime.com', 'Seg a Sab: 9h às 18h', 'Rua E', '500', 'Itaim', 'São Paulo', 'SP', '01050-005', 'Sala 205', 5),
(6, 'Clínica Excelência Dental', 'Clínica Odontológica Excelência', '67.890.123/0001-95', '99999-1239', 'contato@excelenciadental.com', 'Seg a Sex: 8h às 20h', 'Rua F', '600', 'Vila Olímpia', 'São Paulo', 'SP', '01060-006', 'Sala 206', 6),
(7, 'OdontoCare', 'Clínica Odontológica Care', '78.901.234/0001-96', '99999-1240', 'contato@odontocare.com', 'Seg a Sex: 9h às 18h', 'Rua G', '700', 'Pinheiros', 'São Paulo', 'SP', '01070-007', 'Sala 207', 7),
(8, 'Sorriso & Saúde', 'Clínica Odontológica Sorriso', '89.012.345/0001-97', '99999-1241', 'contato@sorrisosaude.com', 'Seg a Sex: 8h às 17h', 'Rua H', '800', 'Tatuapé', 'São Paulo', 'SP', '01080-008', 'Sala 208', 8),
(9, 'Clínica Dental Pro', 'Clínica Odontológica Pro', '90.123.456/0001-98', '99999-1242', 'contato@dentalpro.com', 'Seg a Sex: 9h às 17h', 'Rua I', '900', 'Bela Vista', 'São Paulo', 'SP', '01090-009', 'Sala 209', 9),
(10, 'OdontoMais Saúde', 'Clínica Odontológica Mais Saúde', '01.234.567/0001-99', '99999-1243', 'contato@odontomais.com.br', 'Seg a Sab: 8h às 20h', 'Rua J', '1000', 'Vila Mariana', 'São Paulo', 'SP', '01100-010', 'Sala 210', 10);

-- Inserir dados na tabela endereco
INSERT INTO `clinicadb`.`endereco` 
(idEndereco, rua, numero, bairro, cidade, UF, CEP, complemento, dentista_idDentista, funcionario_idFuncionario, clinica_idClinica)
VALUES 
(1, 'Rua A', '100', 'Centro', 'São Paulo', 'SP', '01000-000', 'Apartamento 101', 1, 1, 1),
(2, 'Rua B', '200', 'Jardim Botânico', 'Rio de Janeiro', 'RJ', '22010-200', 'Casa 5', 2, 2, 2),
(3, 'Rua C', '300', 'Alto da Lapa', 'Belo Horizonte', 'MG', '30330-300', 'Bloco A, Andar 3', 3, 3, 3),
(4, 'Rua D', '400', 'Centro', 'Curitiba', 'PR', '80010-400', 'Casa 10', 4, 4, 4),
(5, 'Rua E', '500', 'Vila São João', 'Porto Alegre', 'RS', '90010-500', 'Apartamento 202', 5, 5, 5),
(6, 'Rua F', '600', 'Vila Nova', 'Brasília', 'DF', '70000-600', 'Sobrado', 6, 6, 6),
(7, 'Rua G', '700', 'Jardim das Flores', 'São Paulo', 'SP', '05000-700', 'Casa 12', 7, 7, 7),
(8, 'Rua H', '800', 'Vila América', 'Rio de Janeiro', 'RJ', '21000-800', 'Casa 15', 8, 8, 8),
(9, 'Rua I', '900', 'Parque dos Ipês', 'Brasília', 'DF', '71000-900', 'Apartamento 304', 9, 9, 9),
(10, 'Rua J', '1000', 'Vila Carolina', 'Curitiba', 'PR', '82000-100', 'Apartamento 501', 10, 10, 10);

-- Inserir dados na tabela `paciente`
INSERT INTO `clinicadb`.`paciente` (idPaciente, nome, CPF, dataNasc, genero, telefone, email, historico, rua, numero, bairro, cidade, UF, CEP, endereco_idEndereco)
VALUES
(1, 'Maria Silva', '123.456.789-00', '1990-05-15', 'Feminino', '(11) 98765-4321', 'maria.silva@email.com', 'Nenhuma condição pré-existente', 'Rua A', '100', 'Centro', 'São Paulo', 'SP', '01000-000', 1),
(2, 'João Oliveira', '234.567.890-11', '1985-08-22', 'Masculino', '(21) 98765-4321', 'joao.oliveira@email.com', 'Alergia a amendoim', 'Rua B', '200', 'Jardim Botânico', 'Rio de Janeiro', 'RJ', '22010-200', 2),
(3, 'Ana Souza', '345.678.901-22', '1975-11-05', 'Feminino', '(31) 99988-7766', 'ana.souza@email.com', 'Hipertensão', 'Rua C', '300', 'Alto da Lapa', 'Belo Horizonte', 'MG', '30330-300', 3),
(4, 'Carlos Pereira', '456.789.012-33', '1992-01-10', 'Masculino', '(41) 98877-6655', 'carlos.pereira@email.com', 'Nenhuma condição pré-existente', 'Rua D', '400', 'Centro', 'Curitiba', 'PR', '80010-400', 4),
(5, 'Juliana Costa', '567.890.123-44', '1988-02-28', 'Feminino', '(51) 99123-4567', 'juliana.costa@email.com', 'Asma', 'Rua E', '500', 'Vila São João', 'Porto Alegre', 'RS', '90010-500', 5),
(6, 'Roberto Almeida', '678.901.234-55', '2000-06-10', 'Masculino', '(61) 99234-8765', 'roberto.almeida@email.com', 'Nenhuma condição pré-existente', 'Rua F', '600', 'Vila Nova', 'Brasília', 'DF', '70000-600', 6),
(7, 'Fernanda Lima', '789.012.345-66', '1995-07-25', 'Feminino', '(11) 95555-1234', 'fernanda.lima@email.com', 'Diabetes tipo 1', 'Rua G', '700', 'Jardim das Flores', 'São Paulo', 'SP', '05000-700', 7),
(8, 'Ricardo Santos', '890.123.456-77', '1982-09-30', 'Masculino', '(21) 98888-1234', 'ricardo.santos@email.com', 'Nenhuma condição pré-existente', 'Rua H', '800', 'Vila América', 'Rio de Janeiro', 'RJ', '21000-800', 8),
(9, 'Larissa Oliveira', '901.234.567-88', '1998-03-14', 'Feminino', '(61) 98345-6789', 'larissa.oliveira@email.com', 'Tireoidite', 'Rua I', '900', 'Parque dos Ipês', 'Brasília', 'DF', '71000-900', 9),
(10, 'Felipe Martins', '012.345.678-99', '2002-12-22', 'Masculino', '(41) 98888-1234', 'felipe.martins@email.com', 'Nenhuma condição pré-existente', 'Rua J', '1000', 'Vila Carolina', 'Curitiba', 'PR', '82000-100', 10);


-- Inserir dados na tabela `faturamento`
INSERT INTO `clinicadb`.`faturamento` (`idFaturamento`, `idPaciente`, `valorTotal`, `statusPag`)
VALUES
(1, 1, 350.00, 'Pago'),
(2, 2, 200.00, 'Pago'),
(3, 3, 500.00, 'Pago'),
(4, 4, 1500.00, 'Pago'),
(5, 5, 300.00, 'Pago'),
(6, 6, 700.00, 'Pago'),
(7, 7, 2000.00, 'Pago'),
(8, 8, 400.00, 'Pago'),
(9, 9, 1200.00, 'Pago'),
(10, 10, 100.00, 'Pago');


-- Inserir dados na tabela `labexterno`
INSERT INTO `clinicadb`.`labexterno` (`idLaboratorio`, `nome`, `email`, `telefone`, `idEndereco`)
VALUES
(1, 'Laboratório Odonto X', 'contato@labx.com', '4002-8922', 1),
(2, 'Laboratório Odonto Y', 'contato@laby.com', '4002-8923', 2),
(3, 'Laboratório Odonto Z', 'contato@labz.com', '4002-8924', 3),
(4, 'Laboratório Odonto W', 'contato@labw.com', '4002-8925', 4),
(5, 'Laboratório Odonto V', 'contato@labv.com', '4002-8926', 5),
(6, 'Laboratório Odonto U', 'contato@labu.com', '4002-8927', 6),
(7, 'Laboratório Odonto T', 'contato@labt.com', '4002-8928', 7),
(8, 'Laboratório Odonto S', 'contato@labs.com', '4002-8929', 8),
(9, 'Laboratório Odonto R', 'contato@labr.com', '4002-8930', 9),
(10, 'Laboratório Odonto Q', 'contato@labq.com', '4002-8931', 10);

-- Inserir dados na tabela `procedimento`
INSERT INTO `clinicadb`.`procedimentoodont` 
(idProcedimento, nomeProcedimento, descricao, valor)
VALUES 
(1, 'Limpeza Dentária', 'Procedimento para remoção de placa bacteriana e tártaro.', 150.00),
(2, 'Restauração', 'Reparo de dentes danificados com material dental.', 300.00),
(3, 'Canal', 'Tratamento de canais dentários danificados ou infectados.', 600.00),
(4, 'Extração de Dente', 'Remoção de dentes permanentes ou temporários.', 250.00),
(5, 'Clareamento Dentário', 'Procedimento estético para clarear dentes.', 400.00),
(6, 'Implante Dentário', 'Substituição de dentes faltantes por implantes.', 1500.00),
(7, 'Apinhamento Dental', 'Tratamento para correção de dentes desalinhados.', 1200.00),
(8, 'Ortodontia', 'Correção de problemas de alinhamento dental e mandíbula.', 1800.00),
(9, 'Proteses Dentárias', 'Substituição de dentes por próteses removíveis ou fixas.', 1000.00),
(10, 'Odontopediatria', 'Atendimento odontológico especializado para crianças.', 200.00);

-- Inserir dados na tabela `receita`
INSERT INTO `clinicadb`.`receita` 
(idReceita, categoria, tipo, valor, paciente_idPaciente)
VALUES 
(1, 'Medicamento', 'Antibiótico', 100.00, 1),
(2, 'Tratamento', 'Fisioterapia', 150.00, 2),
(3, 'Medicamento', 'Analgésico', 50.00, 3),
(4, 'Medicamento', 'Anti-inflamatório', 120.00, 4),
(5, 'Medicamento', 'Antidepressivo', 80.00, 5),
(6, 'Tratamento', 'Ortodontia', 1200.00, 6),
(7, 'Medicamento', 'Antialérgico', 40.00, 7),
(8, 'Tratamento', 'Clareamento Dentário', 400.00, 8),
(9, 'Medicamento', 'Analgésico', 60.00, 9),
(10, 'Medicamento', 'Sedativo', 150.00, 10);

ALTER TABLE `agendamento` MODIFY COLUMN `idAgendamento` INT NOT NULL AUTO_INCREMENT;
-- Inserir dados na tabela `agendamento`
INSERT INTO `clinicadb`.`agendamento` (idPaciente, idDentista, idFuncionario, dataHora)
VALUES
(1, 1, 1, '2025-04-28 08:30:00'),
(2, 2, 2, '2025-04-28 09:00:00'),
(3, 3, 3, '2025-04-28 09:30:00'),
(4, 4, 4, '2025-04-28 10:00:00'),
(5, 5, 5, '2025-04-28 10:30:00'),
(6, 6, 6, '2025-04-28 11:00:00'),
(7, 7, 7, '2025-04-28 11:30:00'),
(8, 8, 8, '2025-04-28 12:00:00'),
(9, 9, 9, '2025-04-28 12:30:00'),
(10, 10, 10, '2025-04-28 13:00:00');




-- Inserir dados na tabela `registroclin`
INSERT INTO `clinicadb`.`registroclin` (idAgendamento, idPaciente, idDentista, idProcedimento, dataHora, diagnostico)
VALUES
(1, 1, 1, 1, '2025-04-28 08:30:00', 'Paciente com dor dental no molar superior direito, recomendada a extração.'),
(2, 2, 2, 2, '2025-04-28 09:00:00', 'Paciente apresenta cárie profunda no dente incisivo inferior, tratamento de canal necessário.'),
(3, 3, 3, 3, '2025-04-28 09:30:00', 'Paciente com sinais de gengivite, recomendada limpeza e orientação de cuidados bucais.'),
(4, 4, 4, 4, '2025-04-28 10:00:00', 'Paciente apresenta problemas com a oclusão, indicado tratamento ortodôntico.'),
(5, 5, 5, 5, '2025-04-28 10:30:00', 'Paciente com dor nas articulações temporomandibulares, recomendada fisioterapia.'),
(6, 6, 6, 6, '2025-04-28 11:00:00', 'Paciente sem queixas, foi realizada limpeza e aplicação de flúor.'),
(7, 7, 7, 7, '2025-04-28 11:30:00', 'Paciente com presença de tártaro, foi realizada raspagem dentária.'),
(8, 8, 8, 8, '2025-04-28 12:00:00', 'Paciente solicitou clareamento dentário, realizado procedimento estético.'),
(9, 9, 9, 9, '2025-04-28 12:30:00', 'Paciente com fratura no dente anterior superior, necessário procedimento de restauração.'),
(10, 10, 10, 10, '2025-04-28 13:00:00', 'Paciente com histórico de problemas periodontais, foi realizado o tratamento periodontal.');


-- Inserir dados na tabela `segurosaude`
INSERT INTO `clinicadb`.`segurosaude` (`idSeguro`, `nomeSeguro`, `cobertura`, `planoSaude`, `paciente_idPaciente`)
VALUES
(1, 'Plano Odontológico X', 'Cobertura completa para tratamentos odontológicos', 'OdontoSaúde', 1),
(2, 'Plano Odontológico Y', 'Cobertura parcial para consultas e exames', 'Saúde Dental', 2),
(3, 'Plano Odontológico Z', 'Cobertura completa para ortodontia', 'DentalCare', 3),
(4, 'Plano Odontológico W', 'Cobertura para cirurgias dentárias', 'Sorriso Legal', 4),
(5, 'Plano Odontológico V', 'Cobertura para limpezas e tratamentos simples', 'Odonto Fácil', 5),
(6, 'Plano Odontológico U', 'Cobertura completa para implantes dentários', 'Saúde Boca', 6),
(7, 'Plano Odontológico T', 'Cobertura para tratamentos estéticos dentários', 'Sorriso Brilhante', 7),
(8, 'Plano Odontológico S', 'Cobertura básica para exames e consultas', 'PlanOdonto', 8),
(9, 'Plano Odontológico R', 'Cobertura para ortodontia e tratamentos estéticos', 'OdontoPlus', 9),
(10, 'Plano Odontológico Q', 'Cobertura completa para toda a família', 'Dental Group', 10);




