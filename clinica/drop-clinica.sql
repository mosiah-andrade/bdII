
-- ===============================
-- DESTRUIÇÃO COMPLETA DO BANCO ClinicaDB
-- Remove views, procedimentos, funções, tabelas e constraints
-- ===============================

-- Etapa 1: Remover VIEWS (se existirem)
-- DROP VIEW IF EXISTS nome_da_view; -- (Adicione suas views aqui, se houver)
-- Exemplo:
-- DROP VIEW IF EXISTS view_AgendamentosCompletos;

-- Etapa 2: Desabilitar verificação de chaves estrangeiras temporariamente
SET FOREIGN_KEY_CHECKS = 0;

-- Etapa 3: DROP TABLES em ordem inversa de dependência
DROP TABLE IF EXISTS Despesa;
DROP TABLE IF EXISTS Receita;
DROP TABLE IF EXISTS Faturamento;
DROP TABLE IF EXISTS SeguroSaude;
DROP TABLE IF EXISTS RegistroClin;
DROP TABLE IF EXISTS Agendamento;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS Dentista;
DROP TABLE IF EXISTS procedimentoOdont;
DROP TABLE IF EXISTS labExterno;
DROP TABLE IF EXISTS Endereco;
DROP TABLE IF EXISTS Clinica;

-- Etapa 4: Dropar o banco de dados completamente
-- DROP DATABASE IF EXISTS ClinicaDB;


