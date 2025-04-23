-- =======================================
-- Alterações nas Estruturas das Tabelas
-- Banco: clinicadb
-- =======================================

-- 1. Adicionar campo de foto de perfil para dentistas
ALTER TABLE `clinicadb`.`dentista`
ADD COLUMN `fotoPerfil` VARCHAR(255) NULL DEFAULT NULL;

-- 2. Adicionar data de contratação para funcionários
ALTER TABLE `clinicadb`.`funcionario`
ADD COLUMN `dataContratacao` DATE NULL DEFAULT NULL;

-- 3. Remover campo de complemento da tabela paciente (duplicado com endereco)
ALTER TABLE `clinicadb`.`paciente`
DROP COLUMN `complemento`;

-- 4. Aumentar o tamanho do campo telefone para 25 caracteres em várias tabelas
ALTER TABLE `clinicadb`.`paciente`
MODIFY COLUMN `telefone` VARCHAR(25);

ALTER TABLE `clinicadb`.`dentista`
MODIFY COLUMN `telefone` VARCHAR(25);

ALTER TABLE `clinicadb`.`funcionario`
MODIFY COLUMN `telefone` VARCHAR(25);

ALTER TABLE `clinicadb`.`clinica`
MODIFY COLUMN `telefone` VARCHAR(25);

-- 5. Adicionar campo de senha para login de funcionários
ALTER TABLE `clinicadb`.`funcionario`
ADD COLUMN `senha` VARCHAR(255) NULL DEFAULT NULL;

-- 6. Adicionar campo tipoConsulta na tabela agendamento
ALTER TABLE `clinicadb`.`agendamento`
ADD COLUMN `tipoConsulta` VARCHAR(50) NULL DEFAULT NULL;

-- 7. Alterar tipo de statusPag para ENUM na tabela faturamento
ALTER TABLE `clinicadb`.`faturamento`
MODIFY COLUMN `statusPag` ENUM('Pago', 'Pendente', 'Cancelado') DEFAULT 'Pendente';

-- 8. Adicionar tipo do laboratório na tabela labexterno
ALTER TABLE `clinicadb`.`labexterno`
ADD COLUMN `tipoLaboratorio` VARCHAR(100) NULL DEFAULT NULL;

-- 9. Tornar idPaciente auto-incrementável
ALTER TABLE `clinicadb`.`paciente`
MODIFY COLUMN `idPaciente` INT NOT NULL AUTO_INCREMENT;

-- 10. Criar índice composto em nome e email na tabela paciente
CREATE INDEX idx_nome_email ON `clinicadb`.`paciente` (`nome`, `email`);
