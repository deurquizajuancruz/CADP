Program Punto5Practica1;
var
	num, doble, otro, diez : real;
begin
	diez := 1;
	write ('Inserte un numero: ');
	read (num);
	doble := num * 2;
	write ('Inserte otro numero: ');
	read (otro);
	while (otro<>doble) and (diez <> 10) do
			begin
				write ('Inserte otro numero: ');
				read (otro);
				diez := diez +1;
			end;
	if diez = 10 then
		write ('No se ha ingresado el doble del numero');
end.
