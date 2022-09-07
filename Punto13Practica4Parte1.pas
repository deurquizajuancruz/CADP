program Punto13Practica4Parte1;
const
	dimFAnios=50;dimFLugares=100;
type
	vec100 = array[1..dimFLugares] of real;
	vec50 = array[1..dimFAnios] of vec100;
procedure cargarPorLugar(var vL: vec100);
var
    j: integer;
begin
      for j := 1 to dimFLugares do
		begin
		writeln('Ingrese la temperatura promedio anual del lugar. Luego de ingresar 100 temperaturas, avanzara de anio: ');
        readln(vL[j]);
        end;
end;
procedure cargar(var v: vec50);
var
    i: integer;
begin
    for i := 1 to dimFAnios do
	  begin
      cargarPorLugar(v[i]);
      end;
 end;
procedure maximos (aniomax:integer;dato:real;var maximo1:real;var aniomaximo1:integer);
begin
	if (dato>maximo1) then
		begin
			maximo1:=dato;
			aniomaximo1:=aniomax;
		end;
end;
var
	v:vec50;
	maximo,sumaanio,max:real;
	aniomaximo,h,k,aniomax:integer;
begin
	maximo:=-200;max:=-200;aniomax:=0;aniomaximo:=0;
	cargar(v);
	for h:=1 to dimFAnios do
		begin
		sumaanio:=0;
		for k:=1 to dimFLugares do
			begin
			sumaanio:=sumaanio + v[h][k];
			maximos(h,v[h][k],maximo,aniomaximo);
			end;
		maximos(h,(sumaanio/100),max,aniomax);
		end;
	writeln('El anio con mas temperatura global promedio fue: ',aniomax);
	writeln('El anio con la mayor temperatura detectada en algun lugar en los ultimos 50 anios fue: ',aniomaximo);
end.
