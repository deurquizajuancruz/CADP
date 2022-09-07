program Punto1Practica4Parte2EA;
const
	dimF=10000;
type
	computadora=record
	codigo:real;
	version:real;
	paquetes:integer;
	cuentas:integer;
end;
	vestadisticas=array[1..dimF] of computadora;
procedure leervector(var c:computadora);
begin
	writeln('Ingrese el codigo de la computadora: ');
	readln(c.codigo);
	if (c.codigo<>-1) then
		begin
		writeln('Ingrese la version de Ubuntu: ');
		readln(c.version);
		writeln('Ingrese la cantidad de paquetes instalados: ');
		readln(c.paquetes);
		writeln('Ingrese la cantidad de cuentas de usuario: ');
		readln(c.cuentas);
		end;
end;
procedure cargarvector(var v:vestadisticas;var dimL:integer);
var
	aux:computadora;
begin
	dimL:=0;
	leervector(aux);
	while (dimL<=dimF) and (aux.codigo<>-1) do
		begin
		dimL:=dimL+1;
		v[dimL]:=aux;
		leervector(aux);
		end;
end;
procedure maximo (var maximacantidad:integer;var maxversion:real;cantidadpaquetes:integer;version:real);
begin
		if (cantidadpaquetes>maximacantidad) then
			begin
			maximacantidad:=cantidadpaquetes;
			maxversion:=version;
			end;
end;
procedure recorrervector(dimL:integer;var v:vestadisticas);
var
	i,maximacantidad,version18,version16,totalusuarios:integer;
	maxversion:real;
begin
	maximacantidad:=-1;version18:=0;version16:=0;totalusuarios:=0;
	for i:=1 to dimL do
		begin
		totalusuarios:=totalusuarios + v[i].cuentas;
		if (v[i].version>18.03) and (v[i].version<18.05) then
			version18:=version18 +1;
		if (v[i].version>16.03) and (v[i].version<16.05) then
			version16:=version16 +1;
		maximo(maximacantidad,maxversion,v[i].paquetes,v[i].version);
		end;
	writeln('La cantidad de computadoras que utilizan la version 18.04 de Ubuntu es de: ',version18);
	writeln('La cantidad de computadoras que utilizan la version 16.04 de Ubuntu es de: ',version16);
	writeln('La version de Ubuntu con mayor cantidad de paquetes instalados es de: ',maxversion:4:2);
	writeln('El promedio de cuentas de usuario por computadora es de: ',(totalusuarios/dimL):4:2);
end;
var
	v:vestadisticas;
	dimL:integer;
begin
	cargarvector(v,dimL);
	recorrervector(dimL,v);
end.
