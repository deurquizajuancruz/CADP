program Punto10Practica4Parte1;
const
	dimF=300;
type
	salarios=array[1..dimF]of real;
procedure leersalario(var s1:salarios;var dimL1:integer;var totalsueldo1:real);
var
	sueldo:real;
begin
	writeln('Ingrese el sueldo del empleado: ');
	readln(sueldo);
	while (sueldo<>0)and(dimL1<dimF) do
		begin
			dimL1:=dimL1 +1;
			totalsueldo1:=totalsueldo1+sueldo;
			s1[dimL1]:=sueldo;
			writeln('Ingrese el sueldo del empleado: ');
			readln(sueldo);
		end;
end;
function sueldopromedio(s2:salarios;dimL2:integer;totalsueldo2:real):real;
begin
	sueldopromedio:=(totalsueldo2/dimL2);
end;
procedure incrementar (var s3:salarios;dimL3:integer;x1:real);
var
	i:integer;
begin
	for i:=1 to dimL3 do
		begin
		s3[i]:=s3[i]+(s3[i]*x1);
		writeln('El sueldo del empleado numero ',i,' ha sido incrementado en un 15% y ahora es de: ',s3[i]:4:2);
		end;
end;
var
	s:salarios;
	dimL:integer;
	x,totalsueldo:real;
begin
	dimL:=0;totalsueldo:=0;x:=(15/100);
	leersalario(s,dimL,totalsueldo);
	incrementar(s,dimL,x);
	writeln('El sueldo promedio es de: ',sueldopromedio(s,dimL,totalsueldo):4:2);
end.
