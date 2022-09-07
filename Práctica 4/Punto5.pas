program Punto5Practica4Parte1;
const
	dimF=100;
type
	vector=array [1..dimF] of integer;
procedure leervector (var v1:vector;var dimL1:integer);
var
	numero:integer;
begin
	dimL1:=0;
	writeln('Ingrese un numero: ');
	readln(numero);
	while (dimL1<dimF) and (numero<>0) do
		begin
		dimL1:=dimL1 +1;
		v1[dimL1]:=numero;
		writeln('Ingrese un numero: ');
		readln(numero);
		end;
end;
function elementoMaximo(v2:vector;dimL2:integer):integer;
var
	pos,i,max:integer;
begin
	max:=-32767;pos:=0;
	for i:=1 to dimL2 do
		begin
			if (v2[i]>max) then
				begin
					max:=v2[i];
					pos:=i;
				end;
		end;
	elementoMaximo:=pos;
end;
function elementoMinimo (v3:vector;dimL3:integer):integer;
var
	pos,i,min:integer;
begin
	min:=32767;pos:=0;
	for i:=1 to dimL3 do
		begin
			if (v3[i]<min) then
				begin
					min:=v3[i];
					pos:=i;
				end;
		end;
	elementoMinimo:=pos;
end;
procedure intercambio (var v4:vector;x,y:integer);
var
	aux:integer;
begin
	aux:=v4[x];
	v4[x]:=v4[y];
	v4[y]:=aux;
end;
var
	v:vector;
	dimL,maximo,minimo:integer;
begin
	leervector(v,dimL);
	maximo:=elementoMaximo(v,dimL);
	minimo:=elementoMinimo(v,dimL);
	intercambio(v,maximo,minimo);
	writeln('El elemento maximo ',v[minimo],' que se encontraba en la posicion ',maximo, ' fue intercambiado con el elemento minimo ',v[maximo],' que se encontraba en la posicion ',minimo);
end.
