Program Punto4CPractica0;

VAR
	diametro : integer;
	pi : real;
begin
	pi := 3.14;
	write ('Introduce el valor del diametro de su circulo: ');
	read (diametro);
	write ('El area de su circulo es: ', pi * diametro:2:2);
end.
