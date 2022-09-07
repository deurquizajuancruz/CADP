program Punto8Practica1Parte2;
var
	i : integer;
	monto, montoT : real;
begin
	monto:= 0; montoT := 0;
	for i:= 1 to 31 do
		begin
		write ('Ingresar el monto de las ventas realizadas en el dia: ');
		read(monto);
		if (monto<>0) then
			begin
			monto:= monto;
			montoT := montoT + monto;
			write ('El monto del dia de hoy fue de: ', monto:3:2,'. ');
			monto:= 0;
			end;
		end;
	write ('El monto total del mes fue de: ', montoT:3:2);
end.
