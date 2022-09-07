Program Punto6Practica1;
var
	nrolegajo, promedio, alumnos, alumnosmasseis, alumnosdestacados,porcentaje: real;
begin
	alumnos:= 0;
	alumnosmasseis:= 0;
	alumnosdestacados:= 0;
	write ('Inserte el numero de legajo: ');
	read (nrolegajo);
	while (nrolegajo <> -1) do
		begin
		write ('Inserte el promedio de un alumno: ');
		read (promedio);
		alumnos:= alumnos +1;
		if promedio >6.5 then
			alumnosmasseis := alumnosmasseis +1;
		if (promedio>8.5) and (nrolegajo<2500) then
			alumnosdestacados:= alumnosdestacados +1;
		porcentaje:= (alumnosdestacados/alumnos)*100;
		write ('Inserte el numero de legajo: ');
		read (nrolegajo);
		end;
	write ('La cantidad total de alumnos leida fue de: ', alumnos:2:2,'.');
	write (' La cantidad de alumnos que su promedio supera el de 6.5 es de: ', alumnosmasseis:2:2,'.');
	write (' El porcentaje de alumnos que tienen un promedio mayor a 8.5 y su numero de legajo es menor a 2500 es de: ', porcentaje:2:2,'.');
end.
