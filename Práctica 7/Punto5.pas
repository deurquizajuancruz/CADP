program Punto5Practica7;
type
	subrangocamion=1..100;
	camion=record
	patente:string;
	aniof:integer;
	capacidad:real;
end;
	vcamiones=array[subrangocamion] of camion;
	viaje=record
	codigoviaje:integer;
	codigocamion:subrangocamion;
	distanciakm:real;
	destino:string;
	anio:integer;
	dni:integer;
end;
	lista=^nodo;
	nodo=record
	elem:viaje;
	sig:lista;
end;
{
procedure cargarvector(var v:vcamiones); SE DISPONE
}
procedure leerinfo(var vi:viaje);
begin
	writeln('Ingrese el codigo del viaje: ');
	readln(vi.codigoviaje);
	if (vi.codigoviaje<>-1) then
		begin
		writeln('Ingrese el codigo del camion: ');
		readln(vi.codigocamion);
		writeln('Ingrese la distancia recorrida en km: ');
		readln(vi.distanciakm);
		writeln('Ingrese el destino: ');
		readln(vi.destino);
		writeln('Ingrese el anio del viaje: ');
		readln(vi.anio);
		writeln('Ingrese el dni del chofer: ');
		readln(vi.dni);
		end;
end;
procedure insertarordenado(var l:lista;vi:viaje);
var
	ant,act,nue:lista;
begin
	new(nue);nue^.elem:=vi;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		act:=l;ant:=l;
		while (act<>nil) and (act^.elem.codigocamion<vi.codigocamion) do
			begin
			ant:=act;act:=act^.sig;
			end;
		if (ant=act) then
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
		end;
end;
procedure cargarlista (var l:lista);
var
	vi:viaje;
begin
	leerinfo(vi);
	while (vi.codigoviaje<>-1) do
		begin
		insertarordenado(l,vi);
		leerinfo(vi);
		end;
end;
procedure maximo(patente:string;kmrecorridos:real;var maxkm:real;var maxpatente:string);
begin
	if (kmrecorridos>maxkm) then
		begin
		maxkm:=kmrecorridos;
		maxpatente:=patente;
		end;
end;
procedure minimo(patente:string;kmrecorridos:real;var minkm:real;var minpatente:string);
begin
	if (kmrecorridos<minkm) then
		begin
		minkm:=kmrecorridos;
		minpatente:=patente;
		end;
end;
function digitosimpares(dni:integer):boolean;
var
	aux,cantidad,pares,impares:integer;
begin
	pares:=0;impares:=0;cantidad:=0;aux:=0;
	while (dni<>0) do
		begin
		aux:=(dni mod 10);
		cantidad:=cantidad +1;
		if (aux mod 2=0) then
			pares:=pares +1
		else
			impares:=impares +1;
		dni:=dni div 10;
		end;
	if (cantidad=impares) then
		digitosimpares:=true
	else
		digitosimpares:=false;
end;
procedure recorrerlista(l:lista; v:vcamiones);
var
	viajescondiciones:integer;
	maxkm,minkm,totalkmcamion:real;
	maxpatente,minpatente:string;
	aux:lista;
	auxcodigo:subrangocamion;
begin
	viajescondiciones:=0;maxkm:=-100;minkm:=999999;
	while (l<>nil) do
		begin
		if (v[l^.elem.codigocamion].capacidad>30.5) and (v[l^.elem.codigocamion].aniof+5<l^.elem.anio) then
			viajescondiciones:=viajescondiciones +1;
		if (digitosimpares(l^.elem.dni)=true) then
			writeln('El dni de este chofer tiene solo digitos impares. Su codigo de viaje es: ',l^.elem.codigoviaje);
		aux:=l;auxcodigo:=l^.elem.codigocamion;totalkmcamion:=0;
		while (aux<>nil) and (auxcodigo=l^.elem.codigocamion) do
			begin
			totalkmcamion:=totalkmcamion + l^.elem.distanciakm;aux:=aux^.sig;
			end;
		maximo(v[l^.elem.codigocamion].patente,totalkmcamion,maxkm,maxpatente);
		minimo(v[l^.elem.codigocamion].patente,totalkmcamion,minkm,minpatente);
		l:=l^.sig;
		end;
	writeln('La patente del camion con mas km recorridos es: ',maxpatente);
	writeln('La patente del camion con menos km recorridos es: ',minpatente);
	writeln('La cantidad de viajes donde la capacidad del camion supera las 30,5 toneladas y el camion haya sido mayor a 5 anios al momento de realizar el viaje es de: ',viajescondiciones);
end;
var
	l:lista;
	v:vcamiones;
begin
//  cargarvector(v); SE DISPONE
 	cargarlista(l);
 	recorrerlista(l,v);
end.
