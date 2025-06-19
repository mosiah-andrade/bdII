-- 1. Atualizar o telefone de um dentista 
UPDATE `clinicadb`.`dentista`
SET `telefone` = '99999-1111'
WHERE `idDentista` = 1;

-- 2. Atualizar o e-mail de um funcionário
UPDATE `clinicadb`.`funcionario`
SET `email` = 'renato.martins@novaempresa.com'
WHERE `idFuncionario` = 2;

-- 3. Atualizar o salário de um funcionário 
UPDATE `clinicadb`.`funcionario`
SET `salario` = 3500.00
WHERE `idFuncionario` = 3;


-- 4. Deletar um paciente com base no CPF 
-- Deletar todos os registros dependentes primeiro.
DELETE FROM `clinicadb`.`registroclin` WHERE `idPaciente` = 1;
DELETE FROM `clinicadb`.`agendamento` WHERE `idPaciente` = 1;
DELETE FROM `clinicadb`.`faturamento` WHERE `idPaciente` = 1;
DELETE FROM `clinicadb`.`receita` WHERE `paciente_idPaciente` = 1;
DELETE FROM `clinicadb`.`segurosaude` WHERE `paciente_idPaciente` = 1;
-- Agora deletar o paciente:
DELETE FROM `clinicadb`.`paciente` WHERE `idPaciente` = @idPacienteParaDeletar;


-- 5. Atualizar o status de um paciente 
-- Adicionar a coluna à tabela antes de tentar atualizá-la.
ALTER TABLE `clinicadb`.`paciente` ADD COLUMN `status` VARCHAR(20) DEFAULT 'Ativo';
-- Agora atualizar o status funciona:
UPDATE `clinicadb`.`paciente`
SET `status` = 'Inativo'
WHERE `idPaciente` = 5;


-- 6. Deletar um agendamento para um paciente específico
-- Deletar o registro clínico dependente primeiro.
DELETE FROM `clinicadb`.`registroclin` WHERE `idAgendamento` = 4;
-- Agora deletar o agendamento:
DELETE FROM `clinicadb`.`agendamento` WHERE `idAgendamento` = 4;


-- 7. Atualizar o nome de uma clínica 
UPDATE `clinicadb`.`clinica`
SET `nomeFantasia` = 'Clínica Odonto Master'
WHERE `idClinica` = 1;

-- 8. Atualizar o horário de funcionamento de uma clínica
UPDATE `clinicadb`.`clinica`
SET `horarioFuncionamento` = 'Segunda a Sexta, 09:00 - 17:00'
WHERE `idClinica` = 2;


-- 9. Deletar um endereço associado a um dentista
-- Deletar todas as dependências na ordem correta, do "neto" para o "pai" e para o "avô".

-- Passo 1: Deletar o registro clínico (depende do agendamento e do paciente)
DELETE FROM `clinicadb`.`registroclin` WHERE `idAgendamento` = 3;

-- Passo 2: Deletar o agendamento (depende do paciente)
DELETE FROM `clinicadb`.`agendamento` WHERE `idPaciente` = 3;

-- Passo 3: Deletar o faturamento (depende do paciente)
DELETE FROM `clinicadb`.`faturamento` WHERE `idPaciente` = 3;

-- Passo 4: Deletar a receita (depende do paciente)
DELETE FROM `clinicadb`.`receita` WHERE `paciente_idPaciente` = 3;

-- Passo 5: Deletar o seguro de saúde (depende do paciente)
DELETE FROM `clinicadb`.`segurosaude` WHERE `paciente_idPaciente` = 3;

-- Passo 6: Agora que o paciente não tem mais dependências, ele pode ser deletado.
DELETE FROM `clinicadb`.`paciente` WHERE `idPaciente` = 3;

-- Passo 7: Deletar o laboratório externo que também usa o endereço.
DELETE FROM `clinicadb`.`labexterno` WHERE `idLaboratorio` = 3;

-- Passo 8: Finalmente, com todos os seus dependentes removidos, o endereço pode ser deletado.
DELETE FROM `clinicadb`.`endereco` WHERE `idEndereco` = 3;

-- Passo 9: Deletar o registro clínico (depende do agendamento e do paciente)
DELETE FROM `clinicadb`.`registroclin` WHERE `idAgendamento` = 3;

-- 10. Atualizar a cobertura de um seguro de saúde
UPDATE `clinicadb`.`segurosaude`
SET `cobertura` = 'Cobertura nacional'
WHERE `idSeguro` = 6;

-- 11. Deletar um laboratório externo 
DELETE FROM `clinicadb`.`labexterno`
WHERE `idLaboratorio` = 1;


-- 12. Deletar um procedimento odontológico 
-- Deletar o registro clínico que usa este procedimento primeiro.
DELETE FROM `clinicadb`.`registroclin` WHERE `idProcedimento` = 2;
-- Agora deletar o procedimento:
DELETE FROM `clinicadb`.`procedimentoodont` WHERE `idProcedimento` = 2;


-- 13. Atualizar o telefone de um funcionário 
UPDATE `clinicadb`.`funcionario`
SET `telefone` = '99999-3000'
WHERE `idFuncionario` = 3;

-- 14. Deletar um registro clínico associado a um agendamento específico
DELETE FROM `clinicadb`.`registroclin`
WHERE `idAgendamento` = 4;


-- 15. Atualizar o valor total de um faturamento 
UPDATE `clinicadb`.`faturamento`
SET `valorTotal` = 1200.00
WHERE `idFaturamento` = 3;

-- 16. Deletar um faturamento de um paciente específico 
DELETE FROM `clinicadb`.`faturamento`
WHERE `idPaciente` = 5;

-- 17. Atualizar o nome de um paciente 
UPDATE `clinicadb`.`paciente`
SET `nome` = 'Carlos Eduardo Oliveira'
WHERE `idPaciente` = 7;


-- 18. Deletar todos os agendamentos de um dentista específico
-- Deletar o registro clínico dependente primeiro.
DELETE FROM `clinicadb`.`registroclin` WHERE `idAgendamento` IN (SELECT idAgendamento FROM `clinicadb`.`agendamento` WHERE `idDentista` = 2);
-- Agora eletar os agendamentos:
DELETE FROM `clinicadb`.`agendamento` WHERE `idDentista` = 2;


-- 19. Atualizar o cargo de um funcionário 
UPDATE `clinicadb`.`funcionario`
SET `cargo` = 'Coordenador de Consultório'
WHERE `idFuncionario` = 9;

-- 20. Deletar todos os registros clínicos de um paciente específico
DELETE FROM `clinicadb`.`registroclin`
WHERE `idPaciente` = 6;