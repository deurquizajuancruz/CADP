program Punto11Practica6;
type
	alumno=record
	numeroa:integer;
	apellido:string;
	promedio:real;
end;
	lista=^nodo;
	nodo=record
	estudiante:alumno;
	sig:lista;
end;
	vectormejores=array[1..10] of alumno;
procedure leerinfo (var a:alumno);
begin
	writeln('Ingrese el numero del alumno: ');
	readln(a.numeroa);
	if (a.numeroa<>0) then
		begin
		writeln('Ingrese el apellido del alumno: ');
		readln(a.apellido);
		writeln('Ingrese el promedio del alumno: ');
		readln(a.promedio);
		end;
end;
procedure insertarOrdenado(var l:lista; a:alumno);
 var
   ant,act,nue:lista;
 begin
    new(nue);
    nue^.estudiante:=a;
    ant:=l;
    act:=l;
    while((act<>nil)and (act^.estudiante.promedio>a.promedio))do begin
        ant:=act;
        act:=act^.sig;
    end; 
    if(ant=act)then
       l:=nue
    else
       ant^.sig:=nue;
    nue^.sig:=act;
 end;
procedure cargaregresados (var l:lista);
var
	a:alumno;
begin
	leerinfo(a);
	while (a.numeroa<>0) do
		begin
		insertarOrdenado(l,a);
		leerinfo(a);
		end;
end;
procedure cargarvector (l:lista; var v:vectormejores);
var
	i:integer;
begin
	for i:= 1 to 10 do
	begin
	v[i]:=l^.estudiante;
	l:=l^.sig;
	end;
end;
procedure imprimir (v:vectormejores);
var
	i:integer;
begin
	for i:=1 to 10 do
		begin
		writeln('El alumno con apellido ',v[i].apellido, ' y numero ',v[i].numeroa,' recibira el premio');
		end;
end;
var
	l:lista;
	v:vectormejores;
begin
	l:=nil;
	cargaregresados(l);
	cargarvector(l,v);
	imprimir(v);
end.
