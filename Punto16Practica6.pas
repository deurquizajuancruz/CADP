program Punto16Practica6;
type
	corredor = record
	nya:string;
	diskm:real;
	tiempo:real;
	pais:string;
	ciudadp:string;
	ciudadf:string;
end;
	lista=^nodo;
	nodo=record
	elem:corredor;
	sig:lista;
end;
procedure leerinfo(var c:corredor);
begin
	writeln('Ingrese el nombre y apellido del corredor: ');
	readln(c.nya);
	if (c.nya<>'Nulo') then
		begin
		writeln('Ingrese la distancia recorrida en km: ');
		readln(c.diskm);
		writeln('Ingrese el tiempo en minutos en el cual se corrio: ');
		readln(c.tiempo);
		writeln('Ingrese el pais: ');
		readln(c.pais);
		writeln('Ingrese la ciudad de partida: ');
		readln(c.ciudadp);
		writeln('Ingrese la ciudad de finalizacion: ');
		readln(c.ciudadf);
		end;
end;
procedure insertarordenado (var l:lista;c:corredor);
var
	ant,act,nue:lista;
begin
	new(nue);nue^.elem:=c;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
	begin
		act:=l;ant:=l;
		while (act<>nil) and (c.ciudadp<act^.elem.ciudadP) do
			begin
			ant:=act;
			act:=act^.sig;
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
	c:corredor;
begin
	leerinfo(c);
	while (c.nya<>'Nulo') do
		begin
		insertarordenado(l,c);
		leerinfo(c);
		end;
end;
procedure maximo (var maxciudad:string;var maxcorredores,maxkm:real;corredoresciudad:integer;kmciudad:real;nombreciudad:string);
begin
	if (corredoresciudad>maxcorredores) then
		begin
		maxcorredores:=corredoresciudad;
		maxciudad:=nombreciudad;
		maxkm:=kmciudad;
		end;
end;
procedure imprimir (cantidadtotalc,corredoresbr,distintaciudad:integer;distanciatotal,pasos,maxkm,distanciabr,tiempototal:real;maxciudad:string);
begin
	writeln('La cantidad total de corredores fue de: ',cantidadtotalc);
	writeln('La distancia total recorrida fue de: ',distanciatotal:4:2);
	writeln('El tiempo de carrera de todos los corredores fue de: ',tiempototal:4:2);
	writeln('El nombre de la ciudad con mayor cantidad de corredores es: ',maxciudad,' y la cantidad de km recorridos por sus corredores es de: ',maxkm:4:2);
	writeln('La distancia promedio recorrido por los corredores de Brasil es de: ',(distanciabr/corredoresbr):4:2);
	writeln('La cantidad de corredores que partieron de una ciudad y finalizaron en otra es de: ',distintaciudad);
	writeln('El paso promedio de los corredores de Boston es de: ',pasos:4:2);
end;
procedure recorrerlista (l:lista);
var
	cantidadtotalc,corredoresbr,distintaciudad,corredoresbo,corredoresmismaciudad:integer;
	distanciatotal,tiempototal,distanciabr,pasos,pasostotal,canttotalkmciudad,maxcorredores,maxkm:real;
	maxciudad,auxciudad:string;
	aux:lista;
begin
	cantidadtotalc:=0;corredoresbr:=0;distintaciudad:=0;corredoresbo:=0;maxcorredores:=-100;maxkm:=-100;distanciatotal:=0;tiempototal:=0;distanciabr:=0;pasos:=0;pasostotal:=0;
	while (l<>nil) do
		begin
		cantidadtotalc:=cantidadtotalc +1; distanciatotal:=distanciatotal + l^.elem.diskm; tiempototal:=tiempototal + l^.elem.tiempo;
		if (l^.elem.pais='Brasil') then
			begin
			corredoresbr:=corredoresbr +1;distanciabr:=distanciabr + l^.elem.diskm;
			end;
		if (l^.elem.ciudadp<>l^.elem.ciudadf) then
			distintaciudad:=distintaciudad +1;
		if (l^.elem.ciudadp='Boston') then
			begin
			pasostotal:=pasostotal+ (l^.elem.tiempo/l^.elem.diskm);
			corredoresbo:=corredoresbo +1;
			end;
		auxciudad:=l^.elem.ciudadp; corredoresmismaciudad:=0;canttotalkmciudad:=0;aux:=l;
		while (aux<>nil) and (auxciudad=l^.elem.ciudadp) do
			begin
			corredoresmismaciudad:=corredoresmismaciudad +1;canttotalkmciudad:=canttotalkmciudad + l^.elem.diskm;aux:=aux^.sig;
			end;
		maximo(maxciudad,maxcorredores,maxkm,corredoresmismaciudad,canttotalkmciudad,auxciudad);
		l:=l^.sig;
		end;
	pasos:=(pasostotal/corredoresbo);
	imprimir(cantidadtotalc,corredoresbr,distintaciudad,distanciatotal,pasos,maxkm,distanciabr,tiempototal,maxciudad);
end;
var
	l:lista;
begin
	l:=nil;
	cargarlista(l);
	recorrerlista(l);
end.
