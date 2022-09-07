program Punto9APractica2Parte2;
procedure entero (numero1: integer; var cantidad1:integer;var suma1:integer);
begin
	while (numero1<>0) do
		begin
		suma1:= suma1 + (numero1 mod 10);
		numero1:=(numero1 div 10);
		cantidad1:= cantidad1 +1;
		end;
end;
var
	numero, cantidad, suma:integer;
begin
	cantidad:=0;suma:=0;
	writeln('Ingrese un numero entero: ');
	readln(numero);
	entero(numero,cantidad,suma);
	writeln('La cantidad de digitos que posee es de: ',cantidad,' . ');
	writeln('La suma de todos los digitos es de: ', suma,' .');
end.
