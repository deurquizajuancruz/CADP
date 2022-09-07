program Punto11Practica2Parte2;
procedure apellidos (var apellido1:string;var apellido2:string;var apellido3:string;numero1:integer;var minnum3:integer;var minnum4:integer);
	begin
		if (numero1<minnum3) then
			begin
				minnum4:=minnum3;
				minnum3:=numero1;
				apellido3:=apellido2;
				apellido2:=apellido1;
			end
		else
			if (numero1<minnum4) then
				begin
				minnum4:=numero1;
				apellido3:=apellido1;
				end;
	end;
procedure nombres (var nombre1:string; var nombre2:string;var nombre3:string; var maxnum3:integer; var maxnum4:integer;numero2: integer);
	begin
		if (numero2>maxnum3) then
			begin
			maxnum4:=maxnum3;
			maxnum3:=numero2;
			nombre3:=nombre2;
			nombre2:=nombre1;
			end
		else
			if (numero2>maxnum4) then
			begin
			maxnum4:=numero2;
			nombre3:=nombre1;
			end;
	end;
procedure par (numero3:integer;var cantidadp1:integer; var cantidad1:integer);
	var
		dig:integer;
	begin
		cantidad1:= cantidad1 +1;
		dig:= numero3 mod 2;
		if (dig=0) then
			cantidadp1:=cantidadp1 +1;
		dig:=0;
	end;
var
	porcentaje: real;
	numero, maxnum,maxnum2,minnum,minnum2,cantidadp, cantidad:integer;
	apellido, apellidodos, apellidotres, nombre, nombredos, nombretres : string;
begin
	minnum:=32000; minnum2:=32000;maxnum:=-1;maxnum2:=-1; cantidadp:=0; cantidad:=0;
	repeat
	writeln('Ingrese numero de inscripcion de alumno: ');
	readln(numero);
		writeln('Ingrese apellido del alumno: ');
		readln(apellido);
		writeln('Ingrese nombre del alumno: ');
		readln(nombre);
		apellidos (apellido, apellidodos, apellidotres, numero, minnum,minnum2);
		nombres (nombre,nombredos,nombretres,maxnum,maxnum2,numero);
		par(numero,cantidadp,cantidad);
	until (numero=1200);
	porcentaje:= ((cantidadp/cantidad)*100);
	writeln('El apellido del alumno con numero de inscripcion mas chico es: ',apellidodos,' y el apellido del alumno con el segundo numero de inscripcion mas chico es: ',apellidotres);
	writeln ('El nombre del alumno con numero de inscripcion mas grandde es: ',nombredos,' y el nombre del alumno con el segundo numero de inscripcion mas grande es: ',nombretres);
	writeln('El porcentaje de alumnos con numero de inscripcion par es: ',porcentaje:4:2,'%');
end.
