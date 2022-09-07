program Punto2Practica2EA;
var
	legajo, nota: real; 
	condicion : char;
	alumnosI, alumnosTotalI, alumnosR, alumnosTotalR, i, presente : integer;
begin
	alumnosI := 0; presente := 0; alumnosTotalI := 0; alumnosTotalR := 0; alumnosR := 0;
	write ('Ingrese el legajo del alumno: ');
	readln (legajo);
	if (legajo = -1) then
	write ('El numero de legajo es invalido');
	while (legajo<>-1) do
		begin
		writeln ('Ingrese la condicion del alumno: ');
		readln (condicion);
		for i:= 1 to 5 do
			begin
			writeln ('Ingresar nota: ');
			readln (nota);
			if (nota>4) and (nota<>-1) then
				begin
				presente := presente +1;
				end;
			if (condicion = 'I') then
				begin
				alumnosTotalI := alumnosTotalI +1;
				if (presente> 3.75) then
					begin
					alumnosI := alumnosI +1;
					end;
				end;
			if (condicion = 'R') then
				begin
				alumnosTotalR := alumnosTotalR +1;
				if (presente > 3.75) then
					begin
					alumnosR := alumnosR +1;
					end;
				end;
		writeln ('Ingrese el legajo del alumno: ');
		readln(legajo);
			end;
		end;
	write ('La cantidad de alumnos Ingresantes en condiciones de rendir el parcial es de: ',alumnosI,' y el porcentaje sobre los alumnos Ingresantes es de: ', alumnosI/alumnosTotalI:4:2);
	write ('La cantidad de alumnos Recursantes en condiciones de rendir el parcial es de: ',alumnosR,' y el porcentaje sobre los alumnos Recursantes es de: ',alumnosR/alumnosTotalR:4:2);
end.
