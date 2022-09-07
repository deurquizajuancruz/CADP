program Punto3APractica4Parte2;
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
var
	info:infoviajes;
	dimL:integer;
begin
	cargarvector(info,dimL);
end.
