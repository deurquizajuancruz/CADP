program Punto2APractica1Parte2;
var
	num, maximo : real;
	i, posicion, pos2 : integer;
begin
	maximo:= -32768;
	posicion := 0;
	for i:= 1 to 10 do
	begin
		write ('Ingrese un numero real mayor a -32.768: ');
		read (num);
		posicion := posicion +1;
		if (num>maximo) then
			begin
				maximo := num;
				pos2 := posicion;
			end;
	end;
	write ('El mayor numero leido fue: ', maximo:3:2, '. ');
	write ('La posicion del numero mayor es: ', pos2,'.');
end.
