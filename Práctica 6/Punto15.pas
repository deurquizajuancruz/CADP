program Punto15Practica6;
type
	alumno=record
	dni:integer;
	apellido:string;
	nombre:string;
	nota:real;
end;
	lista=^nodo;
	nodo=record
	elem:alumno;
	sig:lista;
end;
	vcontador=array[1..5] of integer;
procedure inicializar (var v:vcontador);
var
	i:integer;
begin
	for i:=1 to 5 do
		v[i]:=0;
end;
procedure agregar (var l:lista;a:alumno);
var
	nue:lista;
begin
	new(nue);nue^.elem:=a;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		nue^.sig:=l;
		l:=nue;
		end;
end;
//procedure cargarlista SE DISPONE
procedure agregaralumnos (var v:vcontador;l:lista;var lista1,lista2,lista3,lista4,lista5:lista);
begin
	while (l<>nil) do
		begin
			if (l^.elem.nota>=8) then
				begin
				if (v[1]>v[4]) then
					begin
					agregar(lista4,l^.elem);
					v[4]:=v[4]+1;
					end
				else
				if (v[1]=v[4]) then
					begin
					agregar(lista1,l^.elem);
					v[1]:=v[1]+1;
					end;
				end;
			if (l^.elem.nota>=5) and (l^.elem.nota<8) then
				begin
				if (v[2]>v[3]) and (v[2]>v[5]) then
					begin
					agregar(lista3,l^.elem);
					v[3]:=v[3]+1;
					end
				else
				if (v[3]>v[5]) then
					begin
					agregar(lista5,l^.elem);
					v[5]:=v[5]+1;
					end
				else
				if (v[2]=v[3]) and (v[3]=v[5]) then
					begin
					agregar(lista2,l^.elem);
					v[2]:=v[2]+1;
					end;
				end;
			l:=l^.sig;
		end;
end;
procedure imprimir (lista1,lista2,lista3,lista4,lista5:lista);
begin
	while (lista1<>nil) do
	begin
		writeln('El alumno con dni: ',lista1^.elem.dni,' apellido: ',lista1^.elem.apellido,' nombre: ',lista1^.elem.nombre,' y nota: ',lista1^.elem.nota,' esta en la lista 1.');
		lista1:=lista1^.sig;
	end;
	while (lista2<>nil) do
	begin
		writeln('El alumno con dni: ',lista2^.elem.dni,' apellido: ',lista2^.elem.apellido,' nombre: ',lista2^.elem.nombre,' y nota: ',lista2^.elem.nota,' esta en la lista 2.');
		lista2:=lista2^.sig;
	end;
	while (lista3<>nil) do
	begin
		writeln('El alumno con dni: ',lista3^.elem.dni,' apellido: ',lista3^.elem.apellido,' nombre: ',lista3^.elem.nombre,' y nota: ',lista3^.elem.nota,' esta en la lista 3.');
		lista3:=lista3^.sig;
	end;
	while (lista4<>nil) do
	begin
		writeln('El alumno con dni: ',lista4^.elem.dni,' apellido: ',lista4^.elem.apellido,' nombre: ',lista4^.elem.nombre,' y nota: ',lista4^.elem.nota,' esta en la lista 4.');
		lista4:=lista4^.sig;
	end;
	while (lista5<>nil) do
	begin
		writeln('El alumno con dni: ',lista5^.elem.dni,' apellido: ',lista5^.elem.apellido,' nombre: ',lista5^.elem.nombre,' y nota: ',lista5^.elem.nota,' esta en la lista 5.');
		lista5:=lista5^.sig;
	end;
end;

var
	l,lista1,lista2,lista3,lista4,lista5:lista;
	v:vcontador;
begin
	l:=nil;
//	cargarlista SE DISPONE
	inicializar(v);
	agregaralumnos(v,l,lista1,lista2,lista3,lista4,lista5);
	imprimir(lista1,lista2,lista3,lista4,lista5);
end.
