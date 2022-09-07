program Punto1Practica1Parte2;
var
	num, i, suma, num5 : integer;
begin
	suma := 0;
	num5 := 0;
	for i:= 1 to 10 do
	begin
		write ('Ingrese un numero entero: ');
		read (num);
		suma:= suma + num;
		if (num>5) then
			num5 := num5 + 1;
	end;
	write ('La suma de todos los numeros enteros es: ', suma, '. ');
	write ('La cantidad de numeros ingresados mayores a 5 fue de: ', num5);
end.
