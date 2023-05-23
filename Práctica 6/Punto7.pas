program Punto7Practica6;
type
	sonda = record
		nombre:string;
		duracion:real;
		costoc:real;
		costom:real;
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

procedure generarlista (var l:lista);
var
	s:sonda;
begin
	repeat
		leersonda(s);
		agregarnodo(l,s);
	until (s.nombre='Gaia');
end;

function cumple(s:sonda):boolean;
begin
	if ((s.costom*s.duracion)<s.costoc) and (s.tipor>1) then
		cumple:=true
	else
		cumple:=false;
end;

procedure recorrer (l:lista;var listacumple,listanocumple:lista);
var
	cantidad:integer;
	costoTotal:real;
begin
	cantidad:=0;costoTotal:=0;
	while (l<>nil) do begin
		if (cumple(l^.elem)) then begin
			agregarnodo(listacumple,l^.elem);
			end
			else begin
				agregarnodo(listanocumple,l^.elem);
				cantidad+=1;
				costoTotal+=(l^.elem.costoc + (l^.elem.costom * l^.elem.duracion));
			end;
		l:=l^.sig;
	end;
	writeln('La cantidad de sondas que no van a ser financiadas es de: ',cantidad);
	writeln('El costo total de las sondas que no van a ser financiadas es de: ',costoTotal:4:2);
end;

var
	l,listacumple,listanocumple:lista;
begin
	l:=nil;listacumple:=nil;listanocumple:=nil;
	generarlista(l);
	recorrer(l,listacumple,listanocumple);
end.
