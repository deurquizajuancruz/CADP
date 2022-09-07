program Punto7Practica3;
type
	centros=record
	nombrea:string;
	universidad:string;
	cantidadi:integer;
	cantidadb:integer;
end;
procedure leerinfo (var c:centros);
begin
	writeln('Ingrese el nombre abreviado del centro: ');
	readln(c.nombrea);
	writeln('Ingrese la universidad a la que pertenece el centro: ');
	readln(c.universidad);
	writeln('Ingrese la cantidad de investigadores del centro: ');
	readln(c.cantidadi);
	if (c.cantidadi>0) then
		begin
		writeln('Ingrese la cantidad de becarios del centro: ');
		readln(c.cantidadb);
		end;
end;
procedure maxinvestigadores (var c2:centros;var maxinv1:integer;var maxuni1:string; var totalinv1:integer);
begin
	if (totalinv1>maxinv1) then
		begin
			maxinv1:=totalinv1;
			maxuni1:=c2.universidad;
		end;
end;
procedure minbecarios (var c3:centros; var minuniuno:string;var minunidos:string;var minbecuno:integer;var totalbec1:integer;var minbecdos:integer);
begin
	if (totalbec1<minbecuno) then
		begin
		minunidos:=minuniuno;
		minuniuno:=c3.nombrea;
		minbecdos:=minbecuno;
		minbecuno:=totalbec1;
		end
		else
			if (totalbec1<minbecdos) then
			begin
			minunidos:=c3.nombrea;
			minbecdos:=totalbec1;
			end;
end;
var
	centro:centros;
	cantidadcentros,maxinv,totalinv,totalbec,minbec,minbec2:integer;
	uni,maxuni,minuni,minuni2:string;
begin
	leerinfo(centro);maxinv:=0;minbec:=32767;minbec2:=32767;totalbec:=0;
	while (centro.cantidadi<>0) do
		begin
		cantidadcentros:=0; totalinv:=0;
		uni:=centro.universidad;
		while (centro.cantidadi<>0) and (uni=centro.universidad) do
			begin
			cantidadcentros:=cantidadcentros +1;
			totalinv:=totalinv + centro.cantidadi;
			totalbec:=totalbec + centro.cantidadb;
			minbecarios(centro,minuni,minuni2,minbec,totalbec,minbec2);
			maxinvestigadores(centro,maxinv,maxuni,totalinv);
			leerinfo(centro);
			end;
		writeln('La universidad ' ,uni,' cuenta con ',cantidadcentros,' centros.');
		end;
	writeln('La universidad con mayor cantidad de investigadores en sus centros es: ',maxuni);
	writeln('El centro con menor cantidad de becarios es: ',minuni,' y el segundo centro con menor cantidad de becarios es: ',minuni2);
end.
