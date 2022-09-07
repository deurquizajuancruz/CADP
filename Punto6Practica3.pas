program Punto6Practica3;
type
	microprocesadores =record
	marca:string;
	linea:string;
	cantidadCores:real;
	velocidadReloj:real;
	tamanioTransistores:real;
end;
procedure leerinfo (var m:microprocesadores);
begin
	writeln('Ingrese la marca del microprocesador: ');
	readln(m.marca);
	writeln('Ingrese la linea del microprocesador: ');
	readln(m.linea);
	writeln('Ingrese la cantidad de cores del microprocesador: ');
	readln(m.cantidadCores);
	if (m.cantidadCores>0) then
		begin
		writeln('Ingrese la velocidad del reloj medida en GHz: ');
		readln(m.velocidadReloj);
		writeln('Ingrese el tamanio de los transistores medido en nanometros: ');
		readln(m.tamanioTransistores);
		end;
end;
procedure hasta22nm (m2:microprocesadores);
begin
	if (m2.cantidadCores>2) and (m2.tamanioTransistores<=22) then
		writeln('La marca ',m2.marca, ' con linea ',m2.linea,' tiene un procesador con al menos 2 cores y el tamanio de los transistores es a lo sumo de 22 nanometros. ');
end;
procedure transistor14(var m3:microprocesadores; var transistores141:integer);
begin
	if (m3.tamanioTransistores = 14) then
		transistores141:=transistores141 + 1;
end;
procedure maximos (var marca1:string; var maxtuno,maxtdos,transistores142:integer;var maxmarcauno,maxmarcados:string);
begin
	if (transistores142>maxtuno) then
		begin
			maxtdos:=maxtuno;
			maxtuno:=transistores142;
			maxmarcados:=maxmarcauno;
			maxmarcauno:=marca1;
		end
		else
			if(transistores142>maxtdos) then
				begin
				maxtdos:=transistores142;
				maxmarcados:=marca1;
				end;
end;
procedure relojes2GHZ (m4:microprocesadores; var cantidad2GHZ1:integer);
begin
	if (m4.marca='Intel') or (m4.marca='AMD') then
		begin
			if (m4.cantidadCores>=1) and (m4.velocidadReloj>=2) then
				cantidad2GHZ1:= cantidad2GHZ1 +1;
		end;
end;	
var
	micro:microprocesadores;
	marca,maxmarca,maxmarca2:string;
	cantidad2GHZ,transistores14,maxt,maxt2:integer;
begin
	leerinfo(micro); cantidad2GHZ:=0; maxt:=0;maxt2:=0;
	while (micro.cantidadCores<>0) do
		begin
			marca:=micro.marca;
			transistores14:=0;
			while (micro.cantidadCores<>0) and (micro.marca=marca) do
				begin
					relojes2GHZ(micro,cantidad2GHZ);
					hasta22nm(micro);
					transistor14(micro,transistores14);
					leerinfo(micro);
				end;
			maximos(marca,maxt,maxt2,transistores14,maxmarca,maxmarca2);
		end;
	writeln('La marca con mayor cantidad de transistores de 14nm es: ',maxmarca,' y la seguna marca con mayor cantidad de transistores de 14nm es: ',maxmarca2);
	writeln('La cantidad de procesadores multicore de Intel o AMD cuyos relojes alcancen por lo menos una velocidad de 2 GHz es de: ',cantidad2GHZ);
end.
