program Punto14Practica4Parte1;
type
	rango1=1..5;
	rango2=1..1000;
	infoparticipante = record
	pais:string;
	codigoproyecto:rango2;
	nombreproyecto:string;
	horastotal:real;
end;
	cantidadtipo=array[rango1]of integer;
	proyectos=array[rango2] of infoparticipante;
procedure incicializar (var c:cantidadtipo);
var
	i:rango1;
begin
	for i:=1 to 5 do
		c[i]:=0;
end;
procedure leerinfo(var info:infoparticipante;var c:cantidadtipo);
var
	num:integer;
begin
	writeln('Ingrese codigo del proyecto en el cual trabajo: ');
	readln(info.codigoproyecto);
	if (info.codigoproyecto<>-1) then
		begin
		writeln('Ingrese el pais del participante: ');
		readln(info.pais);
		writeln('Ingrese nombre del proyecto en el cual trabajo: ');
		readln(info.nombreproyecto);
		writeln('Ingrese cantidad de horas del participante: ');
		readln(info.horastotal);
		writeln('Ingrese el rol del participante: ');
		readln(num);
		c[num]:=c[num]+1;
		end;
end;
var
	c:cantidadtipo;
	p:proyectos;
begin

end.
