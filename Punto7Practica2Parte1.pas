program Punto7Practica2Parte1;
var
 suma, cant : integer;
function calcularPromedio : real;
	var
		prom : real;
	begin
		if (cant <> 0) then
			prom := -1
		else
			prom := suma/cant;
			calcularPromedio := prom;
	end;
begin
	readln(suma);
	readln(cant);
	if (calcularPromedio <> -1) then 
		begin
		cant := 0;
		writeln('El promedio es: ; ', suma/cant);
		end
	else
		writeln('Dividir por cero no parece ser una buena idea.');
end.
