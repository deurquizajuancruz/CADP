program Punto5Practica6;
type
	producto = record
	codigo:integer;
	descripcion:string;
	stocka:integer;
	stockm:integer;
	precio:real;
end;
	lista=^nodo;
	nodo = record
	info:producto;
	sig:lista;
end;
procedure leerproducto (var p:producto);
begin
	writeln('Ingrese el codigo del producto: ');
	readln(p.codigo);
	if (p.codigo<>-1) then
		begin
			writeln('Ingrese la descripcion del producto: ');
			readln(p.descripcion);
			writeln('Ingrese el stock actual del producto: ');
			readln(p.stocka);
			writeln('Ingrese el stock minimo del producto: ');
			readln(p.stockm);
			writeln('Ingrese el precio del producto: ');
			readln(p.precio);
		end;
end;
procedure agregarnodo(var L:lista;p:producto);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.info:=p;
	nuevo^.sig:=l;
	l:=nuevo;
end;
procedure cargarLista (var l:lista;var cantidadt:integer);
var
	p1:producto;
begin
	leerproducto(p1);
	while (p1.codigo<>-1) do
		begin
		agregarnodo(l,p1);
		cantidadt:=cantidadt +1;
		leerproducto(p1);
		end;
end;
procedure minimos(precio:real;codigo:integer;var minuno,mindos:real; var codigouno,codigodos:integer);
begin
	if (precio<minuno) then
		begin
		mindos:=minuno;
		minuno:=precio;
		codigodos:=codigouno;
		codigouno:=codigo;
		end
	else
	if (precio<mindos) then
		begin
		mindos:=precio;
		codigodos:=codigo;
		end;
end;
procedure debajo(l:lista;var contador:integer);
begin
	if (l^.info.stocka<l^.info.stockm) then
		contador:= contador + 1;
end;
procedure descomponer (l:lista;var cantidadp:integer);
var
	aux,digitopar,auxcod:integer;
begin
	digitopar:=0;cantidadp:=0;auxcod:=l^.info.codigo;
	while (auxcod<>0) do
	begin
		aux:=auxcod mod 10;
		if (aux mod 2=0) then
			digitopar:= digitopar + 1;
		auxcod:=auxcod div 10;
	end;
	if (digitopar>=3) then
		cantidadp:=cantidadp +1;
end;
procedure recorrerLista (l:lista;ct:integer);
var
	contador,codigouno,codigodos,cantidadpares:integer;
	porcentaje,minuno,mindos:real;
begin
	contador:=0;minuno:=9999;mindos:=9999;cantidadpares:=0;
	while (l<>nil) do
		begin
		descomponer(l,cantidadpares);
		if (cantidadpares>0) then
			writeln('El producto con la descripcion: ',l^.info.descripcion,' tiene un codigo de por lo menos 3 digitos pares.');
		debajo(l,contador);
		minimos(l^.info.precio,l^.info.codigo,minuno,mindos,codigouno,codigodos);
		l:=l^.sig;
		end;
	porcentaje:=((contador/ct)*100);
	writeln('El porcentaje de los productos con stock actual por debajo de su stock minimo es: ',porcentaje:4:2,'%');
	writeln('El codigo del producto mas economico es: ',codigouno,' y el codigo del segundo producto mas economico es: ',codigodos);
end;
var
	L:lista;
	ct:integer;
begin
	L:=nil;ct:=0;
	cargarLista(L,ct);
	recorrerLista(L,ct);
end.
