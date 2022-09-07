program Punto13Practica2Parte2;
function noplata (c:char): boolean;
	begin
	noplata:= (c<>'$');
	end;
procedure cumpleA (var cumple1: boolean; var cantidad1: integer);
var
	secuenciaA: char;
begin
	writeln('Ingrese la secuencia A: ');
	readln(secuenciaA);
	while (secuenciaA<>'%') and (cumple1=true) do
		begin
			if (not noplata(secuenciaA)) then
				cumple1:=false
			else
				cantidad1:= cantidad1 +1;
				readln (secuenciaA);
		end;
end;
procedure cumpleB (var cumple2:boolean; cantidad2:integer);
var
	secuenciaB:char;
	cantidadB,arroba:integer;
begin
	cantidadB:=0; arroba:=0;
	writeln('Ingrese la secuencia B: ');
	readln(secuenciaB);
	while (secuenciaB<>'*') and (arroba<=3) and (cumple2=true) do
	begin
		cantidadB:=cantidadB +1;
		if (secuenciaB='@') then
			arroba:=arroba +1;
		readln(secuenciaB);
	end;
	if (cantidadB=cantidad2) then
		cumple2:=true
	else
		cumple2:=false;
end;
var
	cumple:boolean;
	cantidad:integer;
begin
	cumple:=true;cantidad:=0;
	cumpleA(cumple, cantidad);
		if (cumple=true) then
			begin
				cumpleB(cumple,cantidad);
					if (cumple=true) then
						begin
						writeln('Se cumplieron los patrones. ');
						end
					else
						writeln('No se cumplio el patron B.');
			end
		else
			writeln('No se cumplio el patron A.');
end.
