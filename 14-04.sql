select year(checkIn) as "Ano", count(Reserva_idReserva) as "quant. Reserva"
	from hospedagem
    group by year(checkIn);
    
select date_format(checkIn, '%Y | %M') as "mes/ano", count(Reserva_idReserva) as "quant. Reserva"
	from hospedagem
		group by date_format(checkIn, '%Y | %M')
			order by date_format(checkIn, '%Y | %M') desc;
            
            
select upper( nome ) as "Funcionário", cpf "CPF", 
	date_format( dataNasc, '%d / %m / %Y' ) "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', 'Masculino' ) "Gênero", 
    email "E-mail", concat("R$ ", format(salario,2 , "de_DE")) "Salário" 
		from funcionario 
			order by nome;