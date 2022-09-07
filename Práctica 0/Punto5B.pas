Program Punto5BPractica;

var
	x, y, quedara, tocara: integer;
	precio : real;
begin
	precio := 1.60;
	write ('Ingrese cantidad de caramelos: ');
	read (x);
	write ('Ingrese cantidad de clientes: ');
	read (y);
	quedara:= x mod y;
	tocara := x div y;
	write (' A cada cliente le tocara : ', tocara, ' caramelo/s y el kiosquero se quedara con: ', quedara);
	write ('El kiosquiero va a tener que cobrar: ', x * precio - quedara:2:0);
end.
