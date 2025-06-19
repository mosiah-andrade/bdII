-- 1. View para listar todos os dentistas e suas especialidades

CREATE VIEW `dentistas_especialidades` AS
SELECT 
    `dentista`.`nome` AS dentistaNome,
    `dentista`.`especialidade`
FROM 
    `clinicadb`.`dentista`;
    
-- 2. View para listar todas as clínicas e seus dentistas
CREATE VIEW `clinicas_dentistas` AS
SELECT 
    `clinica`.`nome` AS clinicaNome,
    `dentista`.`nome` AS dentistaNome
FROM 
    `clinicadb`.`clinica`
JOIN 
    `clinicadb`.`dentista` ON `clinica`.`dentista_idDentista` = `dentista`.`idDentista`;

-- 3. View para listar pacientes com seus agendamentos
CREATE VIEW `pacientes_agendamentos` AS
SELECT 
    `paciente`.`nome` AS pacienteNome,
    `agendamento`.`dataHora`,
    `dentista`.`nome` AS dentistaNome
FROM 
    `clinicadb`.`paciente`
JOIN 
    `clinicadb`.`agendamento` ON `paciente`.`idPaciente` = `agendamento`.`idPaciente`
JOIN 
    `clinicadb`.`dentista` ON `agendamento`.`idDentista` = `dentista`.`idDentista`;
    
-- 4. View para listar todos os funcionários e seus cargos
CREATE VIEW `funcionarios_cargos` AS
SELECT 
    `funcionario`.`nome` AS funcionarioNome,
    `funcionario`.`cargo`
FROM 
    `clinicadb`.`funcionario`;

-- 5 View para listar clínicas com endereço completo

    CREATE VIEW `clinicas_endereco` AS
SELECT 
    `clinica`.`nome` AS clinicaNome,
    CONCAT(`clinica`.`rua`, ', ', `clinica`.`numero`, ', ', `clinica`.`bairro`, ', ', `clinica`.`cidade`, ', ', `clinica`.`UF`, ', ', `clinica`.`CEP`) AS endereco
FROM 
    `clinicadb`.`clinica`;

    

