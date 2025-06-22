-- =====================================================================
-- PARTE 1: CRIAÇÃO DOS TRIGGERS (DDL)
-- Banco de Dados: clinicadb
-- =====================================================================

-- Define o delimitador para permitir a criação de blocos de código
DELIMITER $$

-- -----------------------------------------------------
-- Tabela de Auditoria para Logs
-- Será usada por alguns triggers para registrar ações importantes.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auditoria_logs` (
  `idLog` INT NOT NULL AUTO_INCREMENT,
  `tabela_afetada` VARCHAR(50) NULL,
  `id_afetado` INT NULL,
  `acao` VARCHAR(255) NULL,
  `data_hora` DATETIME NULL,
  `usuario_db` VARCHAR(100) NULL,
  PRIMARY KEY (`idLog`));
$$

-- -----------------------------------------------------
-- Trigger 1: Validar Idade do Paciente Antes de Inserir
-- Objetivo: Impedir o registo de pacientes com menos de 3 anos de idade.
-- -----------------------------------------------------
CREATE TRIGGER `trg_before_insert_paciente_idade`
BEFORE INSERT ON `paciente`
FOR EACH ROW
BEGIN
    -- Usa a função criada anteriormente para calcular a idade
    IF fn_calcular_idade_paciente(NEW.dataNasc) < 3 THEN
        -- Lança um erro personalizado que cancela a operação
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Não é permitido registar pacientes com menos de 3 anos.';
    END IF;
END$$

-- -----------------------------------------------------
-- Trigger 2: Log de Novos Faturamentos
-- Objetivo: Registar automaticamente um log na tabela de auditoria sempre que uma nova fatura for criada.
-- -----------------------------------------------------
CREATE TRIGGER `trg_after_insert_faturamento_log`
AFTER INSERT ON `faturamento`
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_logs (tabela_afetada, id_afetado, acao, data_hora, usuario_db)
    VALUES ('faturamento', NEW.idFaturamento, CONCAT('Nova fatura criada para o paciente ID ', NEW.idPaciente, ' com o valor de ', NEW.valorTotal), NOW(), USER());
END$$

-- -----------------------------------------------------
-- Trigger 3: Impedir Redução de Salário de Funcionário
-- Objetivo: Prevenir que o salário de um funcionário seja atualizado para um valor menor que o atual.
-- -----------------------------------------------------
CREATE TRIGGER `trg_before_update_funcionario_salario`
BEFORE UPDATE ON `funcionario`
FOR EACH ROW
BEGIN
    -- Compara o novo valor do salário (NEW.salario) com o valor antigo (OLD.salario)
    IF NEW.salario < OLD.salario THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: A redução de salário não é permitida.';
    END IF;
END$$

-- -----------------------------------------------------
-- Trigger 4: Arquivar Agendamentos Cancelados
-- Objetivo: Antes de um agendamento ser deletado, uma cópia dele é guardada numa tabela de "cancelados".
-- -----------------------------------------------------
-- Primeiro, criamos a tabela para arquivar os agendamentos
CREATE TABLE IF NOT EXISTS `agendamentos_cancelados` (
  `idCancelado` INT NOT NULL AUTO_INCREMENT,
  `idAgendamentoOriginal` INT NULL,
  `dataHoraOriginal` DATETIME NULL,
  `idPaciente` INT NULL,
  `idDentista` INT NULL,
  `dataCancelamento` DATETIME NULL,
  PRIMARY KEY (`idCancelado`));
$$

CREATE TRIGGER `trg_after_delete_agendamento_arquivar`
AFTER DELETE ON `agendamento`
FOR EACH ROW
BEGIN
    -- Insere os dados do agendamento que foi deletado (OLD) na tabela de cancelados
    INSERT INTO agendamentos_cancelados (idAgendamentoOriginal, dataHoraOriginal, idPaciente, idDentista, dataCancelamento)
    VALUES (OLD.idAgendamento, OLD.dataHora, OLD.idPaciente, OLD.idDentista, NOW());
END$$

-- -----------------------------------------------------
-- Trigger 5: Verificar Data de Agendamento
-- Objetivo: Impedir que um novo agendamento seja marcado para uma data ou hora no passado.
-- -----------------------------------------------------
CREATE TRIGGER `trg_before_insert_agendamento_data`
BEFORE INSERT ON `agendamento`
FOR EACH ROW
BEGIN
    -- Compara a data e hora do novo agendamento com a data e hora atuais
    IF NEW.dataHora < NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Não é possível fazer agendamentos em datas passadas.';
    END IF;
END$$

-- -----------------------------------------------------
-- Trigger 6: Auditar Alterações de Contato do Paciente
-- Objetivo: Registar um log sempre que o telefone ou e-mail de um paciente for alterado.
-- -----------------------------------------------------
CREATE TRIGGER `trg_after_update_paciente_contato`
AFTER UPDATE ON `paciente`
FOR EACH ROW
BEGIN
    -- Verifica se o telefone ou o email foram alterados
    IF OLD.telefone <> NEW.telefone OR OLD.email <> NEW.email THEN
        INSERT INTO auditoria_logs (tabela_afetada, id_afetado, acao, data_hora, usuario_db)
        VALUES ('paciente', NEW.idPaciente, CONCAT('Contacto alterado. Tel de: ', OLD.telefone, ' para: ', NEW.telefone, '. Email de: ', OLD.email, ' para: ', NEW.email), NOW(), USER());
    END IF;
END$$

-- Restaura o delimitador padrão
DELIMITER ;

-- =====================================================================
-- PARTE 2: SCRIPTS PARA TESTAR OS TRIGGERS
-- =====================================================================

-- Teste 1: Tentar inserir um paciente com menos de 3 anos (DEVE FALHAR)
-- (Descomente a linha abaixo para testar. Irá gerar um erro.)
 INSERT INTO paciente (idPaciente, nome, CPF, dataNasc, genero, telefone, email, endereco_idEndereco) VALUES (56, 'Bebé Teste', '11122233344', '2024-01-01', 'M', '123456789', 'bebe@teste.com', 1);

-- Teste 2: Inserir um novo faturamento e verificar o log
INSERT INTO faturamento (idFaturamento, idPaciente, valorTotal, statusPag) VALUES (75,2, 250.00, 'Pendente');
SELECT * FROM auditoria_logs WHERE tabela_afetada = 'faturamento' ORDER BY idLog DESC LIMIT 1;

-- Teste 3: Tentar reduzir o salário de um funcionário (DEVE FALHAR)
-- (Descomente a linha abaixo para testar. Irá gerar um erro.)
UPDATE funcionario SET salario = 1500.00 WHERE idFuncionario = 1;

-- Teste 4: Deletar um agendamento e verificar se foi arquivado
-- Primeiro, insira um agendamento para poder deletá-lo
INSERT INTO agendamento (dataHora, idPaciente, idDentista, idFuncionario) VALUES ('2025-12-25 10:00:00', 2, 2, 2);
SET @id_agendamento_teste = LAST_INSERT_ID(); -- Guarda o ID do agendamento inserido
-- Agora, delete o agendamento
DELETE FROM agendamento WHERE idAgendamento = @id_agendamento_teste;
-- Verifique a tabela de cancelados
SELECT * FROM agendamentos_cancelados WHERE idAgendamentoOriginal = @id_agendamento_teste;

-- Teste 5: Tentar criar um agendamento no passado 
INSERT INTO agendamento (dataHora, idPaciente, idDentista, idFuncionario) VALUES ('2020-01-01 14:00:00', 2, 2, 1);

-- Teste 6: Atualizar o contato de um paciente e verificar o log
UPDATE paciente SET email = 'novo.email.teste@email.com', telefone = '9988776655' WHERE idPaciente = 2;
SELECT * FROM auditoria_logs WHERE tabela_afetada = 'paciente' ORDER BY idLog DESC LIMIT 1;

