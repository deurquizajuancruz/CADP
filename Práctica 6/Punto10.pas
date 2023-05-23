program Punto10Practica6;
type
	cliente = record
		dni:integer;
		numero:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:cliente;
		sig:lista;
	end;

procedure recibircliente (dni:integer;var L,ultimo:lista; var num:integer);
var
	aux:lista;
begin
	num+=1;
	new(aux);
	aux^.dato.dni:=dni;
	aux^.dato.numero:=num;
	aux^.sig:=nil;
	if (L=nil) then
		L:=aux
	else
		ultimo^.sig:=aux;
	ultimo:=aux;
end;

procedure atendercliente (var l:lista);
var
	aux:lista;
begin
	aux:=l;
	if (l<>nil) then begin
		writeln('El numero de cliente a ser atendido es: ',l^.dato.numero,' y su DNI es: ',l^.dato.dni);
		l:=l^.sig;
	end;
	dispose(aux);
end;

procedure cargarLista (var L:lista);
var
	num,dni:integer;
	ultimo:lista;
begin
	num:=0;
	writeln('Ingrese DNI del cliente: ');
	readln(dni);
	while (dni<>0) do begin
		recibircliente(dni,l,ultimo,num);
		writeln('Ingrese DNI del cliente: ');
		readln(dni);
	end;
end;

var
	l:lista;
begin
	l:=nil;
	cargarLista(l);
	while (l<>nil) do begin
		atendercliente(l);
	end;
end.
