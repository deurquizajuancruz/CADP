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
	if (p.codigo<>-1) then begin
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

procedure cargarLista (var l:lista);
var
	p1:producto;
begin
	leerproducto(p1);
	while (p1.codigo<>-1) do begin
		agregarnodo(l,p1);
		leerproducto(p1);
	end;
end;

procedure minimos(precio:real;codigo:integer;var minuno,mindos:real; var codigouno,codigodos:integer);
begin
	if (precio<minuno) then begin
		mindos:=minuno;
		codigodos:=codigouno;
		minuno:=precio;
		codigouno:=codigo;
	end
	else if (precio<mindos) then begin
		mindos:=precio;
		codigodos:=codigo;
	end;
end;

function descomponer(codigo:integer):boolean;
var
	digito,par:integer;
begin
	descomponer:=false;
	par:=0;
	while (codigo<>0) do begin
		digito:= codigo mod 10;
		if (digito mod 2 = 0) then
			par+=1;
		codigo:= codigo div 10;
	end;
	if (par>=3) then
		descomponer:=true;
end;

procedure recorrerLista (l:lista);
var
	contador,codigouno,codigodos,cantidad:integer;
	minuno,mindos:real;
begin
	contador:=0;
	cantidad:=0;
	minuno:=32760;
	mindos:=32760;
	while (l<>nil) do begin
		cantidad+=1;
		if (descomponer(l^.info.codigo)) then
			writeln('El producto con la descripcion: ',l^.info.descripcion,' tiene un codigo de por lo menos 3 digitos pares.');
		if (l^.info.stocka<l^.info.stockm) then
			contador:= contador + 1;
		minimos(l^.info.precio,l^.info.codigo,minuno,mindos,codigouno,codigodos);
		l:=l^.sig;
	end;
	writeln('El porcentaje de los productos con stock actual por debajo de su stock minimo es: ',(100/cantidad * contador):4:2,'%');
	writeln('El codigo del producto mas economico es: ',codigouno,' y el codigo del segundo producto mas economico es: ',codigodos);
end;

var
	L:lista;
begin
	L:=nil;
	cargarLista(L);
	recorrerLista(L);
end.
