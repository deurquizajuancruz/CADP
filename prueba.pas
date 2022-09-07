program ejercicio;
const
	fin=5;
type
	puntero=^real;
var
	a:real;b:puntero;
function calcular ():puntero;
var
	i:integer;
begin
	new(b);b^:=a;
	for i:=1 to fin do begin
		b^:=b^ +i;
		a:= a +1;
	end;
	calcular:=b;
end;
var
	c:puntero;
begin
	a:=20;
	c:=calcular();
	c^:=c^ +a;
	writeln('-a: ',a:4:4);
	writeln('-b: ',b^:4:4);
	writeln('-c: ',c^:4:4);
end.
