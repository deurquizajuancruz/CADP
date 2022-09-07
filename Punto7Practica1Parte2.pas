program Punto7Practica1Parte2;
var
	i : integer;
	nombre, primero, segundo, ultimo, anteultimo : string;
	tiempo, tiempoP, tiempoS, tiempoU, tiempoA : real;
begin
	tiempoP := 30000; tiempoS := 30000;
	tiempoU := -30000; tiempoA := -30000;
	nombre := ''; primero := ''; segundo := ''; ultimo := ''; anteultimo := '';
	for i:= 1 to 100 do
		begin
		writeln ('Ingrese el nombre del piloto: ');
		readln (nombre);
		writeln ('Ingrese el tiempo que el tomo a ese piloto finalizar la carrera: ');
		readln (tiempo);
		if (tiempo<tiempoP) then
				begin
				tiempoS := tiempoP;
				tiempoP := tiempo;
				segundo := primero;
				primero := nombre;
				end
			else 
				if (tiempo<tiempoS) then
				begin
				tiempoS := tiempo;
				segundo := nombre;
				end;
		if (tiempo>tiempoP) and (tiempo>tiempoS) and (tiempo>tiempoU) then
				begin
				tiempoA := tiempoU;
				tiempoU := tiempo;
				anteultimo := ultimo;
				ultimo := nombre;
				end
			else
				if (tiempo>tiempoP) and (tiempo>tiempoS) and (tiempo>tiempoA) then
					begin
					tiempoA := tiempo;
					anteultimo := nombre;
					end;
		end;
	write ('El piloto que finalizo en primer puesto fue: ', primero, '. El segundo fue: ',segundo, '. ');
	write ('El piloto que finalizo en el ultimo puesto fue: ',ultimo,'. El anteultimo fue: ',anteultimo,'.');
end.
