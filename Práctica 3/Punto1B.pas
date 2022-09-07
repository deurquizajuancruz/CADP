program Punto1BPractica3;
type
	str20=string[20];
	alumno = record
		codigo:integer;
		nombre:string;
		promedio:real;
end;
procedure leer(var alu : alumno; var mejorpromedio1:real; var mejornombre1:string);
begin
	writeln('Ingrese el codigo del alumno: ');
	readln(alu.codigo);
	if (alu.codigo <> 0) then 
		begin
		writeln('Ingrese el nombre del alumno: '); 
		readln(alu.nombre);
		writeln('Ingrese el promedio del alumno: '); 
		readln (alu.promedio);
		if (alu.promedio>mejorpromedio1) then
			begin
			mejorpromedio1:=alu.promedio;
			mejornombre1:=alu.nombre;
			end;
		end;
end;
var
	a:alumno;
	cantidad:integer;
	mejorpromedio:real;
	mejornombre:string;
begin
	cantidad:=0; mejorpromedio:=-1;
	leer(a,mejorpromedio,mejornombre);
	while (a.codigo<>0) do
	begin
		leer(a,mejorpromedio,mejornombre);
		cantidad:=cantidad +1;
	end;
	writeln('La cantidad de alumnos leidos es de: ',cantidad,'.');
	writeln('El alumno con mejor promedio fue: ',mejornombre,'.');
end.

