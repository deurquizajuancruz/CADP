program Punto5APractica2Parte2;
procedure doble (numA : integer; numB : integer);
	begin
	if (numB = (numA*2)) then
		writeln ('NumB es el doble de NumA.')
	else
		writeln ('NumB no es el doble de NumA. ');
	end;
var
	numa, numb : integer;
begin
	writeln ('Ingrese el numero A: ');
	readln(numa);
	writeln ('Ingrese el numero B: ');
	readln(numb);
	doble (numa, numb);
end.
