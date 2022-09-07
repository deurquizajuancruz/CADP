program Parcial;
type
	subrangoclase=1..3;
	subrangovuelos=1..400;
	vvuelos=array [subrangovuelos] of real; //SE DISPONE EL VALOR DE VENTA.
	vventas=array [subrangovuelos] of real;
	ticket = record
	numero:integer;
	codigo:subrangovuelos;
	clase:subrangoclase;
	dni:integer;
end;
	lista=^nodo;
	nodo=record
	elem:ticket;
	sig:lista;
end;
procedure leerticket (var t:ticket);
begin
	writeln('Ingrese el numero de ticket: ');readln(t.numero);
	writeln('Ingrese el codigo de vuelo: ');readln(t.codigo);
	writeln('Ingrese la clase: ');readln(t.clase);
	writeln('Ingrese el dni del cliente: ');readln(t.dni);
end;
procedure agregaratras(var L:lista;t:ticket);
var
	nue,aux:lista;
begin
	new(nue);nue^.elem:=t;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		aux:=l;
		while(aux^.sig<>nil) do
			begin
			aux:=aux^.sig;
			end;
		aux^.sig:=nue;
		end;		
end;
procedure armarlista(var L:lista;T:ticket);
var
	nue,aux:lista;
begin
	new(nue);nue^.elem:=T;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		aux:=l;
		while (aux^.sig<>nil) do
			begin
			aux:=aux^.sig;
			end;
		aux^.sig:=nue;
		end;
end;
procedure armarlista(var L:lista);
var
	T:ticket;
begin
	repeat
		leerticket(t);
		agregaratras(L,t);
	until(t.codigo=11111);
end;
procedure maximos (codigovuelo:subrangovuelos;var maxvuelo1,maxvuelo2:subrangovuelos;var max1,max2:real;montovuelo:real);
begin
	if (montovuelo>max1) then
		begin
		max2:=max1;
		max1:=montovuelo;
		maxvuelo2:=maxvuelo1;
		maxvuelo1:=codigovuelo;
		end
	else
	if (montovuelo>max2) then
		begin
		max2:=montovuelo;
		maxvuelo2:=codigovuelo;
		end;
end;
procedure calcularmontos(L:lista;var v1:vventas;v2:vvuelos);
var
	i,maxvuelo1,maxvuelo2:subrangovuelos;
	max1,max2:real;
begin
	max1:=-100;max2:=-100;maxvuelo1:=1;maxvuelo2:=1;
	while (L<>nil) do
		begin
		v1[l^.elem.codigo]:=v1[l^.elem.codigo] + v2[l^.elem.codigo];
		L:=L^.sig;
		end;
	for i:=1 to 400 do begin
	maximos(i,maxvuelo1,maxvuelo2,max1,max2,v1[i]);
	end;
	writeln('El vuelo que genero el mayor monto fue: ',maxvuelo1);
	writeln('El segundo vuelo que genero el mayor monto fue: ',maxvuelo2);
end;
var
	L:lista;
	v1:vventas;
	v2:vvuelos;
begin
	L:=nil;
	armarlista(L);
	calcularmontos(L,v1,v2);
end.
