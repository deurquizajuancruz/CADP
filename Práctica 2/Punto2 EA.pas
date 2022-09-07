program Punto2Practica2EA;
procedure sumar (numuno, numdos:integer);
var
	suma: integer;
begin
	suma:=0;
	repeat
		suma:= suma + numuno;
		numuno:= numuno +1;
	until (numuno=numdos+1);
	writeln ('La suma de todos los numeros entre los numeros enteros ingresados es de: ',suma);
end;
procedure multiplicacion (numero1, numero2: integer);
var
	producto:integer;
begin
	producto:=1;
	repeat
		producto:=(producto*numero1);
		numero1:= numero1 + 1;
	until (numero1=numero2 +1);
	writeln('El producto de todos los numeros entre los numeros enteros ingresados es de: ',producto);
end;
var
	contador, num1, num2: integer;
begin
	contador:=0;
	repeat
		writeln('Ingrese el primer numero entero: ');
		readln(num1);
		writeln('Ingrese el segundo numero entero: ');
		readln(num2);
		sumar(num1, num2);
		multiplicacion(num1,num2);
		contador:= contador+1;
	until (contador=10);
end.
