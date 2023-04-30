program ejercicio2Practica4Parte2;
const
	dimF=500;
type
	vector=array [1..dimf] of string;

procedure leernombres(var n:vector;var dimL:integer);
var
	alumnos:string;
begin
	dimL:=0;
	writeln('Ingrese el nombre del alumno: ');
	readln(alumnos);
	while (alumnos<>'ZZZ') and (dimL<dimF) do begin
		dimL:=dimL +1;
		n[dimL]:=alumnos;
		writeln('Ingrese el nombre del alumno: ');
		readln(alumnos);
	end;
end;

procedure eliminar(var v:vector;var diml:integer);
var
	j,i:integer;
	alumnoEliminar:string;
begin
    i:=1;
	writeln('Ingrese el nombre del alumno a eliminar: ');
	readln(alumnoEliminar);
    while ((i<=diml) and (v[i]<>alumnoEliminar)) do begin
        i+=1;
    end;
    if (i<=diml) then begin
        for j := i to diml-1 do begin
            v[j]:=v[j+1];
        end;
		diml-=1;
    end;
end;

procedure agregarAlVector(var v:vector;var diml:integer);
var
	nombreAgregar:string;
begin
	if (diml<dimf) then begin
		writeln('Ingrese el nombre del alumno a agregar: ');
		readln(nombreAgregar);
		diml+=1;
		v[diml]:=nombreAgregar;
		writeln('Se agrego el alumno al vector.');
	end
	else writeln('El vector esta lleno, no se pueden agregar alumnos.');
end;

procedure insertarVector(var v:vector;var diml:integer);
var
	nombreInsertar:string;
	i:integer;
begin
	if (diml<dimf) then begin
		if (4<=diml) then begin
			writeln('Ingrese el nombre del alumno a insertar en la posicion 4.');
			readln(nombreInsertar);
			for i := diml downto 4 do begin
				v[i+1]:=v[i];
			end;
			v[4]:=nombreInsertar;
			diml+=1;
		end
		else writeln('La posicion 4 no es valida.');
	end
	else writeln('El vector esta lleno, no se pueden insertar alumnos.');
end;

var
	n:vector;
	i,dimL:integer;
begin
	leernombres(n,dimL);
	for i := 1 to diml do begin
		writeln(n[i]);
	end;
	eliminar(n,diml);
	writeln('Vector despues de eliminar: ');
	for i := 1 to diml do begin
		writeln(n[i]);
	end;
	agregarAlVector(n,diml);
	insertarVector(n,diml);
	writeln('vector post insertar: ');
	for i := 1 to diml do begin
		writeln(n[i]);
	end;
end.
