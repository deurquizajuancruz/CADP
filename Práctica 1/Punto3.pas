Program Punto3Practica1;
var
	num1, num2, num3 : real;
begin
	write ('Ingrese un numero: ');
	read (num1);
	write ('Ingrese otro numero: ');
	read (num2);
	write ('Ingrese el ultimo numero: ');
	read (num3);
	if (num1> num2) and (num1>num3) then
		begin
		if num2> num3 then
			write ('El orden descendente es: ', num1:2:2,',', num2:2:2,',', num3:2:2);
		if num3> num2 then
			write ('El orden descendente es: ', num1:2:2,',', num3:2:2,',', num2:2:2);
		end;
	if (num2> num1) and (num2> num3) then
		begin
		if num1>num3 then
			write ('El orden descendente es: ', num2:2:2,',', num1:2:2,',',num3:2:2);
		if num3>num1 then
			write ('El orden descendente es: ', num2:2:2,',',num3:2:2,',',num1:2:2);
		end;
	if (num3> num2) and (num3> num1) then
		begin
		if num2>num1 then
			write ('El orden descendente es: ', num3:2:2,',',num2:2:2,',',num1:2:2);
		if num1>num2 then
			write ('El orden descendente es: ', num3:2:2,',',num1:2:2,',',num2:2:2);
		end;
end.
