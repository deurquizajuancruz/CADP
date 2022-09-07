program Punto2APractica4Parte2;
const
	dimF=500;
type
	nombres=array [1..dimF] of string;
procedure leernombres(var n:nombres;var dimL:integer);
var
	alumnos:string;
begin
	dimL:=0;
	writeln('Ingrese el nombre del alumno: ');
	readln(alumnos);
	while (alumnos<>'ZZZ') and (dimL<dimF) do
		begin
		dimL:=dimL +1;
		n[dimL]:=alumnos;
		writeln('Ingrese el nombre del alumno: ');
		readln(alumnos);
		end;
end;
var
	n:nombres;
	dimL:integer;
begin
	leernombres(n,dimL);
end.
