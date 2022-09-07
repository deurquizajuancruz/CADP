program Punto2Practica3;
type
	fecha=record
	dia: integer;
	mes:integer;
	anio:integer;
end;
procedure leerFecha (var fecha1:fecha; var verano1:integer; var diezdias1:integer);
	begin
		writeln('Ingrese el anio de su casamiento: ');
		readln(fecha1.anio);
		if (fecha1.anio<>2020) and (fecha1.anio=2019) then
		begin
		writeln('Ingrese el dia del casamiento: ');
		readln(fecha1.dia);
		if (fecha1.dia>=1) and (fecha1.dia<=10) then
			diezdias1:=diezdias1 +1;
		writeln('Ingrese el mes del casamiento: ');
		readln(fecha1.mes);
		if (fecha1.mes>=1) and (fecha1.mes<=3) then
			verano1:=verano1 +1;
		end;
	end;
var
	f:fecha;
	verano,diezdias:integer;
begin
	verano:=0;diezdias:=0;
	leerFecha(f,verano,diezdias);
	while (f.anio<>2020) do
		begin
			leerFecha(f,verano,diezdias);
		end;
	writeln('La cantidad de casamientos realizados en verano fue de: ',verano);
	writeln('La cantidad de casamientos realizados en los primeros 10 dias de los meses fue de: ',diezdias);
end.
