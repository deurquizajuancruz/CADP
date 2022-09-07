program Punto14Practica6;
type
	codigos=-1..1300;
	dias=1..31;
	medios=1..5;
	infoviaje=record
	codigoa:codigos;
	dia:dias;
	facultad:string;
	medio:medios;
end;
	lista=^nodo;
	nodo=record
	viajes:infoviaje;
	sig:lista;
end;
	vmedios=array[medios]of integer;
	valumnos=array[codigos]of lista;
procedure leerinfo (var i:infoviaje);
begin
	writeln('Ingrese el codigo del alumno: ');
	readln(i.codigoa);
	if (i.codigoa<>-1) then
		begin
		writeln('Ingrese el dia del viaje: ');
		readln(i.dia);
		writeln('Ingrese la facultad del alumno: ');
		readln(i.facultad);
		writeln('Ingrese el medio de transporte: ');
		readln(i.medio);
		end;
end;
procedure inicializarvector (var vm:vmedios);
var
	i:medios;
begin
	for i:=1 to 5 do
		vm[i]:=0;
end;
procedure inicializarlistas(var va:valumnos);
var
	i:codigos;
begin
	for i:=1 to 1300 do
		va[i]:=nil;
end;
procedure insertarordenado (var L:lista; i:infoviaje);
var
	nue,act,ant:lista;
begin
	new(nue);nue^.viajes:=i;nue^.sig:=nil;
	if (l=nil) then
		L:=nue
	else begin
	ant:=L;act:=L;
	while (act<>nil) and (act^.viajes.dia<i.dia) do
		begin
		ant:=act;
		act:=act^.sig;
		end;
	if (ant=act) then
		L:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
	end;
end;
procedure cargarlista(var v:valumnos);
var
	i:infoviaje;
begin
	leerinfo(i);
	while (i.codigoa<>-1) do
		begin
		insertarordenado(v[i.codigoa],i);
		leerinfo(i);
		end;
end;
procedure calcularmaximos(cantidad,i:integer;var max2,max1,maxmedio2,maxmedio1:integer);
begin
	if (cantidad>max1) then
		begin
		max2:=max1;
		max1:=cantidad;
		maxmedio2:=maxmedio1;
		maxmedio1:=i;
		end
	else
	if (cantidad>max2) then
		begin
		max2:=cantidad;
		maxmedio2:=i;
		end;
end;
//function calculargastado:boolean SE DISPONE. Retorna true si se gastaron 80 o mas en el dia
procedure recorrer (v:valumnos;var vm:vmedios);
var
	auxdia:dias;
	l,aux,aux2:lista;
	h,cantidadviajes,alumnos6,cantidadbicicleta,cantidadsinbicicleta,cantidadcombinacion,max2,max1,maxmedio2,maxmedio1:integer;
	//cantidad80:integer;
	auxalumno:codigos;
	i:medios;
begin
//	cantidad80:=0;
	alumnos6:=0;cantidadcombinacion:=0;max2:=-100;max1:=-100;
	l:=nil;
	for h:=1 to 1300 do
		begin
		L:=v[h];
		while (l<>nil) do
			begin
			auxalumno:=l^.viajes.codigoa; aux:=l;
			while (aux<>nil) and (auxalumno=l^.viajes.codigoa) do
				begin
				cantidadviajes:=0;cantidadbicicleta:=0;cantidadsinbicicleta:=0;auxdia:=l^.viajes.dia; aux2:=l;
				while (aux2<>nil) and (auxalumno=l^.viajes.codigoa) and (auxdia=l^.viajes.dia) do
					begin
					cantidadviajes:=cantidadviajes +1;
					if (l^.viajes.medio=5) then
						cantidadbicicleta:=cantidadbicicleta +1;
					if (l^.viajes.medio<>5) then
						cantidadsinbicicleta:=cantidadsinbicicleta +1;
					vm[l^.viajes.medio]:=vm[l^.viajes.medio] +1;
					aux2:=aux2^.sig;
					end;
			//	if (calculargastado=true) then
			//		cantidad80:= cantidad80 +1;
				if (cantidadbicicleta>=1) and (cantidadsinbicicleta>=1) then
					cantidadcombinacion:=cantidadcombinacion +1;
				if (cantidadviajes>6) then
					alumnos6:=alumnos6+1;
				end;
			l:=l^.sig;
			end;
		end;
	for i:= 1 to 5 do
		calcularmaximos(vm[i],i,max2,max1,maxmedio2,maxmedio1);
	writeln('La cantidad de alumnos que hacen mas de 6 viajes por dia es de: ',alumnos6);
//	writeln('La cantidad de alumnos que gastaron mas de $80 por dia es de: ',cantidad80);
	writeln('El metodo de transporte mas utilizado fue el del tipo: ',maxmedio1,'. El segundo medio mas utilizado fue el del tipo: ',maxmedio2);
	writeln('La cantidad de alumnos que usaron por lo menos la bicicleta una vez y otro medio de transporte es de: ',cantidadcombinacion);
end;
var
	v:valumnos;
	vm:vmedios;
begin
	cargarlista(v);
	recorrer(v,vm);
end.
