program Punto3Practica3;
const
	relacionUNESCO=(1/23.435);
type
	infoEscuelas = record
		cue:real;
		cantidadD:real;
		cantidadA:real;
		nombre:string;
		localidad:string;
end;
procedure leer (var i:infoEscuelas);
begin
	writeln('Ingrese el CUE del establecimiento: ');
	readln(i.cue);
	writeln('Ingrese el nombre del establecimiento: ');
	readln(i.nombre);
	writeln('Ingrese la cantidad de docentes del establecimiento: ');
	readln(i.cantidadD);
	writeln('Ingrese la cantidad de alumnos del establecimiento: ');
	readln(i.cantidadA);
	writeln('Ingrese la localidad del establecimiento: ');
	readln(i.localidad);
end;
procedure relacion (var i2:infoEscuelas; var cantidadSuperior1:integer;var cuemaxuno:real;var cuemaxdos:real; var nombremaxuno:string;var nombremaxdos:string);
var
	relacionEscuelas:real;
begin
	relacionEscuelas:=(i2.cantidadD/i2.cantidadA);
	if (i2.localidad='La Plata') and (relacionEscuelas>relacionUNESCO) then
		cantidadSuperior1:=cantidadSuperior1 +1;
	if (relacionEscuelas>cuemaxuno) then
		begin
		cuemaxdos:=cuemaxuno;
		cuemaxuno:=i2.cue;
		nombremaxdos:=nombremaxuno;
		nombremaxuno:=i2.nombre
		end
	else
		if (relacionEscuelas>cuemaxdos) then
		begin
		cuemaxdos:=i2.cue;
		nombremaxdos:=i2.nombre;
		end;
end;
var
	cuemax,cuemax2:real;
	nombremax,nombremax2:string;
	cantidadSuperior,i:integer;
	info:infoEscuelas;
begin
	cuemax:=-1;cuemax2:=-1;cantidadSuperior:=0;
	for i:=1 to 7 do
		begin
		leer(info);
		relacion(info,cantidadSuperior,cuemax,cuemax2,nombremax,nombremax2);
		end;
	writeln('La cantidad de escuelas en La Plata con una relacion de alumnos por docente superior a la sugerida por UNESCO es de: ',cantidadSuperior);
	writeln('El CUE y el nombre de la escuela con mejor relacion entre docentes y alumnos es: ',cuemax2:4:2,', ',nombremax2,' y el CUE y el nombre de la segunda escuela con mejor relacion entre docentes y alumnos es: ',cuemax:4:2,', ',nombremax);
end.
