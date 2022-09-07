program Punto5Practica1Parte2;
var
	num, suma, minimo, maximo : integer;
begin
	suma := 0;
	minimo:= 32000;
	maximo := -32000;
	repeat
		write ('Ingrese un numero entero: ');
		read (num);
		suma := suma + num;
		if (num> maximo) then
			maximo := num;
		if (num< minimo) then
			minimo := num;
	until (num = 100);
	write ('El menor numero ingresado fue: ', minimo,'. ');
	write ('El mayor numero ingresado fue: ', maximo, '.');
	write ('La suma de todos los numeros ingresados es de: ', suma,'.');
end.
