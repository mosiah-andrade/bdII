
DELIMITER $$

-- -----------------------------------------------------
-- Função 1: Calcular a Idade de um Paciente
-- Objetivo: Retorna a idade atual de um paciente com base na sua data de nascimento.
-- -----------------------------------------------------
CREATE FUNCTION `fn_calcular_idade_paciente`(
    p_dataNascimento DATE
) 
RETURNS INT
DETERMINISTIC
BEGIN
    -- Calcula a diferença em anos entre a data atual e a data de nascimento
    RETURN TIMESTAMPDIFF(YEAR, p_dataNascimento, CURDATE());
END$$

-- Teste 1: Calcular a idade de vários pacientes
SELECT 
    nome, 
    dataNasc, 
    fn_calcular_idade_paciente(dataNasc) AS idade
FROM 
    paciente
LIMIT 5;

DELIMITER ;



DELIMITER $$
-- -----------------------------------------------------
-- Função 2: Verificar a Disponibilidade de um Dentista
-- Objetivo: Checa se um dentista já possui um agendamento em um horário específico.
-- Retorna 1 se estiver ocupado, 0 se estiver livre.
-- -----------------------------------------------------
CREATE FUNCTION `fn_verificar_disponibilidade_dentista`(
    p_idDentista INT,
    p_dataHora DATETIME
)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE v_count INT;

    -- Conta quantos agendamentos o dentista tem no horário exato
    SELECT COUNT(*) INTO v_count
    FROM agendamento
    WHERE idDentista = p_idDentista AND dataHora = p_dataHora;

    -- Se a contagem for maior que 0, ele está ocupado (retorna TRUE/1)
    IF v_count > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END$$

-- Teste 2: Verificar a disponibilidade de um dentista (ID 1) em dois horários
-- (Assumindo que o primeiro horário está ocupado e o segundo está livre)
SELECT 
    '2025-08-01 11:00:00' AS horario_teste,
    fn_verificar_disponibilidade_dentista(2, '2025-08-01 11:00:00') AS esta_ocupado;

SELECT 
    '2025-10-10 15:00:00' AS horario_teste,
    fn_verificar_disponibilidade_dentista(1, '2025-10-10 15:00:00') AS esta_ocupado;

DELIMITER ;



DELIMITER $$
-- -----------------------------------------------------
-- Função 3: Obter o Nome Completo de um Funcionário
-- Objetivo: Retorna o nome completo de um funcionário a partir do seu ID.
-- Útil para simplificar relatórios e consultas.
-- -----------------------------------------------------
CREATE FUNCTION `fn_obter_nome_funcionario`(
    p_idFuncionario INT
)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE v_nome VARCHAR(100);
    
    SELECT nome INTO v_nome
    FROM funcionario
    WHERE idFuncionario = p_idFuncionario;
    
    RETURN v_nome;
END$$

-- Teste 3: Obter o nome de um funcionário (ID 1) que realizou um agendamento
SELECT 
    idAgendamento,
    dataHora,
    fn_obter_nome_funcionario(idFuncionario) AS nome_do_funcionario
FROM 
    agendamento
WHERE
    idFuncionario = 1
LIMIT 1;


DELIMITER ;



DELIMITER $$
-- -----------------------------------------------------
-- Função 4: Calcular o Faturamento Total de um Paciente
-- Objetivo: Soma todos os valores de faturas registradas para um paciente específico.
-- -----------------------------------------------------
CREATE FUNCTION `fn_calcular_faturamento_total_paciente`(
    p_idPaciente INT
)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10, 2);
    
    -- Soma os valores da tabela de faturamento para o paciente
    SELECT SUM(valorTotal) INTO v_total
    FROM faturamento
    WHERE idPaciente = p_idPaciente;
    
    -- Se o paciente não tiver faturas, retorna 0
    IF v_total IS NULL THEN
        RETURN 0.00;
    ELSE
        RETURN v_total;
    END IF;
END$$

-- Teste 4: Calcular o faturamento total de um paciente (ID 2)
SELECT 
    nome,
    fn_calcular_faturamento_total_paciente(idPaciente) AS faturamento_total
FROM
    paciente
WHERE
    idPaciente = 2;


DELIMITER ;



DELIMITER $$
-- -----------------------------------------------------
-- Função 5: Contar o Total de Consultas em um Mês
-- Objetivo: Conta quantos agendamentos foram realizados em um mês e ano específicos.
-- -----------------------------------------------------
CREATE FUNCTION `fn_contar_consultas_no_mes`(
    p_ano INT,
    p_mes INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_totalConsultas INT;

    SELECT COUNT(idAgendamento) INTO v_totalConsultas
    FROM agendamento
    WHERE YEAR(dataHora) = p_ano AND MONTH(dataHora) = p_mes;

    RETURN v_totalConsultas;
END$$

-- Teste 5: Contar o total de consultas agendadas para Agosto de 2025
SELECT fn_contar_consultas_no_mes(2025, 8) AS total_consultas_agosto_2025;


DELIMITER ;



DELIMITER $$
-- -----------------------------------------------------
-- Função 6: Formatar Endereço Completo da Clínica
-- Objetivo: Concatena os campos de endereço de uma clínica em uma única string formatada.
-- -----------------------------------------------------
CREATE FUNCTION `fn_formatar_endereco_clinica`(
    p_idClinica INT
)
RETURNS VARCHAR(500)
READS SQL DATA
BEGIN
    DECLARE v_endereco_completo VARCHAR(500);

    SELECT CONCAT(
        rua, ', ', numero, 
        IF(complemento IS NOT NULL, CONCAT(' - ', complemento), ''), 
        '. Bairro: ', bairro, 
        '. ', cidade, ' - ', UF, 
        '. CEP: ', cep
    ) INTO v_endereco_completo
    FROM clinica
    WHERE idClinica = p_idClinica;

    RETURN v_endereco_completo;
END$$

-- Restaura o delimitador padrão
DELIMITER ;

-- Teste 6: Obter o endereço completo e formatado de uma clínica (ID 1)
SELECT 
    nomeFantasia,
    fn_formatar_endereco_clinica(idClinica) AS endereco_completo
FROM
    clinica
WHERE
    idClinica = 1;

DELIMITER ;