--1. Registrar Novo Paciente e Agendar Primeira Consulta
--Objetivo: Cadastrar um novo paciente e, na mesma operação, já marcar sua primeira consulta, garantindo que ambos os registros sejam criados corretamente.

--Parâmetros de Entrada:

--p_nome, p_cpf, p_dataNasc, p_genero, p_telefone, p_email, p_historico (dados do paciente)
--p_rua, p_numero, p_bairro, p_cidade, p_UF, p_cep (dados de endereço)
--p_idDentista, p_idFuncionario, p_dataHoraConsulta (dados do agendamento)
--------------------------------------------------------------------------

--2. Finalizar Consulta e Gerar Faturamento
--Objetivo: Registrar o diagnóstico de uma consulta finalizada e gerar automaticamente a fatura para o paciente com base no valor do procedimento realizado.

--Parâmetros de Entrada:

--p_idAgendamento, p_idPaciente, p_idDentista, p_idProcedimento, p_diagnostico
--------------------------------------------------------------------------

--3. Registrar Pagamento de Fatura
--Objetivo: Registrar o pagamento de uma fatura, atualizando o status da fatura
--e garantindo que o saldo do paciente seja atualizado corretamente.    
--Parâmetros de Entrada:
--p_idFatura, p_idPaciente, p_valorPago, p_dataPagamento

delimit $$
CREATE PROCEDURE RegistrarPagamentoFatura(
    IN p_idFatura INT,
    IN p_idPaciente INT,
    IN p_valorPago DECIMAL(10, 2),
    IN p_dataPagamento DATETIME
)
BEGIN
    DECLARE v_valorFatura DECIMAL(10, 2);   
    DECLARE v_saldoAtual DECIMAL(10, 2);
    DECLARE v_statusFatura VARCHAR(20);

    -- Verifica se a fatura existe e obtém o valor da fatura
    SELECT valor, status INTO v_valorFatura, v_statusFatura
    FROM faturas
    WHERE id = p_idFatura AND paciente_id = p_idPaciente;
    IF v_valorFatura IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fatura não encontrada ou não pertence ao paciente.';
    END IF;
    -- Verifica se o pagamento é válido
    IF p_valorPago <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O valor pago deve ser positivo.';
    END IF;
    IF p_valorPago > v_valorFatura THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O valor pago não pode ser maior que o valor da fatura.';
    END IF;
    -- Atualiza o status da fatura e registra o pagamento
    UPDATE faturas
    SET valor_pago = valor_pago + p_valorPago,
        data_pagamento = p_dataPagamento,
        status = CASE
            WHEN valor_pago + p_valorPago >= valor THEN 'PAGO'
            ELSE 'PENDENTE'
        END
    WHERE id = p_idFatura AND paciente_id = p_idPaciente;   
    -- Atualiza o saldo do paciente
    SELECT saldo INTO v_saldoAtual
    FROM pacientes
    WHERE id = p_idPaciente;
    IF v_saldoAtual IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente não encontrado.';
    END IF;
    UPDATE pacientes
    SET saldo = saldo - p_valorPago
    WHERE id = p_idPaciente;    
    -- Retorna o status da fatura atualizada
    SELECT status AS status_fatura,
           valor_pago AS valor_pago,
           data_pagamento AS data_pagamento
    FROM faturas
    WHERE id = p_idFatura AND paciente_id = p_idPaciente;
END$$
delimit ;

--------------------------------------------------------------------------

--4. Registrar Novo Procedimento
--Objetivo: Cadastrar um novo procedimento odontológico, garantindo que o nome do procedimento seja
--único e que o valor seja positivo.        
--Parâmetros de Entrada:
--p_nomeProcedimento, p_valorProcedimento
--------------------------------------------------------------------------

--5. Registrar Novo Dentista
--Objetivo: Cadastrar um novo dentista, garantindo que o CPF seja único e que
--o CRM seja válido.
--Parâmetros de Entrada:
--p_nomeDentista, p_cpfDentista, p_crmDentista, p_especialidadeDentista, p_telefoneDentista, p_emailDentista
--------------------------------------------------------------------------  

--6. Registrar Novo Funcionário
--Objetivo: Cadastrar um novo funcionário, garantindo que o CPF seja único e que
--o cargo seja válido.
--Parâmetros de Entrada:
--p_nomeFuncionario, p_cpfFuncionario, p_cargoFuncionario, p_telefoneFuncionario, p_emailFuncionario
--------------------------------------------------------------------------      

