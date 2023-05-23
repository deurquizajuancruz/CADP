program Punto6Practica6;
type
	sonda = record
		nombre:string;
		duracion:integer;
		costoC:real;
		costoM:real;
		tipor:integer;
	end;
	rango=array [1..7] of integer;
	lista=^nodo;
	nodo =record
		elem:sonda;
		sig:lista;
	end;

procedure leersonda (var s:sonda);
begin
	writeln('Ingrese el nombre de la sonda: ');
	readln(s.nombre);
	writeln('Ingrese la duracion de la sonda en meses: ');
	readln(s.duracion);
	writeln('Ingrese el costo de construccion de la sonda: ');
	readln(s.costoc);
	writeln('Ingrese el costo de mantenimiento mensual de la sonda: ');
	readln(s.costom);
	writeln('Ingrese el rango de la sonda(del 1 al 7): ');
	readln(s.tipor);
end;

procedure agregarnodo (var L:lista;s:sonda);
var
	aux:lista;
begin
	new(aux);
	aux^.elem:=s;
	aux^.sig:=L;
	L:=aux;
end;

procedure generarlista (var l:lista;var dpromedio,cpromedio:real);
var
	s:sonda;
	cantidad:integer;
begin
	dpromedio:=0;cantidad:=0;cpromedio:=0;
	repeat
		leersonda(s);
		agregarnodo(l,s);
		dpromedio+= l^.elem.duracion;
		cantidad+=1;
		cpromedio+= l^.elem.costoc + (l^.elem.costom*l^.elem.duracion);
	until (s.nombre='Gaia');
	dpromedio/=cantidad;
	cpromedio/=cantidad;
end;

procedure imprimirrango(r:rango);
var
	i:integer;
begin
	for i:=1 to 7 do
		writeln('La cantidad de sondas con el rango numero ',i,' fue de: ',r[i]);
end;

procedure inicializar (var r: rango);
var
	i:integer;
begin
	for i:=1 to 7 do
		r[i]:=0;
end;

procedure maxsonda (s:sonda;var max:real;var nombremax:string);
var
	costototal:real;
begin
	costototal:=(s.costoc + (s.costom*s.duracion));
	if (costototal>max) then begin
		max:=costototal;
		nombremax:=s.nombre;
	end;
end;

procedure recorrerLista (l:lista;duracionp,costop:real);
var
	max:real;
	nombremax:string;
	r:rango;
	mayorduracion:integer;
begin
	max:=-1;mayorduracion:=0;
	inicializar(r);
	while (l<>nil) do begin
		maxsonda(l^.elem,max,nombremax);
		r[l^.elem.tipor]+=1;
		if (l^.elem.duracion>duracionp) then
			mayorduracion+=1;
		if (l^.elem.costoc>costop) then
			writeln('La sonda con nombre ',l^.elem.nombre,' tiene un costo de construccion mayor al costo promedio de todas las sondas.');
		l:=l^.sig;
	end;
	imprimirrango(r);
	writeln('El nombre de la sonda mas costosa es: ',nombremax);
	writeln('La cantidad de sondas cuya duracion supera al promedio de todas las sondas es de: ',mayorduracion);
end;

var
	l:lista;
	duracionP,costoP:real;
begin
	l:=nil;
	generarlista(l,duracionP,costoP);
	recorrerLista(l,duracionp,costop);
end.