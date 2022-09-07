program Punto4Practica3;
type
	cliente =record
	codigo:real;
	cantidadLineas:integer;
	numero:real;
	minutos:real;
	MB:real;
end;
procedure LineaTelefono (var c1:cliente;var totalMinutos1:real;var totalMB1:real);
var
	sumalineas:integer;
begin
	sumalineas:=0;
	writeln('Ingrese el codigo del cliente: ');
	readln(c1.codigo);
	writeln('Ingrese la cantidad de lineas del cliente: ');
	readln(c1.cantidadLineas);
	repeat
		writeln('Ingrese el numero de la linea: ');
		readln(c1.numero);
		writeln('Ingrese los minutos consumidos de la linea: ');
		readln(c1.minutos);
		totalMinutos1:=totalMinutos1 + c1.minutos;
		writeln('Ingrese la cantidad de MB consumidos en el mes: ');
		readln(c1.MB);
		totalMB1:=totalMB1 + c1.MB;
		sumalineas:=sumalineas +1;
	until (sumalineas=c1.cantidadLineas);
end;
procedure factura(var facturaMinutos1:real;var facturaMB1:real; var totalMinutos2:real; var totalMB2:real);
begin
	facturaMinutos1:=(3.40*totalMinutos2);
	facturaMB1:=(1.35*totalMB2);
	writeln('La cantidad total a facturar por usar los minutos es de: $',facturaMinutos1:4:2);
	writeln('La cantidad total a facturar por usar MB es de: $',facturaMB1:4:2);
end;
var
	c:cliente;
	i:integer;
	facturaMinutos,facturaMB,totalMinutos:real;totalMB:real;
begin
	facturaMinutos:=0;facturaMB:=0; totalMinutos:=0; totalMB:=0;
	for i:=1 to 9300 do
		begin
			LineaTelefono(c,totalMinutos,totalMB);
			factura(facturaMinutos,facturaMB,totalMinutos,totalMB);
			totalMinutos:=0;totalMB:=0;
		end;
end.
