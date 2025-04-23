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

-- Inserir dados na tabela `paciente`
INSERT INTO `clinicadb`.`paciente` (`idPaciente`, `nome`, `cpf`, `dataNasc`, `telefone`, `email`, `endereco`, `cidade`, `UF`, `CEP`)
VALUES
(1, 'João Silva', '123.456.789-00', '1990-03-12', '99999-1000', 'joao.silva@paciente.com', 'Rua X, 123', 'São Paulo', 'SP', '01010-001'),
(2, 'Maria Oliveira', '234.567.890-01', '1985-07-23', '99999-1001', 'maria.oliveira@paciente.com', 'Rua Y, 456', 'São Paulo', 'SP', '01020-002'),
(3, 'Pedro Costa', '345.678.901-02', '1980-05-15', '99999-1002', 'pedro.costa@paciente.com', 'Rua Z, 789', 'São Paulo', 'SP', '01030-003'),
(4, 'Juliana Pereira', '456.789.012-03', '1992-11-25', '99999-1003', 'juliana.pereira@paciente.com', 'Rua A, 101', 'São Paulo', 'SP', '01040-004'),
(5, 'Carlos Eduardo', '567.890.123-04', '1988-02-10', '99999-1004', 'carlos.eduardo@paciente.com', 'Rua B, 202', 'São Paulo', 'SP', '01050-005'),
(6, 'Fernanda Lima', '678.901.234-05', '1995-06-18', '99999-1005', 'fernanda.lima@paciente.com', 'Rua C, 303', 'São Paulo', 'SP', '01060-006'),
(7, 'Roberto Santos', '789.012.345-06', '1993-09-30', '99999-1006', 'roberto.santos@paciente.com', 'Rua D, 404', 'São Paulo', 'SP', '01070-007'),
(8, 'Ana Clara', '890.123.456-07', '1990-01-12', '99999-1007', 'ana.clara@paciente.com', 'Rua E, 505', 'São Paulo', 'SP', '01080-008'),
(9, 'Eduardo Martins', '901.234.567-08', '1987-10-22', '99999-1008', 'eduardo.martins@paciente.com', 'Rua F, 606', 'São Paulo', 'SP', '01090-009'),
(10, 'Patrícia Rocha', '012.345.678-09', '1991-04-16', '99999-1009', 'patricia.rocha@paciente.com', 'Rua G, 707', 'São Paulo', 'SP', '01100-010');

-- Inserir dados na tabela `agendamento`
INSERT INTO `clinicadb`.`agendamento` (`idAgendamento`, `idPaciente`, `idDentista`, `dataAgendamento`, `horaAgendamento`, `status`)
VALUES
(1, 1, 1, '2025-05-05', '09:00:00', 'Confirmado'),
(2, 2, 2, '2025-05-06', '10:00:00', 'Confirmado'),
(3, 3, 3, '2025-05-07', '11:00:00', 'Confirmado'),
(4, 4, 4, '2025-05-08', '14:00:00', 'Confirmado'),
(5, 5, 5, '2025-05-09', '15:00:00', 'Confirmado'),
(6, 6, 6, '2025-05-10', '16:00:00', 'Confirmado'),
(7, 7, 7, '2025-05-11', '17:00:00', 'Confirmado'),
(8, 8, 8, '2025-05-12', '18:00:00', 'Confirmado'),
(9, 9, 9, '2025-05-13', '09:00:00', 'Confirmado'),
(10, 10, 10, '2025-05-14', '10:00:00', 'Confirmado');

-- Inserir dados na tabela `consulta`
INSERT INTO `clinicadb`.`consulta` (`idConsulta`, `idAgendamento`, `dataConsulta`, `horaConsulta`, `status`, `procedimento`)
VALUES
(1, 1, '2025-05-05', '09:00:00', 'Realizada', 'Exame de Ressonância'),
(2, 2, '2025-05-06', '10:00:00', 'Realizada', 'Limpeza Dental'),
(3, 3, '2025-05-07', '11:00:00', 'Realizada', 'Extração de Dente'),
(4, 4, '2025-05-08', '14:00:00', 'Realizada', 'Implante Dentário'),
(5, 5, '2025-05-09', '15:00:00', 'Realizada', 'Restauração'),
(6, 6, '2025-05-10', '16:00:00', 'Realizada', 'Tratamento de Canal'),
(7, 7, '2025-05-11', '17:00:00', 'Realizada', 'Ortodontia (Aparelho)'),
(8, 8, '2025-05-12', '18:00:00', 'Realizada', 'Clareamento Dental'),
(9, 9, '2025-05-13', '09:00:00', 'Realizada', 'Cirurgia Oral'),
(10, 10, '2025-05-14', '10:00:00', 'Realizada', 'Consultoria de Saúde Bucal');

-- Inserir dados na tabela `procedimento`
INSERT INTO `clinicadb`.`procedimento` (`idProcedimento`, `descricao`, `valor`, `tempoEstimado`, `idDentista`)
VALUES
(1, 'Exame de Ressonância', 350.00, '30 minutos', 1),
(2, 'Limpeza Dental', 200.00, '45 minutos', 2),
(3, 'Extração de Dente', 500.00, '60 minutos', 3),
(4, 'Implante Dentário', 1500.00, '120 minutos', 4),
(5, 'Restauração', 300.00, '90 minutos', 5),
(6, 'Tratamento de Canal', 700.00, '120 minutos', 6),
(7, 'Ortodontia (Aparelho)', 2000.00, '180 minutos', 7),
(8, 'Clareamento Dental', 400.00, '60 minutos', 8),
(9, 'Cirurgia Oral', 1200.00, '120 minutos', 9),
(10, 'Consultoria de Saúde Bucal', 100.00, '30 minutos', 10);

-- Inserir dados na tabela `conta`
INSERT INTO `clinicadb`.`conta` (`idConta`, `idPaciente`, `idConsulta`, `valorTotal`, `dataPagamento`, `statusPagamento`)
VALUES
(1, 1, 1, 350.00, '2025-05-05', 'Paga'),
(2, 2, 2, 200.00, '2025-05-06', 'Paga'),
(3, 3, 3, 500.00, '2025-05-07', 'Paga'),
(4, 4, 4, 1500.00, '2025-05-08', 'Paga'),
(5, 5, 5, 300.00, '2025-05-09', 'Paga'),
(6, 6, 6, 700.00, '2025-05-10', 'Paga'),
(7, 7, 7, 2000.00, '2025-05-11', 'Paga'),
(8, 8, 8, 400.00, '2025-05-12', 'Paga'),
(9, 9, 9, 1200.00, '2025-05-13', 'Paga'),
(10, 10, 10, 100.00, '2025-05-14', 'Paga');

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

-- Inserir dados na tabela `registroclin`
INSERT INTO `clinicadb`.`registroclin` (`idRegistroClin`, `idAgendamento`, `idPaciente`, `idDentista`, `idProcedimento`, `dataHora`, `diagnostico`)
VALUES
(1, 1, 1, 1, 1, '2025-05-05 09:00:00', 'Paciente com dentes saudáveis, exame preventivo realizado.'),
(2, 2, 2, 2, 2, '2025-05-06 10:00:00', 'Paciente realizou limpeza dental, sem alterações significativas.'),
(3, 3, 3, 3, 3, '2025-05-07 11:00:00', 'Extração de dente realizada com sucesso, paciente segue recomendação de cuidados.'),
(4, 4, 4, 4, 4, '2025-05-08 14:00:00', 'Implante dentário realizado, paciente em processo de recuperação.'),
(5, 5, 5, 5, 5, '2025-05-09 15:00:00', 'Restauração de dente realizada com êxito, paciente orientado.'),
(6, 6, 6, 6, 6, '2025-05-10 16:00:00', 'Tratamento de canal realizado, paciente orientado quanto aos cuidados pós-procedimento.'),
(7, 7, 7, 7, 7, '2025-05-11 17:00:00', 'Aparelho ortodôntico instalado, paciente já foi orientado sobre cuidados.'),
(8, 8, 8, 8, 8, '2025-05-12 18:00:00', 'Clareamento dental realizado, paciente com dentes visivelmente mais brancos.'),
(9, 9, 9, 9, 9, '2025-05-13 09:00:00', 'Cirurgia oral realizada com sucesso, paciente em processo de recuperação.'),
(10, 10, 10, 10, 10, '2025-05-14 10:00:00', 'Consultoria de saúde bucal realizada, paciente com boas condições de higiene oral.');

-- Inserir dados na tabela `dentista`
INSERT INTO `clinicadb`.`dentista` (`idDentista`, `nome`, `email`, `telefone`, `especialidade`, `CFO`)
VALUES
(1, 'Dr. João Almeida', 'joao.almeida@dentista.com', '99999-2000', 'Endodontia', 'CFO12345'),
(2, 'Dra. Maria Costa', 'maria.costa@dentista.com', '99999-2001', 'Ortodontia', 'CFO12346'),
(3, 'Dr. Pedro Oliveira', 'pedro.oliveira@dentista.com', '99999-2002', 'Cirurgia Oral', 'CFO12347'),
(4, 'Dra. Juliana Souza', 'juliana.souza@dentista.com', '99999-2003', 'Implantes Dentários', 'CFO12348'),
(5, 'Dr. Carlos Silva', 'carlos.silva@dentista.com', '99999-2004', 'Periodontia', 'CFO12349'),
(6, 'Dra. Fernanda Lopes', 'fernanda.lopes@dentista.com', '99999-2005', 'Clínica Geral', 'CFO12350'),
(7, 'Dr. Roberto Lima', 'roberto.lima@dentista.com', '99999-2006', 'Estética Dentária', 'CFO12351'),
(8, 'Dra. Ana Clara', 'ana.clara@dentista.com', '99999-2007', 'Próteses Dentárias', 'CFO12352'),
(9, 'Dr. Eduardo Martins', 'eduardo.martins@dentista.com', '99999-2008', 'Odontopediatria', 'CFO12353'),
(10, 'Dra. Patrícia Rocha', 'patricia.rocha@dentista.com', '99999-2009', 'Odontogeriatria', 'CFO12354');

-- Inserir dados na tabela `funcionario` (continuação)
INSERT INTO `clinicadb`.`funcionario` (`idFuncionario`, `nome`, `CPF`, `dataNasc`, `genero`, `telefone`, `email`, `cargo`, `salario`, `status`)
VALUES
(4, 'Fernanda Souza', '456.789.012-03', '1995-07-05', 'Feminino', '99999-3003', 'fernanda.souza@funcionario.com', 'Higienista', 2800.00, 'Ativo'),
(5, 'Lucas Pereira', '567.890.123-04', '1989-12-18', 'Masculino', '99999-3004', 'lucas.pereira@funcionario.com', 'Gerente Administrativo', 4000.00, 'Ativo'),
(6, 'Roberta Lima', '678.901.234-05', '1993-01-25', 'Feminino', '99999-3005', 'roberta.lima@funcionario.com', 'Auxiliar de Laboratório', 2200.00, 'Ativo'),
(7, 'Rafael Costa', '789.012.345-06', '1997-03-30', 'Masculino', '99999-3006', 'rafael.costa@funcionario.com', 'Recepcionista', 2000.00, 'Ativo'),
(8, 'Mariana Rocha', '890.123.456-07', '1987-05-10', 'Feminino', '99999-3007', 'mariana.rocha@funcionario.com', 'Auxiliar de Consultório', 2400.00, 'Ativo'),
(9, 'Gustavo Martins', '901.234.567-08', '1990-09-20', 'Masculino', '99999-3008', 'gustavo.martins@funcionario.com', 'Dentista', 5000.00, 'Ativo'),
(10, 'Camila Barbosa', '012.345.678-09', '1994-11-17', 'Feminino', '99999-3009', 'camila.barbosa@funcionario.com', 'Gerente de RH', 4500.00, 'Ativo');

-- Inserir dados na tabela `clinica`
INSERT INTO `clinicadb`.`clinica` (`idClinica`, `nomeFantasia`, `nome`, `CNPJ`, `telefone`, `email`, `horarioFuncionamento`, `rua`, `numero`, `bairro`, `cidade`, `UF`, `CEP`, `complemento`, `dentista_idDentista`)
VALUES
(1, 'Clínica Odonto X', 'Clínica Odontológica X', '12.345.678/0001-90', '4002-8922', 'contato@odontox.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua X', '123', 'Centro', 'São Paulo', 'SP', '01010-000', 'Apto 101', 1),
(2, 'Clínica Odonto Y', 'Clínica Odontológica Y', '23.456.789/0001-91', '4002-8923', 'contato@odontoy.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua Y', '124', 'Centro', 'São Paulo', 'SP', '01020-000', 'Apto 102', 2),
(3, 'Clínica Odonto Z', 'Clínica Odontológica Z', '34.567.890/0001-92', '4002-8924', 'contato@odontoz.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua Z', '125', 'Centro', 'São Paulo', 'SP', '01030-000', 'Apto 103', 3),
(4, 'Clínica Odonto W', 'Clínica Odontológica W', '45.678.901/0001-93', '4002-8925', 'contato@odontow.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua W', '126', 'Centro', 'São Paulo', 'SP', '01040-000', 'Apto 104', 4),
(5, 'Clínica Odonto V', 'Clínica Odontológica V', '56.789.012/0001-94', '4002-8926', 'contato@odontov.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua V', '127', 'Centro', 'São Paulo', 'SP', '01050-000', 'Apto 105', 5),
(6, 'Clínica Odonto U', 'Clínica Odontológica U', '67.890.123/0001-95', '4002-8927', 'contato@odontou.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua U', '128', 'Centro', 'São Paulo', 'SP', '01060-000', 'Apto 106', 6),
(7, 'Clínica Odonto T', 'Clínica Odontológica T', '78.901.234/0001-96', '4002-8928', 'contato@odontot.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua T', '129', 'Centro', 'São Paulo', 'SP', '01070-000', 'Apto 107', 7),
(8, 'Clínica Odonto S', 'Clínica Odontológica S', '89.012.345/0001-97', '4002-8929', 'contato@odontos.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua S', '130', 'Centro', 'São Paulo', 'SP', '01080-000', 'Apto 108', 8),
(9, 'Clínica Odonto R', 'Clínica Odontológica R', '90.123.456/0001-98', '4002-8930', 'contato@odontor.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua R', '131', 'Centro', 'São Paulo', 'SP', '01090-000', 'Apto 109', 9),
(10, 'Clínica Odonto Q', 'Clínica Odontológica Q', '01.234.567/0001-99', '4002-8931', 'contato@odontoq.com', 'Segunda a Sexta, 08:00 - 18:00', 'Rua Q', '132', 'Centro', 'São Paulo', 'SP', '01100-000', 'Apto 110', 10);

-- Inserir dados na tabela `endereco`
INSERT INTO `clinicadb`.`endereco` (`idEndereco`, `rua`, `numero`, `bairro`, `cidade`, `UF`, `CEP`, `complemento`, `dentista_idDentista`, `funcionario_idFuncionario`, `clinica_idClinica`)
VALUES
(1, 'Rua X', '123', 'Centro', 'São Paulo', 'SP', '01010-000', 'Apto 101', 1, 1, 1),
(2, 'Rua Y', '124', 'Centro', 'São Paulo', 'SP', '01020-000', 'Apto 102', 2, 2, 2),
(3, 'Rua Z', '125', 'Centro', 'São Paulo', 'SP', '01030-000', 'Apto 103', 3, 3, 3),
(4, 'Rua W', '126', 'Centro', 'São Paulo', 'SP', '01040-000', 'Apto 104', 4, 4, 4),
(5, 'Rua V', '127', 'Centro', 'São Paulo', 'SP', '01050-000', 'Apto 105', 5, 5, 5),
(6, 'Rua U', '128', 'Centro', 'São Paulo', 'SP', '01060-000', 'Apto 106', 6, 6, 6),
(7, 'Rua T', '129', 'Centro', 'São Paulo', 'SP', '01070-000', 'Apto 107', 7, 7, 7),
(8, 'Rua S', '130', 'Centro', 'São Paulo', 'SP', '01080-000', 'Apto 108', 8, 8, 8),
(9, 'Rua R', '131', 'Centro', 'São Paulo', 'SP', '01090-000', 'Apto 109', 9, 9, 9),
(10, 'Rua Q', '132', 'Centro', 'São Paulo', 'SP', '01100-000', 'Apto 110', 10, 10, 10);

