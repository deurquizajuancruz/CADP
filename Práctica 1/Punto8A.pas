program Punto8APractica1Parte2;
var
	i : integer;
	monto, montoT, maxima, dia : real;
begin
	monto:= 0; montoT := 0; maxima := -1;
	for i:= 1 to 31 do
		begin
		write ('Ingresar el monto de las ventas realizadas en el dia: ');
		read(monto);
		if (monto<>0) then
			begin
			monto:= monto;
			montoT := montoT + monto;
			write ('El monto del dia de hoy fue de: ', monto:3:2,'. ');
			if (monto>maxima) then
				begin
				maxima := monto;
				dia := i;
				end;
			monto:= 0;
			end;
		end;
	write ('El monto total del mes fue de: ', montoT:3:2);
	write ('. El dia en que mas ventas se hicieron fue el dia numero: ', dia:3:2);
end.
