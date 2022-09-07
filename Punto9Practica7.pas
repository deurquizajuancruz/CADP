program Punto9Practica7;
type
	subrango=1..7;
	pelicula=record
	codigo:integer;
	titulo:string;
	genero:subrango;
	puntajepromedio:real;
end;
	critico=record
	dni:longint;
	nya:string;
	codigopelicula:integer;
	puntaje:real;
end;
	lista=^nodo;
	nodo=record
	elem:pelicula;
	sig:lista;
end;
	vgeneros=array[subrango] of real;
//procedure cargarlistapelicula(var l:lista); SE DISPONE
procedure inicializar(var v:vgeneros);
var
	i:subrango;
begin
	for i:=1 to 7 do
		v[i]:=0;
end;
procedure leerinfocritico(var c:critico);
begin
	writeln('Ingrese el codigo de pelicula: ');
	readln(c.codigopelicula);
	if (c.codigopelicula<>-1) then
		begin
		writeln('Ingrese el dni del critico: ');readln(c.dni);
		writeln('Ingrese el nombre y apellido del critico: ');readln(c.nya);
		writeln('Ingrese el puntaje otorgado de este critico a la pelicula: ');readln(c.puntaje);
		end;
end;
function mismos(dni:longint):boolean;
var
	aux,pares,impares:integer;
begin
	aux:=0;pares:=0;impares:=0;
	while(dni<>0) do
		begin
		aux:=(dni mod 10);
		if (aux div 2=0) then
			pares:=pares +1
		else
			impares:=impares +1;
		dni:=dni div 10;
		end;
	if (pares=impares) then
		mismos:=true
	else
		mismos:=false;
end;
procedure actualizarlista (var l:lista);
var
	puntaje:real;
	auxcodigo,cantidad:integer;
	c:critico;
	aux:lista;
begin
	leerinfocritico(c);
	while (c.codigopelicula<>-1) do
		begin
		auxcodigo:=c.codigopelicula;cantidad:=0;puntaje:=0;
		while(c.codigopelicula<>-1) and (auxcodigo=c.codigopelicula) do
			begin
			cantidad:=cantidad+1;puntaje:=puntaje + c.puntaje;
			if (mismos(c.dni)=true) then
				writeln('El critico ',c.nya,' tiene la misma cantidad de digitos pares que impares en su dni.');
			leerinfocritico(c);
			end;
			aux:=l;
			while (l^.elem.codigo<>c.codigopelicula) do
				begin
				aux:=aux^.sig;
				end;
		aux^.elem.puntajepromedio:=(puntaje/cantidad);
		end;
end;
procedure maximos (var max1:real;puntaje:real;var maxgenero:subrango;genero:subrango);
begin
	if (puntaje>max1) then
		begin
		max1:=puntaje;
		maxgenero:=genero;
		end;
end;
procedure recorrerlista(l:lista;var v:vgeneros);
var
	max1:real;
	maxgenero,i:subrango;
begin
	max1:=-100;
	while (l<>nil) do
		begin
		v[l^.elem.genero]:=v[l^.elem.genero]+l^.elem.puntajepromedio;
		l:=l^.sig;
		end;
	for i:=1 to 7 do
		maximos(max1,v[i],maxgenero,i);
	writeln('El genero que mas puntaje obtuvo entre todas las criticas es: ',maxgenero);
end;
procedure eliminarcodigo(var l:lista;codigoeliminar:integer);
var
	act,ant:lista;
begin
	act:=l;
	while (act<>nil) and (act^.elem.codigo<>codigoeliminar) do
		begin
		ant:=act;act:=act^.sig;
		end;
	if (act<>nil) then
		begin
		if (act=l) then
			l:=l^.sig
		else
			ant:=act^.sig;
		dispose(act);
		end;
end;
var
	l:lista;
	v:vgeneros;
	codigoeliminar:integer;
begin
	l:=nil;
//	cargarlista(l); SE DISPONE
	inicializar(v);
	actualizarlista(l);
	recorrerlista(l,v);
	writeln('Ingrese el codigo de la pelicula a eliminar: ');
	readln(codigoeliminar);
	eliminarcodigo(l,codigoeliminar);
end.
