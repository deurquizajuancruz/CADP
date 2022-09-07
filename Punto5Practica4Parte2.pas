program Punto5Practica4Parte2;
const
	dimF=16;
type
	rangocodigo=1..2400;
	rangocategoriamonotributo='A'..'F';
	fechacontrato = record
	anio:integer;
	mes:integer;
end;
	cliente = record
	fechafirma:fechacontrato;
	catmono:rangocategoriamonotributo;
	codigociudad:rangocodigo;
	monto:real;
end;
	vmeses=array[1..12]of integer;
	vanios=array[2006..2021] of integer;
	vmonotributo=array [rangocategoriamonotributo] of integer;
	vclientes=array[1..dimF]of cliente;
procedure leervector (var c:cliente);
begin
	writeln('Ingrese la fecha de firma del contrato. Recuerde que Amazon Web se fundo en 2006 y sigue vigente hasta hoy, 2021.Ingrese el anio: ');
	readln(c.fechafirma.anio);
	writeln('Ingrese el mes: ');
	readln(c.fechafirma.mes);
	writeln('Ingrese la categoria del monotributo: ');
	readln(c.catmono);
	writeln('Ingrese el codigo de la ciudad: ');
	readln(c.codigociudad);
	writeln('Ingrese el monto mensual acordado en el contrato: ');
	readln(c.monto);
end;
procedure cargarvector(var v:vclientes);
var
	i:integer;
	aux:cliente;
begin
	for i:=1 to dimF do
		leervector(aux);
		v[i]:=aux;
end;
procedure inicializarmeses (var vme:vmeses);
var
	i:integer;
begin
	for i:= 1 to 12 do
		vme[i]:=0;
end;
procedure inicializaranios (var va:vanios);
var
	i:integer;
begin
	for i:= 2006 to 2021 do
		va[i]:=0;
end;
procedure inicializarmono (var vmo:vmonotributo);
var
	i:rangocategoriamonotributo;
begin
	for i:= 'A' to 'F' do
		vmo[i]:=0;
end;
procedure contarmeses (var vme:vmeses;mes:integer);
begin
	vme[mes]:=vme[mes]+1;
end;
procedure contaranios(var va:vanios;anio:integer);
begin
	va[anio]:=va[anio]+1;
end;
procedure contarmonotributo (var vmo:vmonotributo;monotributo:char);
begin
	vmo[monotributo]:=vmo[monotributo]+1;
end;
procedure maximos (contratosanios:integer; var maximacantidad:integer;anio:integer);
begin
	if (contratosanios>maximacantidad) then
		begin
		maximacantidad:=anio;
		end;
end;
procedure recorrervector(var vme:vmeses;var va:vanios;var vmo:vmonotributo;var v:vclientes);
var
	maximacantidad,j,i,a,clientesmaspromedio,k:integer;
	montototal,montopromedio:real;
	d:rangocategoriamonotributo;
begin
	maximacantidad:=-1;clientesmaspromedio:=0;
	inicializarmeses(vme);
	inicializaranios(va);
	inicializarmono(vmo);
	for i:=1 to dimF do
		begin
		montototal:=v[i].monto;
		contarmeses(vme,v[i].fechafirma.mes);
		contaranios(va,v[i].fechafirma.anio);
		contarmonotributo(vmo,v[i].catmono);
		maximos(va[v[i].fechafirma.anio],maximacantidad,v[i].fechafirma.anio);
		end;
	montopromedio:=(montototal/dimF);
	for k:=1 to dimF do
		if (v[i].monto>montopromedio) then
			clientesmaspromedio:=clientesmaspromedio +1;
	writeln('El anio en que se firmo la mayor cantidad de contratos fue el anio: ',maximacantidad);
	writeln('La cantidad de clientes los cuales us monto supera el promedio es de: ',clientesmaspromedio);
	for j:=1 to 12 do
		writeln('La cantidad de contratos del mes ',j,' es de: ',vme[j]);
	for a:=2006 to 2021 do
		writeln('La cantidad de contratos del anio ',a,' es de: ',va[a]);
	for d:='A' to 'F' do
		writeln('La cantidad de contratos del tipo de monotributo ',d,' es de: ',vmo[d]);
end;
var
	v:vclientes;
	m:vmeses;
	an:vanios;
	mo:vmonotributo;
begin
	cargarvector(v);
	recorrervector(m,an,mo,v);
end.
