program Punto7Practica4Parte1;
type
	rango=0..9;
	digitos=array [rango] of integer;
procedure inicializar (var n1:digitos);
var
	i:rango;
begin
	for i:= 0 to 9 do
		n1[i]:=0;
end;
procedure descomponer (var n2:digitos;num:integer);
var
	resto:rango;
begin
	while(num<>0) do
		begin
		resto:=num mod 10;
		n2[resto]:=n2[resto] +1;
		num:=num div 10;
		end;
end;
procedure informar (n3:digitos);
var
	i:rango;
begin
	for i:=0 to 9 do
		writeln('La cantidad de veces que aparecio el digito ',i,' fue de ',n3[i],' veces.');
end;
function Maximo(A:digitos):integer;
var
i,max:integer;
begin
	max:=0;
	for i:= 0 to 9 do
	begin
		if(A[i] > A[max])then
			max:= i;
	end;
	Maximo := max;
end;
var
	numeros:digitos;
	numero:integer;
begin
	inicializar(numeros);
	writeln('Ingrese un numero: ');
	readln(numero);
	while (numero<>-1) do
		begin
		descomponer(numeros,numero);
		writeln('Ingrese un numero: ');
		readln(numero);
		end;
	informar(numeros);
	writeln('El digito que mas veces aparecio fue el: ',Maximo(numeros));
end.
