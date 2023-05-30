program Punto14Practica6;
type
	infoviaje=record
		codigoa:integer;
		dia:integer;
		facultad:string;
		medio:integer;
	end;
	lista=^nodo;
	nodo=record
		viajes:infoviaje;
		sig:lista;
	end;
	vmedios=array[1..5]of integer;
	valumnos=array[1..1300]of lista;

procedure inicializarvector (var vm:vmedios);
var
	i:integer;
begin
	for i:=1 to 5 do
		vm[i]:=0;
end;

procedure inicializarlistas(var va:valumnos);
var
	i:integer;
begin
	for i:=1 to 1300 do
		va[i]:=nil;
end;

procedure leerViaje (var i:infoviaje);
begin
	writeln('Ingrese el codigo del alumno: ');
	readln(i.codigoa);
	if (i.codigoa<>-1) then begin
		writeln('Ingrese el dia del viaje: ');
		readln(i.dia);
		writeln('Ingrese la facultad del alumno: ');
		readln(i.facultad);
		writeln('Ingrese el medio de transporte: ');
		readln(i.medio);
	end;
end;

procedure insertarOrdenado (var L:lista; i:infoviaje);
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
	leerViaje(i);
	while (i.codigoa<>-1) do begin
		insertarordenado(v[i.codigoa],i);
		leerViaje(i);
	end;
end;

procedure calcularmaximos(cantidad,tipo:integer;var max2,max1,maxmedio2,maxmedio1:integer);
begin
	if (cantidad>max1) then begin
		max2:=max1;
		maxmedio2:=maxmedio1;
		max1:=cantidad;
		maxmedio1:=tipo;
	end
	else if (cantidad>max2) then begin
		max2:=cantidad;
		maxmedio2:=tipo;
	end;
end;

function gastado():boolean;
begin
	//se dispone
	gastado:=true;
end;

procedure recorrer (v:valumnos;var vm:vmedios);
var
	l:lista;
	cantidad80,auxdia,i,cantidad,alumnos6,cantidadBicicleta,cantidadSinBicicleta,cantidadCombinacion,max2,max1,maxmedio2,maxmedio1:integer;
	masSeis,mas80:boolean;
begin
	inicializarvector(vm);
	cantidad80:=0;
	alumnos6:=0;
	cantidadCombinacion:=0;
	max2:=-1;
	max1:=-1;
	l:=nil;
	for i:=1 to 1300 do begin
		l:=v[i];
		masSeis:=false;
		mas80:=false;
		cantidadBicicleta:=0;
		cantidadSinBicicleta:=0;
		while (l<>nil) do begin
			cantidad:=0;
			auxdia:=l^.viajes.dia;
			while (l<>nil) and (auxdia=l^.viajes.dia) do begin
				cantidad+=1;
				if (l^.viajes.medio=5) then
					cantidadBicicleta+=1
				else
					cantidadSinBicicleta+=1;
				vm[l^.viajes.medio]+=1;
				l:=l^.sig;
			end;
			if (gastado()) then
				mas80:=true;
			if (cantidad>6) then
				masSeis:=true;
		end;
		if (cantidadBicicleta>0) and (cantidadSinBicicleta>0) then
			cantidadCombinacion+=1;
		if (masSeis) then
			alumnos6+=1;
		if (mas80) then
			cantidad80+=1;
	end;
	for i:= 1 to 5 do
		calcularmaximos(vm[i],i,max2,max1,maxmedio2,maxmedio1);
	writeln('La cantidad de alumnos que hacen mas de 6 viajes por dia es de: ',alumnos6);
	writeln('La cantidad de alumnos que gastaron mas de $80 por dia es de: ',cantidad80);
	writeln('El metodo de transporte mas utilizado fue el del tipo: ',maxmedio1,'. El segundo medio mas utilizado fue el del tipo: ',maxmedio2);
	writeln('La cantidad de alumnos que usaron por lo menos la bicicleta una vez y otro medio de transporte es de: ',cantidadcombinacion);
end;

var
	v:valumnos;
	vm:vmedios;
begin
	inicializarlistas(v);
	cargarlista(v);
	recorrer(v,vm);
end.
