select upper( nome ) as "Funcionário", cpf "CPF", 
	date_format( dataNasc, '%d / %m / %Y' ) "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', 'Masculino' ) "Gênero", 
    email "E-mail", format(salario,2 , "de_DE") "Salário" 
		from funcionario 
        where nome like "Thiago%"
			order by nome;
            
select cpf_passaporte "CPF ou PAssaporte", 
	nome "Hóspede",
    date_format( dataNasc, '%d / %m / %Y' ) "Data de Nascimento",
    email "E-mail", telefone "Telefone"
    from hospede
		where year(dataNasc) <= 1990 and
			nome like "%lima%"
		order by nome;



select cidade, count(funcionario_cpf)
	from endereco
		group by cidade;
        
        
select count(cpf_passaporte) 
	from hospede
		group by telefone like "+5511%";
        
        
select upper( nome ) as "Funcionário", cpf "CPF", 
	date_format( dataNasc, '%d / %m / %Y' ) "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', 'Masculino' ) "Gênero", 
    email "E-mail", concat("R$ ", format(salario,2 , "de_DE")) "Salário" 
		from funcionario 
        where salario = (select max(salario) from funcionario)
			order by nome;
            
            
select checkIn "Check-In", checkOut "Check-Out", 
	concat( "R$ ", format(valorTotal, 2, 'de_DE')) "Valor de Hospedagem"
	from hospedagem 
    group by month(checkIn);