program Punto1Practica7;
type
	subrangogeneros=1..5;
	persona = record
	dni:longint;
	nya:string;
	edad:integer;
	codigogenero:subrangogeneros;
end;
	lista=^nodo;
	nodo=record
	elem:persona;
	sig:lista;
end;
	vgenero=array[subrangogeneros] of integer;
procedure leerinfo(var p:persona);
begin
	writeln('Ingrese el dni: ');
	readln(p.dni);
	writeln('Ingrese el nombre y apellido: ');
	readln(p.nya);
	writeln('Ingrese la edad: ');
	readln(p.edad);
	writeln('Ingrese el codigo del genero preferido: ');
	readln(p.codigogenero);
end;
procedure agregaradelante (var l:lista;p:persona);
var
	nue:lista;
begin
	new(nue);nue^.elem:=p;nue^.sig:=nil;
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
	p:persona;
begin
	repeat
		leerinfo(p);
		agregaradelante(l,p);
	until (p.dni=33555444);
end;
procedure inicializar (var v:vgenero);
var
	i:subrangogeneros;
begin
	for i:=1 to 5 do
		v[i]:=0;
end;
function digitospares (dni:integer):boolean;
var
	aux,pares,impares:integer;
begin
	pares:=0;impares:=0;
	while (dni<>0) do
		begin
		aux:=dni mod 10;
		if (aux mod 2=0) then
			pares:=pares+1
		else
			impares:=impares+1;
		dni:=dni div 10;
		end;
	if (pares>impares) then
		digitospares:=true
	else
		digitospares:=false;
end;
procedure maximos (var maxgenero1,maxgenero2,max1,max2:integer; genero,cantidad:integer);
begin
	if (cantidad>max1) then
		begin
		max2:=max1;
		max1:=cantidad;
		maxgenero2:=maxgenero1;
		maxgenero1:=genero;
		end
	else
	if (cantidad>max2) then
		begin
		max2:=cantidad;
		maxgenero2:=genero;
		end;
end;
procedure recorrerlista (l:lista; var v:vgenero);
var
	max1,max2,maspares,maxgenero1,maxgenero2:integer;
	i:subrangogeneros;
begin
	max1:=-100;max2:=-100;maspares:=0;maxgenero1:=0;maxgenero2:=0;
	while (l<>nil) do
		begin
		if (digitospares(l^.elem.dni)=true) then
			maspares:=maspares +1;
		v[l^.elem.codigogenero]:=v[l^.elem.codigogenero] +1;
		l:=l^.sig;
		end;
	for i:= 1 to 5 do
		maximos(maxgenero1,maxgenero2,max1,max2,i,v[i]);
	writeln('La cantidad de dni con mas digitos pares que digitos impares es de: ',maspares);
	writeln('El codigo de genero mas elegido fue: ',maxgenero1,' .El segundo codigo de genero mas elegido fue: ',maxgenero2);
end;
procedure eliminardni(var l:lista;dni:integer;var ok:boolean);
var
	act,ant:lista;
begin
	act:=l; ant:=l;ok:=false;
	while (act<>nil) and (act^.elem.dni<>dni) do
		begin
		ant:=act;act:=act^.sig;
		end;
	if (act<>nil) then
		begin
		ok:=true;
		if (act=l) then
			l:=l^.sig
		else
			ant:=act^.sig;
		dispose(act);
		end;
end;
var
	l:lista;
	v:vgenero;
	dnieliminar:integer;
	ok:boolean;
begin
	l:=nil;
	inicializar(v);
	cargarlista(l);
	recorrerlista(l,v);
	writeln('Ingrese el dni a eliminar: ');
	readln(dnieliminar);
	eliminardni(l,dnieliminar,ok);
	if (ok=true) then
		writeln('El dni se encontraba en la lista y fue eliminado correctamente.')
	else
		writeln('El dni no se encontraba en la lista.');
end.
