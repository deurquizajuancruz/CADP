program Punto2Practica1Parte2;
var
	num, maximo : real;
	i : integer;
begin
	maximo:= -32768;
	for i:= 1 to 10 do
	begin
		write ('Ingrese un numero real mayor a -32.768: ');
		read (num);
		if (num>maximo) then
			maximo := num
	end;
	write ('El mayor numero leido fue: ', maximo:3:2);
end.
