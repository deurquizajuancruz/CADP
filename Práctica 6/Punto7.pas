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
function cumple(l:lista):boolean;
var
	aux:boolean;
begin
	if ((l^.elem.costom*l^.elem.duracion)<l^.elem.costoc) and (l^.elem.tipor<>1) then
		aux:=true
	else
		aux:=false;
	cumple:=aux;
end;

procedure crearlista (var L:lista;s:sonda);
var
	aux:lista;
begin
	new(aux);
	aux^.elem:=s;
	aux^.sig:=L;
	L:=aux;
end;

procedure costonocumple (l:lista;var cantidad:integer);
begin
	cantidad:=cantidad +1;
	writeln('La cantidad de sondas que no van a ser financiadas es de: ',cantidad);
end;


procedure recorrer (l:lista;var listacumple,listanocumple:lista);
var
	cantidad:integer;
	costono,costotal:real;
begin
	cantidad:=0;costono:=0;costotal:=0;
	while (l<>nil) do
		begin
		if (cumple(l)=true) then
			begin
			writeln('La sonda ',l^.elem.nombre,' espacial cumple con los requisitos de H2020');
			crearlista(listacumple,l^.elem);
			end
			else
			begin
			writeln('La sonda ',l^.elem.nombre,' espacial no cumple con los requisitos de H2020');
			crearlista(listanocumple,l^.elem);
			costonocumple(listanocumple,cantidad);
			costono:=(l^.elem.costoc + (l^.elem.costom * l^.elem.duracion));
			costotal:=costotal + costono;
			writeln('El costo total de las sondas que no van a ser financiadas es de: ',costotal:4:2);
			end;
		l:=l^.sig;
		end;
end;
var
	l,listacumple,listanocumple:lista;
begin
	l:=nil;listacumple:=nil;listanocumple:=nil;
	generarlista(l);
	recorrer(l,listacumple,listanocumple);
end.
