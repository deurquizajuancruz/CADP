program Punto9Practica3EA;
type
	candidato = record
	localidad:string;
	apellido:string;
	cantidadvotos:integer;
	cantidadvotantes:integer;
end;
procedure leerinfo(var c1:candidato);
begin
	writeln('Ingrese la localidad del candidato: ');
	readln(c1.localidad);
	writeln('Ingrese el apellido del candidato: ');
	readln(c1.apellido);
	writeln('Ingrese la cantidad de votos que recibio el candidato: ');
	readln(c1.cantidadvotos);
	writeln('Ingrese la cantidad de votantes de la localidad: ');
	readln(c1.cantidadvotantes);
end;
procedure maximovotos (c2:candidato;var maxvotos1:integer;var maxapellido1:string);
begin
	if (c2.cantidadvotos > maxvotos1) then
		begin
			maxvotos1:=c2.cantidadvotos;
			maxapellido1:=c2.apellido;
		end;
end;

function porcentaje (c3:candidato):real;
begin
	porcentaje:=((c3.cantidadvotos*100)/c3.cantidadvotantes);
end;

procedure maxporcentaje (c4:candidato;var maxporciento1:real; copiarporcentaje1:real;var maxapellidoporcentaje1:string);
begin
	if (copiarporcentaje1 > maxporciento1) then
		begin
			maxporciento1 := copiarporcentaje1;
			maxapellidoporcentaje1:=c4.apellido;
		end;
end;
var
	c:candidato;
	maxvotos:integer;
	maxapellido,maxapellidoporcentaje:string;
	maxporciento:real;
begin
	maxvotos:=-1;
    maxporciento:=-1;
	repeat
		leerinfo(c);
		maximovotos(c,maxvotos,maxapellido);
		maxporcentaje(c,maxporciento,porcentaje(c),maxapellidoporcentaje);
	until (c.localidad='Zarate');
	writeln('El apellido del intendente que mas votos recibio es: ',maxapellido);
	writeln('El apellido del intendente que recibio mas porcentaje de votos es: ',maxapellidoporcentaje);
end.
