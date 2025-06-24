-- 1. Registrar Novo Paciente e Agendar Primeira Consulta
-- Objetivo: Cadastrar um novo paciente e, na mesma operação, já marcar sua primeira consulta, garantindo que ambos os registros sejam criados corretamente.

-- Parâmetros de Entrada:

-- p_nome, p_cpf, p_dataNasc, p_genero, p_telefone, p_email, p_historico (dados do paciente)
-- p_rua, p_numero, p_bairro, p_cidade, p_UF, p_cep (dados de endereço)
-- p_idDentista, p_idFuncionario, p_dataHoraConsulta (dados do agendamento)

DELIMITER $$

CREATE PROCEDURE RegistrarNovoPacienteEAgendarConsulta(
    IN p_idPaciente INT,
    IN p_idEndereco INT,
    in p_funcionario_idFuncionario int,
    in p_dentista_idDentista int,
    in p_clinica_idClinica int,
    IN p_nome VARCHAR(100),
    IN p_cpf VARCHAR(11),
    IN p_dataNasc DATE,
    IN p_genero VARCHAR(10),
    IN p_telefone VARCHAR(15),
    IN p_email VARCHAR(100),
    IN p_historico TEXT,
    IN p_rua VARCHAR(100),
    IN p_numero VARCHAR(10),
    IN p_bairro VARCHAR(50),
    IN p_cidade VARCHAR(50),
    IN p_UF VARCHAR(2),
    IN p_cep VARCHAR(10),
    in p_complemento varchar(20),
    IN p_idDentista INT,
    IN p_idFuncionario INT,
    IN p_dataHoraConsulta DATETIME
    
)
BEGIN
    -- 1. Inserir o endereço na tabela `endereco`. 
    INSERT INTO endereco (idEndereco, rua, numero, bairro, cidade, UF, cep,complemento, dentista_idDentista, funcionario_idFuncionario, clinica_idClinica)
    VALUES (p_idEndereco, p_rua, p_numero, p_bairro, p_cidade, p_UF, p_cep,p_complemento, p_dentista_idDentista, p_funcionario_idFuncionario, p_clinica_idClinica);

    -- 2. Inserir os dados na tabela `paciente`.
    INSERT INTO paciente (idPaciente, nome, CPF, dataNasc, genero, telefone, email, historico, rua, numero, bairro, cidade, UF, cep, endereco_idEndereco)
    VALUES (p_idPaciente, p_nome, p_cpf, p_dataNasc, p_genero, p_telefone, p_email, p_historico, p_rua, p_numero, p_bairro, p_cidade, p_UF, p_cep, p_idEndereco);

    -- 3. Agendar a primeira consulta para o novo paciente. (
    INSERT INTO agendamento (dataHora, idPaciente, idDentista, idFuncionario)
    VALUES (p_dataHoraConsulta, p_idPaciente, p_idDentista, p_idFuncionario);

END$$

DELIMITER ;


-- call
CALL RegistrarNovoPacienteEAgendarConsulta(
    17,                                   
    154,
    1,
    2,
    1,
    'Mariana Ribeiro',                   
    '55566677788',                       
    '1995-11-30',                         
    'Feminino',                           
    '41911223344',                        
    'mari.ribeiro@email.com',             
    'Alergia a penicilina.',             
    'Rua dos Pinheiros',                  
    '789',                                
    'Pinheiros',                          
    'São Paulo',                         
    'SP',                                 
    '05422001',                           
    'null',
    2,                                   
    1,                                    
    '2025-08-01 11:00:00'                 
    
);

--------------------------------------------------------------------------

-- 2. Finalizar Consulta e Gerar Faturamento
-- Objetivo: Registrar o diagnóstico de uma consulta finalizada e gerar automaticamente a fatura para o paciente com base no valor do procedimento realizado.

-- Parâmetros de Entrada:

-- p_idAgendamento, p_idPaciente, p_idDentista, p_idProcedimento, p_diagnostico

DELIMITER $$

CREATE PROCEDURE FinalizarConsultaERegistrarFaturamento(
    IN p_idAgendamento INT,
    IN p_idPaciente INT,
    IN p_idDentista INT,
    IN p_idProcedimento INT,
    IN p_diagnostico VARCHAR(255),
    IN p_idRegistroClin INT,
    IN p_idFaturamento INT
)
BEGIN
    -- Variáveis locais para armazenar valores buscados
    DECLARE v_valorProcedimento DECIMAL(10, 2);
    DECLARE v_dataHoraAgendamento DATETIME; 

    -- 1. Buscar o valor do procedimento para validar se ele existe
    SELECT valor INTO v_valorProcedimento
    FROM procedimentoodont
    WHERE idProcedimento = p_idProcedimento;

    IF v_valorProcedimento IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: O procedimento com o ID fornecido não existe.';
    END IF;

    -- 2. BUSCAR A DATA E HORA DO AGENDAMENTO ORIGINAL 
    SELECT dataHora INTO v_dataHoraAgendamento
    FROM agendamento
    WHERE idAgendamento = p_idAgendamento;

    IF v_dataHoraAgendamento IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: O agendamento com o ID fornecido não existe.';
    END IF;

    -- 3. Registrar o diagnóstico no registro clínico
    INSERT INTO registroclin (idRegistroclin, idAgendamento, idPaciente, idDentista, idProcedimento, dataHora, diagnostico)
    VALUES (p_idRegistroClin, p_idAgendamento, p_idPaciente, p_idDentista, p_idProcedimento, v_dataHoraAgendamento, p_diagnostico);

    -- 4. Gerar a fatura usando o valor validado
    INSERT INTO faturamento (idFaturamento, idPaciente,  valorTotal, statusPag)
    VALUES (p_idFaturamento, p_idPaciente, v_valorProcedimento, 'Pendente');

END$$

DELIMITER ;

-- call
CALL FinalizarConsultaERegistrarFaturamento(
    1,  
    2,    
    1,    
    3,    
    'Check-up de rotina. Nenhuma cárie detectada. Paciente orientado sobre higiene bucal.', -- p_diagnostico
    16,   
    14    
);
--------------------------------------------------------------------------

-- 3. Registrar Pagamento de Fatura
-- Objetivo: Registrar o pagamento de uma fatura, atualizando o status da fatura
-- e garantindo que o saldo do paciente seja atualizado corretamente.    
-- Parâmetros de Entrada:
-- p_idFatura, p_idPaciente, p_valorPago, p_dataPagamento

DELIMITER $$

CREATE PROCEDURE RegistrarPagamentoFatura(
    IN p_idFatura INT,
    IN p_idPaciente INT,
    IN p_valorPago DECIMAL(10, 2)
)
BEGIN
    -- Declara uma variável local para armazenar o novo saldo da fatura
    DECLARE v_novoValorTotal DECIMAL(10, 2);

    -- 1. Atualiza o valor da fatura subtraindo o valor pago 
    UPDATE faturamento
    SET valorTotal = valorTotal - p_valorPago
    WHERE idFaturamento = p_idFatura;

    -- 2. Obtém o novo valor total da fatura para verificação
    SELECT valorTotal INTO v_novoValorTotal
    FROM faturamento
    WHERE idFaturamento = p_idFatura;

    -- 3. Verifica se a fatura foi totalmente paga 
    IF v_novoValorTotal <= 0 THEN
        UPDATE faturamento
        SET statusPag = 'Pago'
        WHERE idFaturamento = p_idFatura;
    END IF;

    -- 4. Atualiza o status do paciente
    UPDATE paciente
    SET status = 'Faturado'
    WHERE idPaciente = p_idPaciente;

END$$

DELIMITER ;

-- call
call RegistrarPagamentoFatura(
    2, 
    2, 
    200.00
);
--------------------------------------------------------------------------

-- 4. Registrar Novo Procedimento
-- Objetivo: Cadastrar um novo procedimento odontológico, garantindo que o nome do procedimento seja
-- único e que o valor seja positivo.        
-- Parâmetros de Entrada:
-- p_nomeProcedimento, p_valorProcedimento

DELIMITER $$

CREATE PROCEDURE RegistrarNovoProcedimento(
    IN p_idProcedimento INT,
    IN p_idRegistroClin INT,
    IN p_nomeProcedimento VARCHAR(100),
    IN p_descricaoProcedimento VARCHAR(255),
    IN p_valorProcedimento DECIMAL(10, 2),
    IN p_dataHoraConsulta DATETIME,
    IN p_idPaciente INT,
    IN p_idDentista INT,
    IN p_idFuncionario INT,
    IN p_diagnostico VARCHAR(255),
    IN p_idAgendamento INT
)
BEGIN
    -- 1. Realizar agendamento
    INSERT INTO agendamento (idAgendamento, dataHora, idPaciente, idDentista, idFuncionario)
    VALUES (p_idAgendamento, p_dataHoraConsulta, p_idPaciente, p_idDentista, p_idFuncionario);

    -- 2. Registrar o procedimento (PAI) PRIMEIRO
    INSERT INTO procedimentoodont (idProcedimento, nomeProcedimento, descricao, valor)
    VALUES (p_idProcedimento, p_nomeProcedimento, p_descricaoProcedimento, p_valorProcedimento);

    -- 3. Criar registro clínico (FILHO) POR ÚLTIMO, usando os IDs já criados
    INSERT INTO registroclin (idRegistroclin, idAgendamento, idPaciente, idDentista, idProcedimento, dataHora, diagnostico)
    VALUES (p_idRegistroClin, p_idAgendamento, p_idPaciente, p_idDentista, p_idProcedimento, p_dataHoraConsulta, p_diagnostico);

END$$

DELIMITER ;

-- call
call RegistrarNovoProcedimento(
    11, 
    11,
    'Limpeza Dental', 
    'Limpeza completa dos dentes', 
    150.00, 
    '2023-10-01 10:00:00', 
    2, 
    1, 
    1, 
    'Nenhum problema encontrado', 
    12
);
--------------------------------------------------------------------------

-- 5. Registrar Novo Dentista
-- Objetivo: Cadastrar um novo dentista, garantindo que o CPF seja único e que
-- o CRM seja válido.
-- Parâmetros de Entrada:
-- p_nomeDentista, p_cpfDentista, p_crmDentista, p_especialidadeDentista, p_telefoneDentista, p_emailDentista

delimiter $$
CREATE PROCEDURE RegistrarNovoDentista(
	in p_idDentista int,
    in p_nomeDentista VARCHAR(100),
    in p_emailDentista VARCHAR(100),
    in p_telefoneDentista VARCHAR(15), 
    in p_especialidadeDentista VARCHAR(50),
    in p_CFO VARCHAR(20) 
)
BEGIN
    -- Insere o novo dentista
    INSERT INTO dentista (idDentista, nome, email, telefone, especialidade, CFO)
    VALUES (p_idDentista, p_nomeDentista, p_emailDentista, p_telefoneDentista, p_especialidadeDentista,  p_CFO);
END$$

delimiter ;

-- call
call RegistrarNovoDentista(
	'11',
	'Jose',
    'jose.1@gmail.com',
    '(00)90000-0000',
    'cirugião Geral',
    'CFOPE 14.786'
)
--------------------------------------------------------------------------  

-- 6. Registrar Novo Funcionário
-- Objetivo: Cadastrar um novo funcionário, garantindo que o CPF seja único e que
-- o cargo seja válido.
-- Parâmetros de Entrada:
-- p_nomeFuncionario, p_cpfFuncionario, p_cargoFuncionario, p_telefoneFuncionario, p_emailFuncionario
delimiter $$
CREATE PROCEDURE RegistrarNovoFuncionario(
	in p_idFuncionario INT,
    in p_nomeFuncionario VARCHAR(100),
    in p_cpfFuncionario VARCHAR(11),  
    in p_dataNascFuncionario DATE,
    in p_generoFuncionario VARCHAR(10),
    in p_telefoneFuncionario VARCHAR(15),  
    in p_emailFuncionario VARCHAR(100),
    in p_cargoFuncionario VARCHAR(50),
    in p_salarioFuncionario DECIMAL(10, 2),
    in p_ruaFuncionario VARCHAR(100),
    in p_numeroFuncionario VARCHAR(10),
    in p_bairroFuncionario VARCHAR(50),
    in p_cidadeFuncionario VARCHAR(50),
    in p_UFFuncionario VARCHAR(2),
    in p_cepFuncionario VARCHAR(10) 
)   
BEGIN
    -- Insere o novo funcionário
    INSERT INTO funcionario (idFuncionario, nome, CPF, dataNAsc, genero, telefone, email, cargo,  salario, status, rua, numero, bairro, cidade, UF, cep)
   values (p_idFuncionario, p_nomeFuncionario, p_cpfFuncionario, p_dataNascFuncionario, p_generoFuncionario, p_telefoneFuncionario, p_emailFuncionario, p_cargoFuncionario, p_salarioFuncionario, 'Ativo', p_ruaFuncionario, p_numeroFuncionario, p_bairroFuncionario, p_cidadeFuncionario, p_UFFuncionario, p_cepFuncionario);

END$$
delimiter ;

-- call
CALL RegistrarNovoFuncionario(
	'11',
    'João da Silva', 
    '12345678901', 
    '1990-05-15', 
    'Masculino', 
    '11987654321', 
    'joao.silva@email.com', 
    'Desenvolvedor', 
    5000.00, 
    'Rua das Flores', 
    '123', 
    'Centro', 
    'São Paulo', 
    'SP', 
    '01000000'
);

--------------------------------------------------------------------------      
