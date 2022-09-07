program Punto11Practica4Parte1;
const
	cantidadF=200;
type
	fotos=record
	titulo:string;
	autor:string;
	cantidadmg:integer;
	cantidadclics:integer;
	cantidadcomentarios:integer;
end;
	fotografias=array[1..cantidadF]of fotos;
procedure leerinfo(var f1:fotos);
begin
	writeln('Ingrese titulo de la foto: ');
	readln(f1.titulo);
	writeln('Ingrese el autor de la foto: ');
	readln(f1.autor);
	writeln('Ingrese la cantidad de Me Gusta: ');
	readln(f1.cantidadmg);
	writeln('Ingrese la cantidad de clics: ');
	readln(f1.cantidadclics);
	writeln('Ingrese la cantidad de comentarios: ');
	readln(f1.cantidadcomentarios);
end;
procedure cargarinfo(var f2:fotografias);
var
	i:integer;
begin
	for i:=1 to cantidadF do
		leerinfo(f2[i]);
end;
procedure masvista (titulo:string;cantidadclics:integer;var maxclics:integer;var maxtitulo:string);
begin
	if (cantidadclics>maxclics) then
		begin
			maxclics:=cantidadclics;
			maxtitulo:=titulo;
		end;
end;
procedure actualizar(f3:fotografias;var maxclics1:integer;var maxtitulo1:string;var mgvandelay1:integer);
var
	i:integer;
begin
	for i:=1 to cantidadF do
		begin
			masvista(f3[i].titulo,f3[i].cantidadclics,maxclics1,maxtitulo1);
			if (f3[i].autor='Art Vandelay') then
				mgvandelay1:=mgvandelay1 + f3[i].cantidadmg;
		end;
end;
var
	f:fotografias;
	mgvandelay,maxclics:integer;
	maxtitulo:string;
begin
	maxclics:=-32767;mgvandelay:=0;
	cargarinfo(f);
	actualizar(f,maxclics,maxtitulo,mgvandelay);
	writeln('El titulo de la foto con mas clics es: ',maxtitulo);
	writeln('La cantidad total de Me Gusta que ha tenido Art Vandelay es de: ',mgvandelay);
end.
