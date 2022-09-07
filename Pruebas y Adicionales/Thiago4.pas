program Thiago4;
const
	pi=3.14;
var
	diametro,radio:real;
begin
	writeln('Ingresar diametro: ');readln(diametro);
	radio:=(diametro/2);
	writeln('El radio es: ',radio:0:2);
	writeln('El area del circulo es: ',(pi*radio*radio):0:2);
	writeln('El perimetro del circulo es: ', (diametro*pi):0:2);
end.
