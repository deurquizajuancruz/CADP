program Punto14Practica4Parte1;
const
	montoAnalista = 35.2;
	montoProgramador = 27.45;
	montoAdministradorBases = 31.03;
	montoArquitecto = 44.28;
	montoAdministradorRedes = 39.87;
type
	subrangoCodigosProyectos= 1..1000;
	subrangoRolesProyecto = 1..5;
	desarrollador = record
		pais:string;
		codigoProyecto:integer;
		nombreProyecto:string;
		rolProyecto:subrangoRolesProyecto;
		horas:real;
	end;
	proyecto = record
		montoInvertido:real;
		cantidadArquitectos:integer;
	end;
	vectorProyectos = array [subrangoCodigosProyectos] of proyecto;
	
procedure inicializarVector(var v:vectorProyectos);
var
	i:subrangoCodigosProyectos;
begin
	for i := 1 to 1000 do begin
		v[i].montoInvertido:=0;
		v[i].cantidadArquitectos:=0;
	end;
end;

procedure leerDesarrollador(var d:desarrollador);
begin
	writeln('Ingrese codigo del proyecto: ');readln(d.codigoProyecto);
	if (d.codigoProyecto<>-1) then begin
		writeln('Ingrese pais de residencia: ');readln(d.pais);
		writeln('Ingrese nombre del proyecto: ');readln(d.nombreProyecto);
		writeln('Ingrese rol en el proyecto: ');readln(d.rolProyecto);
		writeln('Ingrese horas trabajadas en el proyecto: ');readln(d.horas);
	end;
end;

procedure procesarProyectos(var v:vectorProyectos);
var
	d:desarrollador;
	montoArgentina:real;
	horasAdministradores:real;
begin
	montoArgentina:=0;
	horasAdministradores:=0;
	leerDesarrollador(d);
	while (d.codigoProyecto<>-1) do begin
		if (d.rolProyecto=4) then v[d.codigoProyecto].cantidadArquitectos+=1;
		if (d.rolProyecto=3) then horasAdministradores+=d.horas;
		if (d.pais='Argentina') then begin
			case d.rolProyecto of
				1: montoArgentina+=d.horas*montoAnalista;
				2: montoArgentina+=d.horas*montoProgramador;
				3: montoArgentina+=d.horas*montoAdministradorBases;
				4: montoArgentina+=d.horas*montoArquitecto;
				5: montoArgentina+=d.horas*montoAdministradorRedes;
			end;
		end;
		case d.rolProyecto of
			1: v[d.codigoProyecto].montoInvertido+=d.horas*montoAnalista;
			2: v[d.codigoProyecto].montoInvertido+=d.horas*montoProgramador;
			3: v[d.codigoProyecto].montoInvertido+=d.horas*montoAdministradorBases;
			4: v[d.codigoProyecto].montoInvertido+=d.horas*montoArquitecto;
			5: v[d.codigoProyecto].montoInvertido+=d.horas*montoAdministradorRedes;
		end;
		leerDesarrollador(d);
	end;
	writeln('El monto total invertido en desarrolladores con residencia en Argentina es: ',montoArgentina);
	writeln('La cantidad total de horas trabajadas por Administradores de bases de datos es: ',horasAdministradores);
end;

procedure recorrerVector(v:vectorProyectos);
var
	minCodigo,i:subrangoCodigosProyectos;
	minMonto:real;
begin
	minMonto:=32766;
	for i := 1 to 1000 do begin
		writeln('La cantidad de Arquitectos de software del proyecto ',i,' es: ',v[i].cantidadArquitectos);
		if (v[i].montoInvertido<minMonto) then begin
			minMonto:=v[i].montoInvertido;
			minCodigo:=i;
		end;
	end;
	writeln('El código del proyecto con menor monto invertido es: ',minCodigo);
end;

var
	v:vectorProyectos;
begin
	inicializarVector(v);
	procesarProyectos(v);
	recorrerVector(v);
end.