Program Punto5Practica1;
var
	num, doble, otro : integer;
begin
	write ('Inserte un numero: ');
	read (num);
	doble := num * 2;
	write ('Inserte un numero: ');
	read (otro);
	for 10 otro<>doble do 
		write ('Inserte un numero: ');
		read (otro);
end.		
