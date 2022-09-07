program Punto9BPractica2Parte2;
procedure sumar (var secuencia1:integer;var suma1:integer;var cantidad1:integer);
	begin
	repeat
		suma1:=0;
		writeln('Ingrese una secuencia de numeros: ');
		readln (secuencia1);
		while (secuencia1<>0) do
			begin
			suma1:=suma1 + (secuencia1 mod 10);
			secuencia1:=(secuencia1 div 10);
			cantidad1:= cantidad1 +1;
			end;
		writeln ('La cantidad total de digitos de esta secuencia fue de: ',cantidad1);
		cantidad1:= 0;
		until (suma1=10);
	end;
var
	secuencia, suma, cantidad: integer;
begin
	sumar(secuencia,suma,cantidad);
end.
