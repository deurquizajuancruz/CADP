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

procedure leerinfo (var a:alumno);
begin
	writeln('Ingrese el numero del alumno: ');
	readln(a.numeroa);
	if (a.numeroa<>0) then begin
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
    while(act<>nil) and (act^.estudiante.promedio>a.promedio) do begin
        ant:=act;
        act:=act^.sig;
    end; 
    if(ant=act)then
       l:=nue
    else
       ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure cargarEgresados (var l:lista);
var
	a:alumno;
begin
	leerinfo(a);
	while (a.numeroa<>0) do begin
		insertarOrdenado(l,a);
		leerinfo(a);
	end;
end;

procedure imprimir (l:lista);
var
	i:integer;
begin
	i:=0;
	while (l<>nil) and (i<10) do begin
		writeln('Alumno', l^.estudiante.apellido, ' numero ',l^.estudiante.numeroa,' promedio: ',l^.estudiante.promedio:0:2);
		l:=l^.sig;
		i+=1;
	end;
end;

var
	l:lista;
begin
	l:=nil;
	cargarEgresados(l);
	imprimir(l);
end.
