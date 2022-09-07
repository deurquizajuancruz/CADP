Program Punto1Practica;
var
	num1, num2 : integer;
begin
	write ('Inserte un numero entero: ');
	read (num1);
	write ('Inserte otro numero entero: ');
	read (num2);
	if num1>num2 then
		write ('El primer numero ingresado es mayor que el segundo.');
	if num2>num1 then
		write ('El segundo numero ingresado es mayor que el primero.');
	if num1=num2 then
		write ('Los numeros leidos son iguales.');
end.
