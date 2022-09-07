program Punto1Practica1Parte2;
var
	num, i, suma : integer;
begin
	suma := 0;
	for i:= 1 to 10 do
	begin
		write ('Ingrese un numero entero: ');
		read (num);
		suma:= suma + num;
	end;
	write ('La suma de todos los numeros enteros es: ', suma);
end.
