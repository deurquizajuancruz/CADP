Program Punto4BPractica0;

VAR
	diametro, radio, radio2 : integer;
	pi, area : real;
begin
	pi := 3.14;
	write ('Ingrese el valor de un diametro: ');
	read (diametro);
	radio := (diametro div 2);
	radio2 := (radio * radio);
	area := (radio2 * pi);
	write ('El area del circulo es: ', area:2:2);
end.
