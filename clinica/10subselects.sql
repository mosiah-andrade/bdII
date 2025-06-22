-- =====================================================================
-- CONSULTAS E RELATÓRIOS (DQL) PARA O BANCO DE DADOS clinicadb
-- Nota: Todas as consultas utilizam JOIN ou Subquery, conforme solicitado.
-- =====================================================================

-- -----------------------------------------------------
-- Consultas sobre Pacientes
-- -----------------------------------------------------

-- 1. Listar todos os pacientes e os seus respetivos seguros de saúde.
SELECT 
    p.nome AS nome_paciente,
    p.telefone,
    ss.nomeSeguro AS nome_do_seguro,
    ss.planoSaude AS plano
FROM 
    paciente p
JOIN 
    segurosaude ss ON p.idPaciente = ss.paciente_idPaciente
ORDER BY 
    p.nome;

-- 2. Listar pacientes de uma cidade específica e a data do seu próximo agendamento.
SELECT 
    p.nome AS nome_paciente,
    p.cidade,
    a.dataHora AS proximo_agendamento
FROM 
    paciente p
JOIN 
    agendamento a ON p.idPaciente = a.idPaciente
WHERE 
    p.cidade = 'São Paulo' AND a.dataHora >= NOW()
ORDER BY
    a.dataHora;

-- 3. Encontrar pacientes que nunca realizaram um procedimento odontológico.
SELECT 
    p.nome,
    p.email
FROM 
    paciente p
WHERE 
    p.idPaciente NOT IN (SELECT DISTINCT idPaciente FROM registroclin);

-- 4. Mostrar o histórico completo de procedimentos de um paciente específico (ID = 1).
SELECT 
    p.nome AS nome_paciente,
    r.dataHora AS data_atendimento,
    d.nome AS nome_dentista,
    pr.nomeProcedimento,
    pr.valor,
    r.diagnostico
FROM 
    paciente p
JOIN 
    registroclin r ON p.idPaciente = r.idPaciente
JOIN 
    dentista d ON r.idDentista = d.idDentista
JOIN 
    procedimentoodont pr ON r.idProcedimento = pr.idProcedimento
WHERE 
    p.idPaciente = 2
ORDER BY 
    r.dataHora DESC;

-- 5. Listar pacientes com mais de 60 anos que possuem um seguro de saúde da 'SulAmérica'.
SELECT 
    p.nome,
    fn_calcular_idade_paciente(p.dataNasc) AS idade,
    ss.nomeSeguro
FROM 
    paciente p
JOIN 
    segurosaude ss ON p.idPaciente = ss.paciente_idPaciente
WHERE 
    fn_calcular_idade_paciente(p.dataNasc) > 30 AND ss.nomeSeguro = 'Plano Odontológico Y';

-- 6. Listar pacientes e a data do seu último agendamento na clínica.
SELECT 
    p.nome,
    p.telefone,
    (SELECT MAX(a.dataHora) 
     FROM agendamento a 
     WHERE a.idPaciente = p.idPaciente) AS data_ultimo_agendamento
FROM 
    paciente p
ORDER BY
    data_ultimo_agendamento DESC;

-- -----------------------------------------------------
-- Consultas sobre Agendamentos e Atendimentos
-- -----------------------------------------------------

-- 7. Listar todos os agendamentos para o próximo mês com nomes de paciente e dentista.
SELECT 
    a.dataHora,
    p.nome AS nome_paciente,
    d.nome AS nome_dentista
FROM 
    agendamento a
JOIN 
    paciente p ON a.idPaciente = p.idPaciente
JOIN 
    dentista d ON a.idDentista = d.idDentista
WHERE 
    a.dataHora BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 MONTH)
ORDER BY 
    a.dataHora;

-- 8. Encontrar agendamentos que ocorreram mas ainda não possuem registo clínico (consultas pendentes de finalização).
SELECT
    a.idAgendamento,
    a.dataHora,
    p.nome AS nome_paciente
FROM
    agendamento a
LEFT JOIN
    registroclin r ON a.idAgendamento = r.idAgendamento
JOIN
    paciente p ON a.idPaciente = p.idPaciente
WHERE
    r.idRegistroClin IS NULL AND a.dataHora < NOW();

-- 9. Quais dentistas realizaram procedimentos de 'Clareamento Dental'?
SELECT DISTINCT
    d.nome,
    d.especialidade
FROM
    dentista d
JOIN
    registroclin r ON d.idDentista = r.idDentista
JOIN
    procedimentoodont p ON r.idProcedimento = p.idProcedimento
WHERE
    p.nomeProcedimento = 'Limpeza Dentária';

-- 10. Mostrar o diagnóstico para cada consulta de um dentista específico (ID = 2).
SELECT 
    r.dataHora,
    p.nome AS paciente,
    r.diagnostico
FROM 
    registroclin r
JOIN 
    paciente p ON r.idPaciente = p.idPaciente
WHERE 
    r.idDentista = 1;

-- 11. Listar os próximos 5 agendamentos da clínica com detalhes de contato do paciente.
SELECT 
    a.dataHora,
    p.nome AS nome_paciente,
    p.telefone,
    d.nome AS nome_dentista
FROM 
    agendamento a
JOIN 
    paciente p ON a.idPaciente = p.idPaciente
JOIN 
    dentista d ON a.idDentista = d.idDentista
WHERE 
    a.dataHora >= NOW()
ORDER BY 
    a.dataHora ASC
LIMIT 5;

-- -----------------------------------------------------
-- Consultas sobre Finanças
-- -----------------------------------------------------

-- 12. Listar todas as faturas pendentes, o nome do paciente e há quantos dias estão pendentes.
SELECT 
    f.idFaturamento,
    p.nome AS nome_paciente,
    f.valorTotal,
    DATEDIFF(NOW(), r.dataHora) as dias_pendente
FROM 
    faturamento f
JOIN 
    paciente p ON f.idPaciente = p.idPaciente
JOIN
    registroclin r ON p.idPaciente = r.idPaciente AND f.idFaturamento = r.idRegistroClin -- Chave para encontrar a data do serviço
WHERE 
    f.statusPag = 'Pendente'
ORDER BY
    dias_pendente DESC;

-- 13. Calcular o valor total faturado por cada dentista.
SELECT 
    d.nome,
    SUM(po.valor) AS total_faturado
FROM 
    dentista d
JOIN 
    registroclin r ON d.idDentista = r.idDentista
JOIN 
    procedimentoodont po ON r.idProcedimento = po.idProcedimento
GROUP BY 
    d.nome
ORDER BY
    total_faturado DESC;

-- 14. Encontrar pacientes cujo faturamento total (pago ou pendente) excede R$ 1000,00.
SELECT 
    p.nome,
    SUM(f.valorTotal) AS total_gasto
FROM 
    paciente p
JOIN 
    faturamento f ON p.idPaciente = f.idPaciente
GROUP BY 
    p.nome
HAVING 
    total_gasto > 1000;

-- 15. Mostrar os procedimentos cujo valor está acima da média de todos os procedimentos.
SELECT
    nomeProcedimento,
    valor,
    descricao
FROM
    procedimentoodont
WHERE
    valor > (SELECT AVG(valor) FROM procedimentoodont);

-- 16. Listar as receitas da clínica, mostrando o nome do paciente associado.
SELECT
    r.idReceita,
    r.categoria,
    r.tipo,
    r.valor,
    p.nome AS nome_paciente
FROM
    receita r
JOIN
    paciente p ON r.paciente_idPaciente = p.idPaciente
ORDER BY
    r.valor DESC;

-- -----------------------------------------------------
-- Consultas Administrativas
-- -----------------------------------------------------

-- 17.Classificar dentistas pelo valor médio dos procedimentos realizados.
SELECT 
    d.nome AS nome_dentista,
    AVG(po.valor) AS valor_medio_procedimento
FROM 
    dentista d
JOIN 
    registroclin r ON d.idDentista = r.idDentista
JOIN 
    procedimentoodont po ON r.idProcedimento = po.idProcedimento
GROUP BY 
    d.nome
ORDER BY 
    valor_medio_procedimento DESC;

-- 18. Qual clínica está associada ao dentista com a especialidade 'Ortodontia'?
SELECT
    c.nomeFantasia,
    c.telefone,
    c.cidade
FROM
    clinica c
JOIN
    dentista d ON c.dentista_idDentista = d.idDentista
WHERE
    d.especialidade = 'Ortodontia';

-- 19. Mostrar todos os funcionários que não são dentistas (usando subquery).
SELECT 
    f.nome,
    f.cargo,
    f.telefone
FROM 
    funcionario f
WHERE 
    f.nome NOT IN (SELECT nome FROM dentista);

-- 20. Listar todos os laboratórios externos parceiros localizados em 'Curitiba'.
SELECT
    le.nome,
    le.email,
    le.telefone
FROM
    labexterno le
JOIN
    endereco e ON le.idEndereco = e.idEndereco
WHERE
    e.cidade = 'Curitiba';

