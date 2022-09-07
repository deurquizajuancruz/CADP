program Punto6BPractica2Parte1;
procedure leer;
var
	numero, nparalto: integer;
begin
	nparalto:=-1;
	writeln ('Introduzca un numero entero: ');
	readln (numero);
	while (numero>0) do
		begin
		if (numero>nparalto) then
			begin
			if (numero mod 2 = 0) then
				nparalto := numero;
			end;
		writeln ('Introduzca un numero entero: ');
		readln (numero);
		end;
	writeln ('El numero par mas alto leido fue: ',nparalto);
end;
begin
	leer;
end.
