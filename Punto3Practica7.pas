program Punto3Practica7;
type
	viaje=record
	nroviaje:integer;
	codigoauto:integer;
	origen:string;
	destino:string;
	kmrecorridos:real;
end;
	lista=^nodo;
	nodo=record
	elem:viaje;
	sig:lista;
end;
// procedure cargarlistaordenada SE DISPONE
procedure maximos(kmrecorridos:real;codigoauto:integer;var max1,max2:real;var maxcodigo1,maxcodigo2:integer);
begin
	if (kmrecorridos>max1) then
		begin
		max2:=max1;
		max1:=kmrecorridos;
		maxcodigo2:=maxcodigo1;
		maxcodigo1:=codigoauto;
		end
	else
	if (kmrecorridos>max2) then
		begin
		max2:=kmrecorridos;
		maxcodigo2:=codigoauto;
		end;
end;
procedure insertarordenado(var l:lista; v:viaje);
var
	ant,act,nue:lista;
begin
	new(nue);nue^.elem:=v;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		act:=l;ant:=l;
		while (act<>nil) and (act^.elem.codigoauto<v.codigoauto) do
			begin
			ant:=act;act:=act^.sig;
			end;
		if (ant=act) then
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
		end;
end;
procedure recorrerlista(l:lista;var l2:lista);
var
	aux:lista;
	max1,max2,kmrecorridosmismocodigo:real;
	maxcodigo1,maxcodigo2,mismocodigoauto:integer;
begin
	max1:=-100;max2:=-100;maxcodigo1:=0;maxcodigo2:=0;
	while (l<>nil) do
		begin
		if (l^.elem.kmrecorridos>5) then
			insertarordenado(l2,l^.elem);
		kmrecorridosmismocodigo:=0;aux:=l;mismocodigoauto:=l^.elem.codigoauto;
		while (aux<>nil) and (mismocodigoauto=l^.elem.codigoauto) do
			begin
			kmrecorridosmismocodigo:=kmrecorridosmismocodigo + l^.elem.kmrecorridos;aux:=aux^.sig;
			end;
		maximos(kmrecorridosmismocodigo,mismocodigoauto,max1,max2,maxcodigo1,maxcodigo2);
		l:=l^.sig;
		end;
	writeln('El codigo del auto con mas km recorridos es: ',maxcodigo1,' y el codigo del segundo auto es: ',maxcodigo2);
end;
var
	l,l2:lista;
begin
	l:=nil;l2:=nil;
//	cargarlistaordenada(l); SE DISPONE
	recorrerlista(l,l2);
end.
