program Punto3Practica1Parte2;
var
	nombre: string;
	notaEPA, aprobados, nota7: integer;
begin
	aprobados := 0;
	nota7 := 0;
	repeat
		writeln ('Ingrese el nombre del alumno ingresante a Analista en TIC: ');
		readln (nombre);
		writeln ('Ingrese la nota que se saco en EPA en el curso de ingreso: ');
		readln (notaEPA);
		if (notaEPA >= 8) then
			aprobados := aprobados +1;
		if (notaEPA = 7) then
			nota7 := nota7 +1;
	until (nombre = 'Zidane Zinedine');
	write ('La cantidad de alumnos aprobados es de: ', aprobados,'.');
	write ('La cantidad de alumnos que se sacaron 7 es de: ', nota7,'.');
end.
