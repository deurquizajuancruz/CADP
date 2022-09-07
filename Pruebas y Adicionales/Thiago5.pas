program Thiago5;
var
	x,y:integer;
begin
	writeln('Ingresar cantidad de caramelos: ');readln(x);
	writeln('Ingresar cantidad de clientes: ');readln(y);
	writeln('La cantidad que le toca a cada cliente es: ',(x div y), '. La cantidad que se quedara el kiosquero es: ',(x mod y));
	writeln('El dinero que debera cobrar el kiosquero es: ', (1.6 * ((x div y) * y)):0:2);
end.
