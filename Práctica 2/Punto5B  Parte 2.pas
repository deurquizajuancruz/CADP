program Punto5BPractica2Parte2;
procedure doble (var numA: integer; var numB: integer; var dobleB: integer; var cantidad: integer);
	begin
	cantidad := cantidad +1;
	if (numB = (numA*2)) then
		dobleB:= dobleB +1;
	end;
var
	numa, numb, dobles, cantidadp : integer;
begin
	dobles:= 0; cantidadp := 0;
	writeln ('Ingrese el numero A: ');
	readln (numa);
	writeln ('Ingrese el numero B: ');
	readln (numb);
	while (numa<>0) and (numb<>0) do
		begin
		doble (numa, numb, dobles, cantidadp);
		writeln ('Ingrese el numero A: ');
		readln (numa);
		writeln ('Ingrese el numero B: ');
		readln (numb);
		end;
	writeln ('La cantidad de pares leidos fue de: ', cantidadp,'. ');
	writeln ('La cantidad de pares en los que numB es el doble de numA es: ', dobles);
end.
