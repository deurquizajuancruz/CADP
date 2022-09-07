program Punto14APractica2Parte2;
procedure calcularRendimiento (hectareas1:real;zonas1:integer;precio1:real; var rendimiento1:real);
begin
	if (zonas1=1) then
		begin
		rendimiento1:= (6*precio1*hectareas1);
		writeln('El rendimiento economico de la zona muy fertil es de: ',rendimiento1:4:2);
		rendimiento1:=0;
		end;
	if (zonas1=2) then
		begin
		rendimiento1:=(2.6*precio1*hectareas1);
		writeln('El rendimiento economico de la zona estandar es de: ',rendimiento1:4:2);
		rendimiento1:=0;
		end;
	if (zonas1=3) then
		begin
		rendimiento1:=(1.4*precio1*hectareas1);
		writeln('El rendimiento economico de la zona arida es de: ',rendimiento1:4:2);
		rendimiento1:=0;
		end;
end;
var
	zonas:integer;
	hectareas,precio,rendimiento:real;
begin
	rendimiento:=0;
	writeln('Ingrese la cantidad de hectareas sembradas: ');
	readln(hectareas);
	writeln('Ingrese el precio en dolares de la tonelada de soja: ');
	readln(precio);
	writeln('Ingrese el tipo de zona de siembra (1 muy fertil, 2 estandar y 3 arida): ');
	readln(zonas);
	while (zonas=1) or (zonas=2) or (zonas=3) do
		begin
			calcularRendimiento(hectareas,zonas,precio,rendimiento);
			writeln('Ingrese la cantidad de hectareas sembradas: ');
			readln(hectareas);
			writeln('Ingrese el precio en dolares de la tonelada de soja: ');
			readln(precio);
			writeln('Ingrese el tipo de zona de siembra (1 muy fertil, 2 estandar y 3 arida): ');
			readln(zonas);
		end;
end.
