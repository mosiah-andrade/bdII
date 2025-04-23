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
DELETE FROM `clinicadb`.`paciente`
WHERE `CPF` = '123.456.789-00';

-- 5. Atualizar o status de um paciente
UPDATE `clinicadb`.`paciente`
SET `status` = 'Inativo'
WHERE `idPaciente` = 5;

-- 6. Deletar um agendamento para um paciente específico
DELETE FROM `clinicadb`.`agendamento`
WHERE `idPaciente` = 4;

-- 7. Atualizar o nome de uma clínica
UPDATE `clinicadb`.`clinica`
SET `nomeFantasia` = 'Clínica Odonto Master'
WHERE `idClinica` = 1;

-- 8. Atualizar o horário de funcionamento de uma clínica
UPDATE `clinicadb`.`clinica`
SET `horarioFuncionamento` = 'Segunda a Sexta, 09:00 - 17:00'
WHERE `idClinica` = 2;

-- 9. Deletar um endereço associado a um dentista
DELETE FROM `clinicadb`.`endereco`
WHERE `dentista_idDentista` = 3;

-- 10. Atualizar a cobertura de um seguro de saúde
UPDATE `clinicadb`.`segurosaude`
SET `cobertura` = 'Cobertura nacional'
WHERE `idSeguro` = 6;

-- 11. Deletar um laboratório externo
DELETE FROM `clinicadb`.`labexterno`
WHERE `idLaboratorio` = 1;

-- 12. Deletar um procedimento odontológico
DELETE FROM `clinicadb`.`procedimentoodont`
WHERE `idProcedimento` = 2;

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
DELETE FROM `clinicadb`.`agendamento`
WHERE `idDentista` = 2;

-- 19. Atualizar o cargo de um funcionário
UPDATE `clinicadb`.`funcionario`
SET `cargo` = 'Coordenador de Consultório'
WHERE `idFuncionario` = 9;

-- 20. Deletar todos os registros clínicos de um paciente específico
DELETE FROM `clinicadb`.`registroclin`
WHERE `idPaciente` = 6;
