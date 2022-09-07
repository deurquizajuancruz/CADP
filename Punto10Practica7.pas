program Punto10Practica7;
type
	subrangocultivos=1..20;
	cultivo=record
	tipo:string;
	hectareas:real;
	meses:integer;
end;
	vcultivos=array[subrangocultivos] of cultivo;
	empresa=record
	codigo:integer;
	nombre:string;
	eop:string;
	ciudad:string;
	cultivos:vcultivos;
	dimL:subrangocultivos;
end;
	lista=^nodo;
	nodo=record
	elem:empresa;
	sig:lista;
end;
procedure leercultivo(var c:cultivo);
begin
	writeln('Ingrese las hectareas dedicadas a los cultivos: ');readln(c.hectareas);
	if (c.hectareas<>0) then
		begin
		writeln('Ingrese el tipo de cultivo: ');readln(c.tipo);
		writeln('Ingrese los meses que lleva el ciclo del cultivo: ');readln(c.meses);
		end;
end;
procedure cargarvector(var v:vcultivos; diml:subrangocultivos);
var
	i:subrangocultivos;
	c:cultivo;
begin
	for i:=1 to diml do
		begin
		leercultivo(c);
		v[i]:=c;
		end;
end;
procedure leerinfo(var e:empresa);
begin
	writeln('Ingrese el codigo de la empresa: ');readln(e.codigo);
		if (e.codigo<>-1) then
		begin
		writeln('Ingrese si la empresa es estatal o privada: ');readln(e.eop);
		writeln('Ingrese el nombre de la empresa: ');readln(e.nombre);
		writeln('Ingrese la ciudad donde esta radicada la empresa: ');readln(e.ciudad);
		writeln('Ingrese la cantidad de cultivos que realiza la empresa(a lo sumo 20): ');readln(e.dimL);
		cargarvector(e.cultivos,e.diml);
		end;
end;
procedure insertarordenado(var l:lista;e:empresa);
var
	act,ant,nue:lista;
begin
	new(nue);nue^.elem:=e;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		act:=l;ant:=l;
		while (act<>nil) and (act^.elem.nombre<e.nombre) do
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
procedure armarlista(var l:lista);
var
	e:empresa;
begin
	leerinfo(e);
	while (e.codigo<>-1) do
		begin
		insertarordenado(l,e);
		leerinfo(e);
		end;
end;
function dosceros(codigo:integer):boolean;
var
	aux,cantidad0:integer;
begin
	aux:=0;cantidad0:=0;
	while(codigo<>0) do
		begin
		aux:=(codigo mod 10);
		if (aux=0) then
			cantidad0:=cantidad0 +1;
		codigo:=codigo div 10;
		end;
	if (cantidad0>=2) then
		dosceros:=true
	else
		dosceros:=false;
end;
procedure maximos(var max1:integer;tiempoempresa:integer;var maxempresa:string;empresa:string);
begin
	if (tiempoempresa>max1) then
		begin
		max1:=tiempoempresa;
		maxempresa:=empresa;
		end;
end;
procedure aumentar(var l:lista);
var
	i:subrangocultivos;
begin
	while (l<>nil) do
		begin
		for i:=1 to l^.elem.diml do
			begin
			if (l^.elem.eop='Privada') and (l^.elem.cultivos[i].tipo='Girasol') and (l^.elem.cultivos[i].hectareas<5) then
				l^.elem.cultivos[i].meses:=l^.elem.cultivos[i].meses +1;
			end;
		l:=l^.sig;
		end;
end;
procedure recorrerlista (l:lista);
var
	i:subrangocultivos;
	hectareastotal,hectareassoja:real;
	max1,tiempomaiz:integer;
	maxempresa,auxnombre:string;
begin
	hectareastotal:=0;hectareassoja:=0;max1:=-100;
	while (l<>nil) do
		begin
		tiempomaiz:=0;auxnombre:=l^.elem.nombre;
		while (l<>nil) and (auxnombre=l^.elem.nombre) do
			begin
				for i:=1 to l^.elem.diml do
				begin
				if (l^.elem.ciudad='San Miguel del Monte') and (dosceros(l^.elem.codigo)=true) and (l^.elem.cultivos[i].tipo='Trigo') then
					writeln('La empresa ',l^.elem.nombre,' tiene residencia en San Miguel del Monte, cultiva trigo y su codigo posee minimamente 2 ceros.'); 
				hectareastotal:=hectareastotal + l^.elem.cultivos[i].hectareas;
				if (l^.elem.cultivos[i].tipo='Soja') then
					hectareassoja:=hectareassoja + l^.elem.cultivos[i].hectareas;
				if (l^.elem.cultivos[i].tipo='Maiz') then
					tiempomaiz:=tiempomaiz + l^.elem.cultivos[i].meses;
				end;
				l:=l^.sig;
			end;
		maximos(max1,tiempomaiz,maxempresa,auxnombre);
		end;
	writeln('La cantidad de hectareas dedicadas al cultivo de soja es de: ',hectareassoja:4:2,' y representa un ',((hectareassoja/hectareastotal)*100):4:2,'% del total de hectares utilizadas.');
	writeln('La empresa que mas le dedico tiempo al maiz fue: ',maxempresa);
end;
var
	l:lista;
begin
	l:=nil;
	armarlista(l);
	recorrerlista(l);
	aumentar(l);
end.
