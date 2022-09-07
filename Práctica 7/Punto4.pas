program Punto4Practica7;
type
	subrangoembarazo=1..42;
	vsemanas=array[subrangoembarazo] of real;
	embarazada=record
	nya:string;
	peso:vsemanas;
end;
	lista=^nodo;
	nodo=record
	elem:embarazada;
	sig:lista;
end;
// procedure cargarlista (var l:lista); SE DISPONE
procedure maximos (aumento:real;semana:subrangoembarazo;var max1:real;var maxsemana:subrangoembarazo);
begin
	if (aumento>max1) then
		begin
		max1:=aumento;
		maxsemana:=semana;
		end;
end;
procedure recorrerlista (l:lista);
var
	max1,aumentototal:real;
	i,maxsemana:subrangoembarazo;
begin
	while (l<>nil) do
		begin
		aumentototal:=0;maxsemana:=1;max1:=-100;
		for i:=2 to 42 do
			begin
			aumentototal:=aumentototal + (l^.elem.peso[i] - l^.elem.peso[i-1]);
			maximos((l^.elem.peso[i]-l^.elem.peso[i-1]),i,max1,maxsemana);
			end;
		writeln('El aumento total fue de: ',aumentototal:4:2);
		writeln('La semana donde hubo mas aumento fue: ',maxsemana);
		l:=l^.sig;
		end;
end;
var
	l:lista;
begin
	l:=nil;
//	cargarlista(l);
	recorrerlista(l);
end.
