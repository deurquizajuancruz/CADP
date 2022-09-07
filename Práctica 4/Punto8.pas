program Punto8Practica4Parte1;
const
	cantidad=400;
type
	ingresante=record
	nroinscripcion:real;
	DNI:integer;
	apellido:string;
	nombre:string;
	anionacimiento:integer;
end;
	alumnos=array[1..cantidad] of ingresante;
procedure leerinfo(var a1:ingresante);
begin
	writeln('Ingrese el nro de inscripcion del ingresante: ');
	readln(a1.nroinscripcion);
	writeln('Ingrese el DNI del ingresante: ');
	readln(a1.DNI);
	writeln('Ingrese el apellido del ingresante: ');
	readln(a1.apellido);
	writeln('Ingrese el nombre del ingresante: ');
	readln(a1.nombre);
	writeln('Ingrese el anio de nacimiento del alumno: ');
	readln(a1.anionacimiento);
end;
procedure cargarinfo(var a2:alumnos);
var
	i:integer;
begin
	for i:=1 to cantidad do
		leerinfo(a2[i]);
end;
procedure esPar(dni:integer;var seguir1:boolean);
var
	resto:integer;
begin
	seguir1:=true;
	while(dni<>0) and (seguir1=true) do
		begin
			resto:=dni mod 10;
			if (resto mod 2=0) then
				begin
				seguir1:=true;
				dni:=dni div 10;
				end
				else
					seguir1:=false;
		end;
end;
procedure mayoredad(apellidomayor,nombremayor:string;aniomayor:integer;var maxapellidouno,maxapellidodos,maxnombreuno,maxnombredos:string;var maxaniouno,maxaniodos:integer);
begin
	if (aniomayor<maxaniouno) then
		begin
			maxaniodos:=maxaniouno;
			maxaniouno:=aniomayor;
			maxnombredos:=maxnombreuno;
			maxnombreuno:=nombremayor;
			maxapellidodos:=maxapellidouno;
			maxapellidouno:=apellidomayor;
		end
		else
		if (aniomayor<maxaniodos) then
			begin
			maxaniodos:=aniomayor;
			maxnombredos:=nombremayor;
			maxapellidodos:=apellidomayor;
			end;
end;
procedure actualizarinfo(a2:alumnos;var contador1:integer;var maxapellidouno,maxapellidodos,maxnombreuno,maxnombredos:string;var maxaniouno,maxaniodos:integer;var seguir3:boolean);
var
	i:integer;
begin
	contador1:=0;
	for i:=1 to cantidad do
		begin
		esPar(a2[i].DNI,seguir3);
		if (seguir3=true) then
			contador1:=contador1+1;
		mayoredad(a2[i].apellido,a2[i].nombre,a2[i].anionacimiento,maxapellidouno,maxapellidodos,maxnombreuno,maxnombredos,maxaniouno,maxaniodos);
		end;
end;
var
	a:alumnos;
	maxapellido1,maxapellido2,maxnombre1,maxnombre2:string;
	maxanio1,maxanio2,contador:integer;
	seguir:boolean;
begin
	maxanio1:=2021;maxanio2:=2021;
	cargarinfo(a);
	actualizarinfo(a,contador,maxapellido1,maxapellido2,maxnombre1,maxnombre2,maxanio1,maxanio2,seguir);
	writeln('El apellido del ingresante con mayor edad es: ',maxapellido1,' y su nombre es: ',maxnombre1);
	writeln('El apellido del segundo ingresante con mayor edad es: ',maxapellido2,' y su nombre es: ',maxnombre2);
	writeln('El porcentaje de alumnos con DNI con solo digitos pares es: ',((contador/cantidad)*100):4:2,'%');
end.
