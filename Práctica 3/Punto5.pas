program Punto5Practica3;
type
	auto=record
	marca:string;
	modelo:string;
	precio:real;
end;
procedure leermarca (var a3:auto);
begin
	writeln('Ingrese la marca del auto: ');
	readln(a3.marca);
end;
procedure leerauto (var a:auto);
begin
	writeln('Ingrese el modelo del auto: ');
	readln(a.modelo);
	writeln('Ingrese el precio del auto: ');
	readln(a.precio);
end;
function promedio(total1:real;cantidad1:integer):real;
begin
	promedio:=(total1/cantidad1);
end;
procedure mascaro (a2:auto; var max1:real;var marcamax1,modelomax1:string);
begin
	if (a2.precio>max1) then
		begin
		max1:=a2.precio;
		marcamax1:=a2.marca;
		modelomax1:=a2.modelo;
		end;
end;
var
	autito:auto;
	marca,marcamax,modelomax:string;
	cantidad:integer;
	total,max:real;
begin
	max:=-1;
	leermarca(autito);
	while (autito.marca<>'ZZZ') do
		begin
		cantidad:=0; total:=0;
		marca:=autito.marca;
		while (autito.marca<>'ZZZ') and (autito.marca=marca) do
			begin
				leerauto(autito);
				cantidad:= cantidad +1;
				total:=total + autito.precio;
				mascaro(autito,max,marcamax,modelomax);
				leermarca(autito);
			end;
			writeln('El promedio de la marca ',marca,' es: ',promedio(total,cantidad):4:2);
		end;
	writeln('La marca y el modelo del auto mas caro son: ',marcamax,' y ',modelomax);
end.
