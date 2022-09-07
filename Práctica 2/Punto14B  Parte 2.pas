Program Punto14BPractica2Parte2;
const
	precio= 320;
type
	campos = record
	localidad: string;
	hectareas: real;
	zonas: integer;
end;
procedure calcularRendimiento (hectareas1:real;zonas1:integer; var rendimiento2:real);
begin
	if (zonas1=1) then
		rendimiento2:= (6*precio*hectareas1);
	if (zonas1=2) then
		rendimiento2:=(2.6*precio*hectareas1);
	if (zonas1=3) then
		rendimiento2:=(1.4*precio*hectareas1);
end;
procedure lectura (var c: campos; var rendimiento1:real; var cantidad3F1: integer;var maxrendimiento1:real; var minrendimiento1: real;var cantidadc1: integer; var totalRendimiento1: real; var maxlocalidad1:string; var minlocalidad1: string);
begin
	repeat
		writeln ('Ingrese la localidad del campo: ');
		readln (c.localidad);
		writeln ('Ingrese las hectareas sembradas del campo: ');
		readln (c.hectareas);
		writeln('Ingrese el tipo de zona (1 muy fertil, 2 estandar y 3 arida): ');
		readln(c.zonas);
		calcularRendimiento(c.hectareas,c.zonas, rendimiento1);
		cantidadc1:= cantidadc1 +1;
		totalRendimiento1:= totalRendimiento1 + rendimiento1;
		if (c.localidad = 'Tres de Febrero') and (rendimiento1>=10000) then
			cantidad3F1:= cantidad3F1 +1;
		if (rendimiento1>maxrendimiento1) then
			begin
			maxrendimiento1:= rendimiento1;
			maxlocalidad1:= c.localidad;
			end;
		if (rendimiento1<minrendimiento1) then
			begin
			minrendimiento1:= rendimiento1;
			minlocalidad1:=c.localidad;
			end;
		rendimiento1:= 0;
	until (c.localidad='Saladillo');
end;
var
	campo: campos;
	rendimiento, totalRendimiento, promedio,maxrendimiento, minrendimiento: real;
	cantidad3F,cantidadc: integer;
	maxlocalidad, minlocalidad: string;	
begin
	rendimiento:=0; totalRendimiento:= 0; promedio:=0; cantidad3F:=0; maxrendimiento:= -1; minrendimiento:= 32000; cantidadc:=0;
	lectura (campo, rendimiento,cantidad3F,maxrendimiento,minrendimiento,cantidadc,totalRendimiento,maxlocalidad,minlocalidad);
	promedio:= (totalRendimiento/cantidadc);
	writeln ('La cantidad de campos de la localidad de Tres de Febrero con un rendimiento economico mayor o igual a 10 mil dolares es de: ',cantidad3F);
	writeln ('La localidad del campo con mayor rendimiento es de: ',maxlocalidad);
	writeln('La localidad del campo con menor rendimiento es de: ',minlocalidad);
	writeln('El rendimiento promedio de todos los campos es de: ',promedio:4:2);
end.
