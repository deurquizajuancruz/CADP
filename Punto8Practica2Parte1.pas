program Punto8Practica2Parte1;
function analizarLetra : boolean;
	var
		letra : char;
	begin
		readln(letra);
		if (letra >= 'a') and (letra <= 'z') then
			analizarLetra := true
		else
			if (letra >= 'A') and (letra <= 'Z') then
			analizarletra := false;
	end;
procedure leer;
	begin
	if (analizarLetra) then
		writeln('Se trata de una minúscula')
	else
		writeln('Se trata de una mayúscula');
 end;
var
 ok : boolean;
begin
 leer;
 ok := analizarLetra;
 if ok then
	writeln('Gracias, vuelva prontosss');
end.
