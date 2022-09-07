program Punto4APractica2EA;
const
	pi=3.14159;
procedure circulo (radio1: real);
var
	diametro, perimetro:real;
begin
	diametro:=(radio1*2);
	writeln('El diametro del circulo es: ',diametro:4:2);
	perimetro:=(diametro*pi);
	writeln('El perimetro del circulo es: ',perimetro:4:2);
end;
var
	radio: real;
begin
	writeln('Ingrese el radio del circulo: ');
	readln(radio);
	circulo(radio);
end.
