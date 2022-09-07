Program Punto4Practica1;
var
	num, doble, otro : real;
begin
	write ('Inserte un numero: ');
	read (num);
	doble:= num * 2;
	write ('Inserte numero: ');
	read (otro);
	while otro <> doble do
		begin
			write ('Inserte numero: ');
			read (otro);
		end;
end.
