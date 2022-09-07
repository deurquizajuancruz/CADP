program Punto11Practica3EA;
type
	vuelo=record
	codigo:integer;
	paissalida:string;
	paisllegada:string;
	kmrecorridos:real;
	porcentajeocupacion:real;
end;
procedure leerinfo(var v1:vuelo);
begin
	writeln('Ingrese el codigo del avion: ');
	readln(v1.codigo);
	if (v1.codigo<>44) then
		begin
		writeln('Ingrese el pais de salida del avion: ');
		readln(v1.paissalida);
		writeln('Ingrese el pais de llegada: ');
		readln(v1.paisllegada);
		writeln('Ingrese los kilometros recorridos: ');
		readln(v1.kmrecorridos);
		writeln('Ingrese el porcentaje de ocupacion del avion: ');
		readln(v1.porcentajeocupacion);
		end;
end;
procedure maxpaises (cantidadpaises1:integer;var maxpais1:integer;codigoavion1:integer; var avionmaspaises1:integer);
begin
	if (cantidadpaises1>maxpais1) then
		begin
		maxpais1:=cantidadpaises1;
		avionmaspaises1:=codigoavion1;
		end;
end;
function oceania (v2:vuelo):boolean;
begin
	if (v2.paisllegada='Australia') then
		oceania:=true
	else
		if (v2.paisllegada='Nueva Zelanda') then
			oceania:=true
	else
		oceania:=false;
end;
procedure maximoskilometros (totalkmrecorridos1:real;codigoavion2:integer;var maxkmuno:real;var maxkmdos:real;var maxavionuno:integer;var maxaviondos:integer);
begin
	if (totalkmrecorridos1>maxkmuno) then
		begin
		maxkmdos:=maxkmuno;
		maxkmuno:=totalkmrecorridos1;
		maxaviondos:=maxavionuno;
		maxavionuno:=codigoavion2;
		end
	else
		if (totalkmrecorridos1>maxkmdos) then
		begin
			maxkmdos:=totalkmrecorridos1;
			maxaviondos:=codigoavion2;
		end;
end;
procedure minimoskilometros(totalkmrecorridos2:real;codigoavion3:integer;var minkmuno,minkmdos: real;var minavionkmuno,minavionkmdos:integer);
begin
	if (totalkmrecorridos2<minkmuno) then
		begin
		minkmdos:=minkmuno;
		minkmuno:=totalkmrecorridos2;
		minavionkmdos:=minavionkmuno;
		minavionkmdos:=codigoavion3;
		end
	else
		if (totalkmrecorridos2<minkmdos) then
			begin
			minkmdos:=totalkmrecorridos2;
			minavionkmdos:=codigoavion3;
			end;
end;
var
	v:vuelo;
	actualsalida:string;
	totalkmrecorridos,maxkm,maxkm2,minkm,minkm2:real;
	cantidadpaises,maxpais,codigoavion,avionmaspaises,cantidadmenos60,cantidadvuelosOceania,maxavionkm,maxavionkm2,minavionkm,minavionkm2:integer;
begin
	maxpais:=-1;cantidadmenos60:=0;cantidadvuelosOceania:=0;maxkm:=-1;maxkm2:=-1;minkm:=200000;minkm2:=200000;
	leerinfo(v);
	while (v.codigo<>44) do
		begin
		codigoavion:=v.codigo;totalkmrecorridos:=0;actualsalida:=v.paissalida;cantidadpaises:=1;
		while (codigoavion=v.codigo) do
			begin
				totalkmrecorridos:=totalkmrecorridos + v.kmrecorridos;
				if (v.porcentajeocupacion<60) and (v.kmrecorridos>5000) then
					cantidadmenos60:=cantidadmenos60 + 1;
				if (v.kmrecorridos<10000) and (oceania(v)=true) then
					cantidadvuelosOceania:=cantidadvuelosOceania +1;
				if (v.paissalida<>actualsalida) then
					begin
					cantidadpaises:=cantidadpaises + 1;
					actualsalida:=v.paissalida;
					end;
				leerinfo(v);
			end;
		maximoskilometros(totalkmrecorridos,codigoavion,maxkm,maxkm2,maxavionkm,maxavionkm2);
		minimoskilometros(totalkmrecorridos,codigoavion,minkm,minkm2,minavionkm,minavionkm2);
		maxpaises(cantidadpaises,maxpais,codigoavion,avionmaspaises);
		end;
	writeln('El codigo del avion que salio de mas paises es: ',avionmaspaises);
	writeln('El codigo del avion que mas km recorrio es: ',maxavionkm,' y el codigo del segundo avion que mas km recorrio es: ',maxavionkm2);
	writeln('El codigo del avion que menos km recorrio es: ',minavionkm,' y el codigo del segundo avion que menos km recorrio es: ',minavionkm2);
	writeln('La cantidad de vuelos que recorrieron mas de 5000 km pero no llegaron al 60% de ocupacion es de: ',cantidadmenos60);
	writeln('La cantidad de vuelos que recorrieron menos de 10000 km y llegaron a Australia o a Nueva Zelanda es de: ',cantidadvuelosOceania);
end.
