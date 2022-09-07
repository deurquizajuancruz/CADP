program Punto3BPractica4Parte2;
const
	dimF=300;
type
	mes=1..31;
	viajes=record
	dia:mes;
	monto:real;
	distancia:real;
end;
	infoviajes=array[1..dimF]of viajes;
	vdias=array[mes] of integer;
procedure unviaje(var v:viajes);
begin
	writeln('Ingrese la distancia recorrida medida en km: ');
	readln(v.distancia);
	if (v.distancia<>0) then
		begin
			writeln('Ingrese el dia en el que se realizo el viaje: ');
			readln(v.dia);
			writeln('Ingrese el monto transportado durante el viaje: ');
			readln(v.monto);
		end;
end;
procedure cargarvector(var info:infoviajes;var dimL:integer);
var
	aux:viajes;
begin
	dimL:=0;
	unviaje(aux);
	while (dimL<=dimF) and (aux.distancia<>0) do
		begin
			dimL:=dimL +1;
			info[dimL]:=aux;
			unviaje(aux);
		end;
end;
procedure inicializar (var v:vdias);
var
	i:mes;
begin
	for i:=1 to 31 do
		begin
			v[i]:=0;
		end;
end;
procedure minimo (montorecibe:real;distanciarecibe:real;diarecibe:mes;var mind,menormonto:real;var mindia:integer);
begin
	if (montorecibe<menormonto) then
		begin
			menormonto:=montorecibe;
			mind:=distanciarecibe;
			mindia:=diarecibe;
		end;
end;
procedure contardias (var v:vdias;dia:mes);
begin
	v[dia]:=v[dia] +1;
end;
procedure montoentotal(monto:real;var montototal:real);
begin
	montototal:=montototal + monto;
end;
procedure recorrervector (dimL:integer;info:infoviajes;var v:vdias);
var
	i:integer;
	menormonto,montototal,mind:real;
	mindia:integer;
	j:mes;
begin
	mind:=500000;mindia:=32;menormonto:=500000;montototal:=0;
	inicializar(v);
	for i:=1 to dimL do
		begin
		minimo(info[i].monto,info[i].distancia,info[i].dia,mind,menormonto,mindia);
		montoentotal(info[i].monto,montototal);
		contardias(v,info[i].dia);
		end;
	writeln('El monto promedio de los viajes realizados es de: ',(montototal/dimL):4:2);
	writeln('La distancia recorrida del viaje en el que se transporto menos dinero fue de: ',mind:4:4,' km. en el dia: ',mindia);
	for j:=1 to 31 do
		writeln('La cantidad de viajes realizados en el dia ',j,' fue de: ',v[j]);
end;
procedure eliminar(var info:infoviajes;var dimL:integer;var poder:boolean);
var
	i:integer;
begin
	poder:=false;
	for i:=1 to (dimL-1) do
		begin
			if (info[i].distancia=100) then
				begin
				info[i]:=info[i+1];
				poder:=true;
				dimL:=dimL -1;
				end;
		end;
end;
var
	info:infoviajes;
	dimL:integer;
	v:vdias;
	poder:boolean;
begin
	cargarvector(info,dimL);
	recorrervector(dimL,info,v);
	eliminar(info,dimL,poder);
	if (poder=true) then
		writeln('Los viajes que recorrieron 100 km han sido eliminados.');
end.
