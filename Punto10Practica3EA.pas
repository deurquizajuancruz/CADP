program Punto10Practica3EA;
type
	planta=record
	nombrecientifico:string;
	vidapromedio:integer;
	tipoplanta:string;
	clima:string;
end;
procedure leerinfo(var p1:planta);
begin
	writeln('Ingrese el nombre cientifico de la especie: ');
	readln(p1.nombrecientifico);
	writeln('Ingrese la vida promedio de la especie: ');
	readln(p1.vidapromedio);
	writeln('Ingrese el tipo de planta: ');
	readln(p1.tipoplanta);
	writeln('Ingrese el clima en el que sobrevive: ');
	readln(p1.clima);
end;
procedure leerpais(var cant:integer;var argentina:boolean);
var
	pais:string;
begin
	cant:=0;
	argentina:=false;
	writeln('Ingrese los paises donde esta planta exista; ');
	readln(pais);
	while (pais<>'ZZZ') do
		begin
		argentina:=argentina or (pais='argentina');
		cant:=cant+1;
		readln(pais);
		end;
end;
procedure menorcantidad (var tipoactual1:string;var cantidadplantaxespecie1:integer;var tipomin1:string;var cantidadminima1:integer);
begin
	if (cantidadplantaxespecie1<cantidadminima1) then
		begin
			cantidadminima1:=cantidadplantaxespecie1;
			tipomin1:=tipoactual1;
		end;
end;
function vidapromedio(tiempototalvida1:integer;cantidadplantaxespecie2:integer):real;
begin
	vidapromedio:=((tiempototalvida1/cantidadplantaxespecie2)*100);
end;
procedure maslongevas (p2:planta;var maxplantauno:integer;var maxplantados:integer;var nombrelongevauno:string;var nombrelongevados:string);
begin
	if (p2.vidapromedio>maxplantauno) then
		begin
		maxplantados:=maxplantauno;
		maxplantauno:=p2.vidapromedio;
		nombrelongevados:=nombrelongevauno;
		nombrelongevauno:=p2.nombrecientifico;
		end
	else
		if (p2.vidapromedio>maxplantados) then
			begin
			maxplantados:=p2.vidapromedio;
			nombrelongevados:=p2.nombrecientifico;
			end;
end;
procedure maspaises(p3:planta;var maxpaises1:integer;var nombremaxpaises1:string;var cantidad1:integer);
begin
	if(cantidad1>maxpaises1) then
		begin
		maxpaises1:=cantidad1;
		nombremaxpaises1:=p3.nombrecientifico;
		end;
end;
var
	p:planta;
	i,cantidad,cantidadplantaxespecie,tiempototalvida,cantidadminima,maxplanta,maxplanta2,maxpaises:integer;
	arg:boolean;
	tipoactual,tipomin,nombrelongeva,nombrelongeva2,nombremaxpaises:string;
begin
	tipoactual:='';cantidadminima:=9999;maxplanta:=-1;maxplanta2:=-1;maxpaises:=-1;
	for i:=1 to 320 do
	begin
		leerinfo(p);
		if (tipoactual=p.tipoplanta)then
			begin
			cantidadplantaxespecie:=cantidadplantaxespecie +1;
			tiempototalvida:=tiempototalvida + p.vidapromedio;
			end
		else
			begin
				if (tipoactual<>'') then
					begin
						menorcantidad(tipoactual,cantidadplantaxespecie,tipomin,cantidadminima);
						writeln('El tiempo de vida de las plantas ',tipoactual,' es de ',vidapromedio(tiempototalvida,cantidadplantaxespecie):4:2);
					end;
				tipoactual:=p.tipoplanta;
				cantidadplantaxespecie:=0;
				tiempototalvida:=0;
			end;
		leerpais(cantidad,arg);
		if (arg=true) and (p.clima='subtropical')  then
			writeln('La planta con nombre ',p.nombrecientifico, 'se encuentra en el clima subtropical en el pais Argentina.');
		maspaises(p,maxpaises,nombremaxpaises,cantidad);
		maslongevas(p,maxplanta,maxplanta2,nombrelongeva,nombrelongeva2);
	end;
	menorcantidad(tipoactual,cantidadplantaxespecie,tipomin,cantidadminima);
	writeln('El tiempo de vida de las plantas ',tipoactual,' es de ',vidapromedio(tiempototalvida,cantidadplantaxespecie):4:2);
	writeln('El tipo de plantas ',tipomin,' es el que menor cantidad de plantas posee.');
	writeln('La planta mas longeva es: ',nombrelongeva, 'y la segunda planta mas longeva es: ',nombrelongeva2);
	writeln('El nombre de la planta que se encuentra en mas paises es: ',nombremaxpaises);
end.
