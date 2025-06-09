delimiter $$

create trigger tgrAfterUpdateHospedagem before update
	on hospedagem 
	for each row
		begin
			if new.checkOut is not null
				then 
					begin
						declare qtdDias int;
                        declare VD decimal(7,2) default 0.0;
                        select timestampdiff(day, new.checkIn, new.checkOut)
							into qtdDias;
                        select valorDiaria into VD from uh
							where idUH = (select UH_idUH from reserva_uh where Reserva_idReserva = new.Reserva_idReserva);
						set new.valorTotal = VD * qtdDias;
                        update reserva
							set status = "Checked-out"
								where idReserva = new.Reserva_idReserva;
					end ;
			end if;
        end $$
    
delimiter ;

alter table hospedagem
	change column valorTotal valorTotal decimal(10,2) zerofill unsigned;
    
drop trigger tgrAfterUpdateHospedagem;

update hospedagem
	set checkOut = now()
		where Reserva_idReserva = 77;
