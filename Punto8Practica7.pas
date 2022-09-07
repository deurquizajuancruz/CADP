program Punto8Practica7;
type
	subrango=1..7;
	transferencia=record
	nroorigen:integer;
	dniorigen:longint;
	nrodestino:integer;
	dnidestino:longint;
	fecha:string;
	hora:real;
	monto:real;
	motivo:subrango;
end;
	vmotivo=array[subrango] of integer;
	lista=^nodo;
	nodo=record
	elem:transferencia;
	sig:lista;
end;
// procedure cargarlista (var l:lista); SE DISPONE
procedure inicializar (var v:vmotivo);
var
	i:subrango;
begin
	for i:=1 to 7 do
		v[i]:=0;
end;
procedure insertarordenado (var l2:lista;t:transferencia);
var
	nue,act,ant:lista;
begin
	new(nue);nue^.elem:=t;nue^.sig:=nil;
	if (l2=nil) then
		l2:=nue
	else
		begin
		act:=l2;ant:=l2;
		while (act<>nil) and (act^.elem.nroorigen<t.nroorigen) do
			begin
			ant:=act;act:=act^.sig;
			end;
		if (ant=act) then
			l2:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
		end;
end;
procedure cargarlista2(l:lista;var l2:lista);
begin
	while (l<>nil) do
		begin
		if (l^.elem.dniorigen<>l^.elem.dnidestino) then
			insertarordenado(l2,l^.elem);
		l:=l^.sig;
		end;
end;
function menospares(nrodestino:integer):boolean;
var
	aux,pares,impares:integer;
begin
	aux:=0;pares:=0;impares:=0;
	while (nrodestino<>0) do
		begin
		aux:=(nrodestino mod 10);
		if (aux mod 2=0) then
			pares:=pares +1
		else
			impares:=impares+1;
		nrodestino:=nrodestino div 10;
		end;
	if (impares>pares) then
		menospares:=true
	else
		menospares:=false;
end;
procedure maximo(cantidadmotivos,motivo:integer;var max1,maxmotivo:integer);
begin
	if (cantidadmotivos>max1) then
		begin
		max1:=cantidadmotivos;
		maxmotivo:=motivo;
		end;
end;
procedure recorrerlista(l2:lista;var v:vmotivo);
var
	montototal:real;
	aux:lista;
	max1,maxmotivo,junioimpares,auxcuentaorigen:integer;
	i:subrango;
begin
	junioimpares:=0;max1:=-100;maxmotivo:=0;
	while (l2<>nil) do
		begin
		aux:=l2;auxcuentaorigen:=l2^.elem.nroorigen;montototal:=0;
		while (aux<>nil) and (auxcuentaorigen=l2^.elem.nroorigen) do
			begin
			if (aux^.elem.fecha='Junio') and (menospares(aux^.elem.nrodestino)=true) then
				junioimpares:=junioimpares +1;
			montototal:=montototal + aux^.elem.monto;
			v[aux^.elem.motivo]:=v[aux^.elem.motivo] +1;
			aux:=aux^.sig;
			end;
		writeln('El monto total transferido a terceros de la cuenta de origen ',auxcuentaorigen,' es de: ',montototal:4:2);
		l2:=l2^.sig;
		end;
	for i:=1 to 7 do
		maximo(v[i],i,max1,maxmotivo);
	writeln('El motivo que mas transferencias a terceras tuvo fue: ',maxmotivo);
	writeln('La cantidad de transferencias realizadas a terceros en Junio en las cuales el numero de destino posee menos digitos pares que impares es de: ',junioimpares);
end;
var
	l,l2:lista;
	v:vmotivo;
begin
	l:=nil;l2:=nil;
//  cargarlista(l); SE DISPONE
	inicializar(v);
	cargarlista2(l,l2);
	recorrerlista(l2,v);
end.
