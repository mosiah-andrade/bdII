delimiter $$

create trigger tgrAftInsertHospedagem after insert
	on hospedagem
	for each row
		begin
			update reserva
				set status = 'Checked-in'
					where idReserva = new.Reserva_idReserva;
		end $$

delimiter ;


insert into hospedagem
	value (77, 0.0, now(), null);