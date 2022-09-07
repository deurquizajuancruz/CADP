program Punto11Practica7;
type
	subrangotipo=1..5;
	subrangoevento=1..100;
	evento=record
	nombre:string;
	tipo:subrangotipo;
	lugar:string;
	maximapersonas:integer;
	costo:real;
end;
	vevento=array[subrangoevento]of evento;
	venta=record
	codigo:integer;
	numeroevento:subrangoevento;
	dni:integer;
	cantidadentradas:integer;
end;
	lista=^nodo;
	nodo=record
	elem:venta;
	sig:lista;
end;
//procedure cargarvector SE DISPONE
procedure leerinfo(var v:venta);
begin
	writeln('Ingrese el codigo de venta: ');readln(v.codigo);
	if (v.codigo<>-1) then
		begin
		writeln('Ingrese el numero del evento: ');readln(v.numeroevento);
		writeln('Ingrese el dni del comprador: ');readln(v.dni);
		writeln('Ingrese la cantidad de entrada que fueron vendidas: ');readln(v.cantidadentradas);
		end;
end;
procedure insertarordenado(var l:lista;v:venta);
var
	act,ant,nue:lista;
begin
	new(nue);nue^.elem:=v;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		act:=l;ant:=l;
		while (act<>nil) and (act^.elem.numeroevento<v.numeroevento) do
			ant:=act;act:=act^.sig;
		end;
		if (ant=act) then
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act
end;
procedure armarlista(var l:lista);
var
	v:venta;
begin
	leerinfo(v);
	while (v.codigo<>-1) do
		begin
		insertarordenado(l,v);
		leerinfo(v);
		end;
end;
procedure minimos(var minnombre1,minnombre2,minlugar1,minlugar2:string;lugar,nombre:string;recaudacion:real;var min1,min2:real);
begin
	if (recaudacion<min1) then
		begin
		min2:=min1;
		min1:=recaudacion;
		minnombre2:=minnombre1;
		minnombre1:=nombre;
		minlugar2:=minlugar1;
		minlugar1:=lugar;
		end
	else
	if (recaudacion<min2) then
		begin
		min2:=recaudacion;
		minnombre2:=nombre;
		minlugar2:=lugar;
		end;
end;
function maspares(dni:integer):boolean;
var
	aux,pares,impares:integer;
begin
	aux:=0;pares:=0;impares:=0;
	while (dni<>0) do
		begin
		aux:=(dni mod 10);
		if (aux mod 2=0) then
			pares:=pares +1
		else
			impares:=impares +1;
		dni:=dni div 10;
		end;
	if (pares>impares) then
		maspares:=true
	else
		maspares:=false;
end;
procedure recorrerlista(l:lista;v:vevento);
var
	minnombre1,minnombre2,minlugar1,minlugar2:string;
	min1,min2:real;
	auxnumeroevento:subrangoevento;
	recaudacionxevento:real;
	condiciones,entradasvendidasxevento:integer;
begin
	min1:=32767;min2:=32767;condiciones:=0;
	while (l<>nil) do
		begin
		if (maspares(l^.elem.dni)=true) and (v[l^.elem.numeroevento].tipo=3) then
			condiciones:=condiciones + l^.elem.cantidadentradas;
		auxnumeroevento:=l^.elem.numeroevento;recaudacionxevento:=0;entradasvendidasxevento:=0;
		while (l<>nil) and (auxnumeroevento=l^.elem.numeroevento) do
			begin
			recaudacionxevento:=recaudacionxevento + (v[l^.elem.numeroevento].costo*l^.elem.cantidadentradas);entradasvendidasxevento:=entradasvendidasxevento+l^.elem.cantidadentradas;l:=l^.sig;
			if (l^.elem.numeroevento=50) and (entradasvendidasxevento>=v[50].maximapersonas) then
				writeln('La cantidad de entradas vendidas para el evento numero 50 alcanzo la maxima de personas permitida.')
			else
				writeln('La cantidad de entradas vendidas para el evento numero 50 no alcanzo la maxima de personas permitida.');
			end;
		minimos(minnombre1,minnombre2,minlugar1,minlugar2,v[l^.elem.numeroevento].lugar,v[l^.elem.numeroevento].nombre,recaudacionxevento,min1,min2);
		end;
	writeln('La cantidad de entradas vendidas cuyo comprador tiene en su dni mas digitos pares que impares y son obras de teatro fueron: ',condiciones);
	writeln('El evento con nombre: ',minnombre1,' con lugar en: ',minlugar1,' es el evento que ha tenido menos recaudacion.El evento con nombre: ',minnombre2,' con lugar en: ',minlugar2,' es el segundo evento que ha tenido menos recaudacion.');
end;
var
	l:lista;
	v:vevento;
begin
	l:=nil;
//	cargarvector SE DISPONE
	armarlista(l);
	recorrerlista(l,v);
end.
