Program Punto5APracticaO;

var
	x, y: integer;
begin
	write ('Ingrese cantidad de caramelos: ');
	read (x);
	write ('Ingrese cantidad de clientes: ');
	read (y);
	write ('A cada cliente le tocara: ', x div y, ' caramelo/s y el kiosquero se quedara con: ', x mod y, ' caramelo/s');
end.
