program Punto1APractica3;
type
	str20=string[20];
	alumno = record
		codigo : integer;
		nombre : string;
		promedio : real;
end;
procedure leer(var alu : alumno);
begin
	writeln('Ingrese el codigo del alumno: ');
	readln(alu.codigo);
	if (alu.codigo <> 0) then 
		begin
		writeln('Ingrese el nombre del alumno: '); 
		readln(alu.nombre);
		writeln('Ingrese el promedio del alumno: '); 
		readln (alu.promedio);
		end;
end;
var
	a:alumno;
	cantidad:integer;
begin
	cantidad:=0;
	leer(a);
	while (a.codigo<>0) do
	begin
		leer(a);
		cantidad:=cantidad +1;
	end;
	writeln('La cantidad de alumnos leidos es de: ',cantidad);
end.
