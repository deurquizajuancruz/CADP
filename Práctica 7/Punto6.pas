program Punto6Practica7;
type
	subrango=1..7;
	objeto=record
	codigo:integer;
	categoria:subrango;
	nombre:string;
	distancia:real;
	nombredescubridor:string;
	aniodescubrimiento:integer;
end;
	lista=^nodo;
	nodo=record
	elem:objeto;
	sig:lista;
end;
	vcategoria=array[subrango]of integer;
procedure leerinfo (var o:objeto);
begin
	writeln('Ingrese el codigo del objeto: ');
	readln(o.codigo);
	if (o.codigo<>-1) then
		begin
		writeln('Ingrese la categoria del objeto: ');
		readln(o.categoria);
		writeln('Ingrese el nombre del objeto: ');
		readln(o.nombre);
		writeln('Ingrese la distancia en anios luz: ');
		readln(o.distancia);
		writeln('Ingrese el nombre del descubridor: ');
		readln(o.nombredescubridor);
		writeln('Ingrese el anio del descubrimiento: ');
		readln(o.aniodescubrimiento);
		end;
end;
procedure agregaralfinal (var l:lista;o:objeto);
var
	nuevo,aux:lista;
begin
	new(nuevo);nuevo^.elem:=o;nuevo^.sig:=nil;
	if (l=nil) then
		l:=nuevo
	else
		begin
		aux:=l;
		while (aux^.sig<>nil) do
			begin
			aux:=aux^.sig;
			end;
		aux^.sig:=nuevo;
		end;
end;
procedure cargarlista (var l:lista);
var
	o:objeto;
begin
	leerinfo(o);
	while (o.codigo<>-1) do
		begin
		agregaralfinal(l,o);
		leerinfo(o);
		end;
end;
procedure maximos (var max1,max2:real;var maxcodigo1,maxcodigo2:integer;codigo:integer;distancia:real);
begin
	if (distancia>max1) then
		begin
		max2:=max1;
		max1:=distancia;
		maxcodigo2:=maxcodigo1;
		maxcodigo1:=codigo;
		end
	else
	if (distancia>max2) then
		begin
		max2:=distancia;
		maxcodigo2:=codigo;
		end;
end;
procedure inicializar(var v:vcategoria);
var
	i:subrango;
begin
	for i:=1 to 7 do
		v[i]:=0;
end;
function digitospares(codigo:integer):boolean;
var
	aux,pares,impares:integer;
begin
	aux:=0;pares:=0;impares:=0;
	while (codigo<>0) do
		begin
		aux:=(codigo mod 10);
		if (aux mod 2=0) then
			pares:=pares +1
		else
			impares:=impares +1;
		codigo:=codigo div 10;
		end;
	if (pares>impares) then
		digitospares:=true
	else
		digitospares:=false;
end;
procedure recorrerlista(l:lista;var v:vcategoria);
var
	max1,max2:real;
	galileo,maxcodigo1,maxcodigo2:integer;
	i:subrango;
begin
	max1:=-100;max2:=-100;galileo:=0;
	while (l<>nil) do
		begin
		maximos(max1,max2,maxcodigo1,maxcodigo2,l^.elem.codigo,l^.elem.distancia);
		if (l^.elem.nombredescubridor='Galileo Galilei') and (l^.elem.aniodescubrimiento<1600) then
			galileo:=galileo +1;
		v[l^.elem.categoria]:=v[l^.elem.categoria] +1;
		if (digitospares(l^.elem.codigo)=true) then
			writeln('La estrella con nombre: ',l^.elem.nombre,' tiene un codigo que posee mas digitos pares que impares.');
		l:=l^.sig;
		end;
	for i:=1 to 7 do 
		begin
		writeln('La cantidad de objetos de la categoria ',i,' es de: ',v[i]);
		end;
	writeln('El codigo del planeta mas lejos de la tierra es: ',maxcodigo1,'. El codigo del segundo planeta mas lejos de la tierra es: ',maxcodigo2);
	writeln('La cantidad de planetas descubiertos por Galileo Galilei antes del anio 1600 es de: ',galileo);
end;
var
	l:lista;
	v:vcategoria;
begin
	l:=nil;
	inicializar(v);
	cargarlista(l);
	recorrerlista(l,v);
end.
