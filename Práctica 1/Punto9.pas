Program Punto9Practica1;
var
	operador : char;
	num1, num2, num3, num4, num5, resultadosuma, resultadoresta: real;
begin
	writeln('Ingrese un caracter: ');
	read (operador);
	if (operador<> '+') and (operador <> '-') then
		write ('Caracteres invalidos.');
	if (operador = '+') then
		begin
			write ('Ingrese una secuencia de 5 numeros terminada en 0: ');
			read (num1, num2, num3, num4, num5);
			resultadosuma := num1 + num2 + num3 + num4 + num5;
				if (num5 = 0) then
					writeln('El resultado de la operacion es: ', resultadosuma:2:2, '(', num1:3:2,',', num2:3:2,',', num3:3:2,',', num4:3:2,',', num5:3:2, ')');
				if (num5 <> 0) then
					writeln ('El ultimo numero debe ser 0.');
		end;
	if (operador = '-') then
		begin
			write ('Ingrese una secuencia de 5 numeros terminada en 0: ');
			read (num1, num2, num3, num4, num5);
			resultadoresta := num1 - num2 - num3 - num4 - num5;
				if (num5 = 0) then
					writeln ('El resultado de la operacion es: ', resultadoresta:2:2, '(', num1:3:2,',', num2:3:2,',', num3:3:2,',', num4:3:2,',', num5:3:2, ')');
				if (num5 <> 0) then
					writeln ('El ultimo numero debe ser 0.');
		end;
end.
