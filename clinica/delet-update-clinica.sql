

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
