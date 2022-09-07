program Punto2Practica7;
type
	subrangopoliza=1..6;
	cliente=record
	codigo:integer;
	dni:integer;
	apellido:string;
	nombre:string;
	codigopoliza:subrangopoliza;
	montomensual:real;
end;
	lista=^nodo;
	nodo=record
	elem:cliente;
	sig:lista;
end;
//	vprecios=array[subrangopoliza] of real; SE DISPONE
procedure leerinfo (var c:cliente);
begin
	writeln('Ingrese el codigo del cliente: ');
	readln(c.codigo);
	writeln('Ingrese el dni del cliente: ');
	readln(c.dni);
	writeln('Ingrese el apellido del cliente: ');
	readln(c.apellido);
	writeln('Ingrese el nombre del cliente: ');
	readln(c.nombre);
	writeln('Ingrese el codigo de poliza del cliente(1 al 6): ');
	readln(c.codigopoliza);
	writeln('Ingrese el monto mensual a pagar del cliente: ');
	readln(c.montomensual);
end;
procedure agregaradelante (var l:lista; c:cliente);
var
	nue:lista;
begin
	new(nue);nue^.elem:=c;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		nue^.sig:=l;
		l:=nue;
		end;
end;
procedure cargarlista(var l:lista);
var
	c:cliente;
begin
	repeat
		leerinfo(c);
		agregaradelante(l,c);
	until (c.codigo=1122);
end;
function descomponer (dni:integer):boolean;
var
	nueve,aux:integer;
begin
	nueve:=0;
	while (dni<>0) do 
		begin
		aux:=dni mod 10;
		if (aux=9) then
			nueve:=nueve +1;
		dni:= dni div 10;
		end;
	if (nueve>=2) then
		descomponer:=true
	else
		descomponer:=false;
end;
procedure recorrerlista(l:lista);//v:vprecios); SE DISPONE
{var
	montototal:real;}
begin
	while (l<>nil) do
		begin
		if (descomponer(l^.elem.dni)=true) then
			writeln('El cliente con nombre: ',l^.elem.nombre,' y apellido: ',l^.elem.apellido,' tiene un dni con al menos 2 nueves.');
	//	montototal:=(l^.elem.montomensual + v[l^.elem.codigopoliza]); SE DISPONE
	//	writeln('El cliente con dni ',l^.elem.dni,' ,apellido ',l^.elem.apellido,' y nombre ',l^.elem.nombre,' tiene que pagar: ',montototal); SE DISPONE
		l:=l^.sig;
		end;
end;
// procedure definirprecios (var v:vprecios); SE DISPONE
procedure eliminarcodigo (var l:lista;var ok:boolean;codigoeliminar:integer);
var
	act,ant:lista;
begin
	ok:=false;act:=l;
	while (act<>nil) and (act^.elem.codigo<>codigoeliminar) do
		begin
		ant:=act;act:=act^.sig;
		end;
	if (act<>nil) then
		begin
		ok:=true;
		if (act=ant) then
			l:=l^.sig
		else
			ant:=act^.sig;
		dispose(l);
		end;
end;
var
	l:lista;
//	v:vprecios; SE DISPONE
	ok:boolean;
	codigoeliminar:integer;
begin
	l:=nil;
//	definirprecios(v); SE DISPONE
	cargarlista(l);
	recorrerlista(l);//v);
	writeln('Ingrese el codigo a eliminar: ');
	readln(codigoeliminar);
	eliminarcodigo(l,ok,codigoeliminar);
	if (ok=true) then
		writeln('El codigo de cliente fue eliminado correctamente.');
end.
