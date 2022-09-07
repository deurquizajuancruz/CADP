program Punto8Practica3;
type
	docente = record
	DNI:string;
	nombre:string;
	apellido:string;
	email:string;
end;
	proyecto =record
	codigo:integer;
	titulo:string;
	docentecoordinador:docente;
	cantidadAlumnos:integer;
	nombreEscuela:string;
	localidad:string;
end;
procedure leerDocente(var d:docente);
begin
	writeln('Ingrese el DNI del docente: ');
	readln(d.DNI);
	writeln('Ingrese el nombre del docente: ');
	readln(d.nombre);
	writeln('Ingrese el apellido del docente: ');
	readln(d.apellido);
	writeln('Ingrese el email del docente: ');
	readln(d.email);
end;
procedure leerinfo(var proyecto1:proyecto);
begin
	writeln('Ingrese el codigo del proyecto: ');
	readln(proyecto1.codigo);
	if (proyecto1.codigo<>-1) then
		begin
		writeln('Ingrese la localidad del proyecto: ');
		readln(proyecto1.localidad);
		writeln('Ingrese el titulo del proyecto: ');
		readln(proyecto1.titulo);
		writeln('Ingrese la cantidad de alumnos que participan del proyecto: ');
		readln(proyecto1.cantidadAlumnos);
		writeln('Ingrese el nombre de la escuela del proyecto: ');
		readln(proyecto1.nombreEscuela);
		writeln('Ingrese datos del docente: ');
		leerDocente(proyecto1.docentecoordinador);
		end;
end;
procedure maximos (var escuela:string; var maxescuelauno:integer;var maxescuelados:integer;var maxnombreescuelauno:string;var maxnombreescuelados:string;var totalAlumnos:integer);
begin
	if (totalAlumnos>=maxescuelauno) then
		begin
			maxescuelados:=maxescuelauno;
			maxescuelauno:=totalAlumnos;
			maxnombreescuelados:=maxnombreescuelauno;
			maxnombreescuelauno:=escuela;
		end
		else
			if (totalAlumnos>=maxescuelados) then
				begin
					maxescuelados:=totalAlumnos;
					maxnombreescuelados:=escuela;
				end;
end;
function localidadD(codigo:integer):boolean;
var
	cantidadP,cantidadI,descomponer:integer;
begin
	cantidadP:=0;cantidadI:=0;
	while (codigo<>0) do
		begin
		descomponer:=codigo mod 10;
		if (descomponer mod 2=0) then
			cantidadP:=cantidadP +1
		else
			cantidadI:=cantidadI +1;
		codigo:=codigo div 10;
		end;
	localidadD:=(cantidadP=cantidadI);
end;
var
	p:proyecto;
	local,maxnombreescuela,maxnombreescuela2,escuela:string;
	cantidadEL, maxescuela,maxescuela2,cantidadE,totalAlumnos:integer;
begin
	maxescuela:=-1;maxescuela2:=-1;cantidadE:=0;
	leerinfo(p);
	while (p.codigo<>-1) do
		begin
		if (p.localidad='Daireaux') and (localidadD(p.codigo)=true) then
			writeln('El titulo ',p.titulo,' es de Diareaux y su codigo tiene la misma cantidad de digitos impares como pares.');
		local:=p.localidad;
		cantidadEL:=0;
		while (p.codigo<>-1) and (p.localidad=local) do
			begin
				escuela:=p.nombreEscuela;
				cantidadE:=cantidadE +1;
				totalAlumnos:=0;
				while (p.codigo<>-1) and (p.localidad=local) and (escuela=p.nombreEscuela) do
					begin
					totalAlumnos:=totalAlumnos + p.cantidadAlumnos;
					cantidadEL:= cantidadEL +1;
					leerinfo(p);
					end;
				maximos(escuela,maxescuela,maxescuela2,maxnombreescuela,maxnombreescuela2,totalAlumnos);
			end;
		writeln('La cantidad de escuelas para la localidad ',local,' es de: ',cantidadEL);
		end;
	writeln('La escuela con mayor cantidad de alumnos participantes es: ',maxnombreescuela,' y la segunda escuela con mayor cantidad de alumnos participantes es: ',maxnombreescuela2);
	writeln('La cantidad de escuelas que participaron fue de: ',cantidadE);
end.
