
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