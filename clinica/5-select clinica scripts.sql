-- 1. Consultar todos os dentistas e suas especialidades
SELECT `nome`, `especialidade`
FROM `clinicadb`.`dentista`;

-- 2. Consultar todos os funcionários com seu respectivo cargo e salário
SELECT `nome`, `cargo`, `salario`
FROM `clinicadb`.`funcionario`;

-- 3. Consultar os pacientes que possuem um seguro de saúde
SELECT `paciente`.`nome`, `segurosaude`.`nomeSeguro`
FROM `clinicadb`.`paciente`
JOIN `clinicadb`.`segurosaude` ON `paciente`.`idPaciente` = `segurosaude`.`paciente_idPaciente`;

-- 4. Consultar todos os agendamentos de um paciente específico
SELECT `agendamento`.`dataHora`, `dentista`.`nome`
FROM `clinicadb`.`agendamento`
JOIN `clinicadb`.`dentista` ON `agendamento`.`idDentista` = `dentista`.`idDentista`
WHERE `agendamento`.`idPaciente` = 1;

-- 5. Consultar todos os registros clínicos de um paciente com detalhes sobre procedimentos
SELECT `registroclin`.`dataHora`, `registroclin`.`diagnostico`, `procedimentoodont`.`nomeProcedimento`
FROM `clinicadb`.`registroclin`
JOIN `clinicadb`.`procedimentoodont` ON `registroclin`.`idProcedimento` = `procedimentoodont`.`idProcedimento`
WHERE `registroclin`.`idPaciente` = 1;

-- 6. Consultar todos os dentistas que atendem em uma clínica específica
SELECT `dentista`.`nome`, `clinica`.`nomeFantasia`
FROM `clinicadb`.`dentista`
JOIN `clinicadb`.`clinica` ON `dentista`.`idDentista` = `clinica`.`dentista_idDentista`
WHERE `clinica`.`nomeFantasia` = 'Clinica OdontoMais';

-- 7. Consultar todos os pacientes que realizaram algum procedimento odontológico
SELECT `paciente`.`nome`, `procedimentoodont`.`nomeProcedimento`
FROM `clinicadb`.`paciente`
JOIN `clinicadb`.`registroclin` ON `paciente`.`idPaciente` = `registroclin`.`idPaciente`
JOIN `clinicadb`.`procedimentoodont` ON `registroclin`.`idProcedimento` = `procedimentoodont`.`idProcedimento`;

-- 8. Consultar o faturamento total de um paciente
SELECT `paciente`.`nome`, SUM(`faturamento`.`valorTotal`) AS totalFaturamento
FROM `clinicadb`.`faturamento`
JOIN `clinicadb`.`paciente` ON `faturamento`.`idPaciente` = `paciente`.`idPaciente`
WHERE `paciente`.`idPaciente` = 1
GROUP BY `paciente`.`idPaciente`;

-- 9. Consultar todos os funcionários com o endereço completo
SELECT `funcionario`.`nome`, `funcionario`.`cargo`, `endereco`.`rua`, `endereco`.`numero`, `endereco`.`bairro`, `endereco`.`cidade`
FROM `clinicadb`.`funcionario`
JOIN `clinicadb`.`endereco` ON `funcionario`.`idFuncionario` = `endereco`.`funcionario_idFuncionario`;

-- 10. Consultar todos os pacientes com seus agendamentos e dentistas
SELECT `paciente`.`nome`, `agendamento`.`dataHora`, `dentista`.`nome`
FROM `clinicadb`.`paciente`
JOIN `clinicadb`.`agendamento` ON `paciente`.`idPaciente` = `agendamento`.`idPaciente`
JOIN `clinicadb`.`dentista` ON `agendamento`.`idDentista` = `dentista`.`idDentista`;

-- 11. Consultar os pacientes que têm algum histórico médico
SELECT `paciente`.`nome`, `paciente`.`historico`
FROM `clinicadb`.`paciente`
WHERE `paciente`.`historico` IS NOT NULL;

-- 12. Consultar todos os dentistas e os procedimentos que realizam
SELECT `dentista`.`nome`, `procedimentoodont`.`nomeProcedimento`
FROM `clinicadb`.`dentista`
JOIN `clinicadb`.`registroclin` ON `dentista`.`idDentista` = `registroclin`.`idDentista`
JOIN `clinicadb`.`procedimentoodont` ON `registroclin`.`idProcedimento` = `procedimentoodont`.`idProcedimento`;

-- 13. Consultar os funcionários que possuem o mesmo endereço
SELECT `funcionario`.`nome`, `endereco`.`rua`, `endereco`.`numero`
FROM `clinicadb`.`funcionario`
JOIN `clinicadb`.`endereco` ON `funcionario`.`idFuncionario` = `endereco`.`funcionario_idFuncionario`
WHERE `endereco`.`rua` = 'Rua das Flores';

-- 14. Consultar todos os agendamentos e seus detalhes de paciente e dentista
SELECT `agendamento`.`dataHora`, `paciente`.`nome` AS nomePaciente, `dentista`.`nome` AS nomeDentista
FROM `clinicadb`.`agendamento`
JOIN `clinicadb`.`paciente` ON `agendamento`.`idPaciente` = `paciente`.`idPaciente`
JOIN `clinicadb`.`dentista` ON `agendamento`.`idDentista` = `dentista`.`idDentista`;

-- 15. Consultar a quantidade de pacientes que cada dentista atende
SELECT `dentista`.`nome`, COUNT(`paciente`.`idPaciente`) AS totalPacientes
FROM `clinicadb`.`dentista`
JOIN `clinicadb`.`agendamento` ON `dentista`.`idDentista` = `agendamento`.`idDentista`
JOIN `clinicadb`.`paciente` ON `agendamento`.`idPaciente` = `paciente`.`idPaciente`
GROUP BY `dentista`.`nome`;

-- 16. Consultar os pacientes e seus endereços completos
SELECT `paciente`.`nome`, `endereco`.`rua`, `endereco`.`numero`, `endereco`.`bairro`, `endereco`.`cidade`
FROM `clinicadb`.`paciente`
JOIN `clinicadb`.`endereco` ON `paciente`.`endereco_idEndereco` = `endereco`.`idEndereco`;


-- 17. Consultar os procedimentos realizados em um intervalo de tempo específico
SELECT `registroclin`.`dataHora`, `procedimentoodont`.`nomeProcedimento`, `paciente`.`nome` AS pacienteNome
FROM `clinicadb`.`registroclin`
JOIN `clinicadb`.`procedimentoodont` ON `registroclin`.`idProcedimento` = `procedimentoodont`.`idProcedimento`
JOIN `clinicadb`.`paciente` ON `registroclin`.`idPaciente` = `paciente`.`idPaciente`
WHERE `registroclin`.`dataHora` BETWEEN '2025-01-01' AND '2025-12-31';

-- 18. Consultar o total de faturamento por status de pagamento
SELECT 
    `faturamento`.`statusPag`, 
    COUNT(`faturamento`.`idFaturamento`) AS totalFaturamentos,
    SUM(`faturamento`.`valorTotal`) AS totalValor
	FROM 
		`clinicadb`.`faturamento`
		GROUP BY 
			`faturamento`.`statusPag`
			ORDER BY 
				totalValor DESC;
                
-- 19 Consultar os dentistas que atenderam um paciente específico
SELECT 
    `dentista`.`nome` AS dentistaNome, 
    `agendamento`.`dataHora`
FROM 
    `clinicadb`.`agendamento`
JOIN 
    `clinicadb`.`dentista` ON `agendamento`.`idDentista` = `dentista`.`idDentista`
WHERE 
    `agendamento`.`idPaciente` = 1
ORDER BY 
    `agendamento`.`dataHora` DESC;
    
-- 20 Consultar o número total de pacientes por dentista
SELECT 
    `dentista`.`nome` AS dentistaNome, 
    COUNT(DISTINCT `agendamento`.`idPaciente`) AS totalPacientes
FROM 
    `clinicadb`.`agendamento`
JOIN 
    `clinicadb`.`dentista` ON `agendamento`.`idDentista` = `dentista`.`idDentista`
GROUP BY 
    `dentista`.`nome`
ORDER BY 
    totalPacientes DESC;
