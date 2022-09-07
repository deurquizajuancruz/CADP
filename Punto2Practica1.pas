Program Punto2Practica1;
var
	num : real;
begin
	write('Escriba un numero: ');
	read (num);
	if num<0 then
		write ('El valor absoluto de ese numero es: ', num *-1:2:2);
	if num>0 then
		write ('El valor absoluto de ese numero es: ', num:2:2);
end.
