Program Punto3Practica0;

VAR
	num1, num2, resultado : real;
begin
	write ('Ingrese un numero real: ');
	read (num1);
	write ('Ingrese otro numero real: ');
	read (num2);
	resultado:= (num1/num2);
	write ('El resultado de la division es: ', resultado:0:2);
end.
