program Punto10Practica2Parte2;
procedure suma (var secuencia1:longint; var sumap1:longint;var cantidad1:longint);
	var
		dig:integer;
	begin
		sumap1:=0; cantidad1:=0;
		while (secuencia1<>0) do
			begin
				dig:= (secuencia1 mod 10);
				if (dig mod 2 =0) then
					sumap1:=sumap1 + dig
				else
					cantidad1:=cantidad1+1;
				secuencia1:=secuencia1 div 10;
			end;
	writeln('La suma de los digitos pares es de: ', sumap1);
	writeln('La cantidad de digitos impares es de: ', cantidad1);
	end;
var
	secuencia, sumap, cantidad:longint;
begin
	sumap:=0;cantidad:=0;
	begin
		writeln('Ingrese una secuencia de numeros enteros: ');
		readln(secuencia);
		while (secuencia<>123456) do
			begin
			suma(secuencia,sumap,cantidad);
			writeln('Ingrese una secuencia de numeros enteros: ');
			readln(secuencia);
			end;
	end;
end.
