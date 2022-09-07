program Punto3Practica2EA;
procedure leer (var mincodigouno:integer;var mincodigodos:integer; var cantidad161:integer;var minpreciouno:real; var minpreciodos:real);
var
	i, codigo: integer;
	precio:real;
begin
	for i:=1 to 5 do
		begin
		writeln ('Ingrese el codigo del producto. Debe ser entero y mayor o igual a 1 o menor o igual a 200: ');
		readln(codigo);
		writeln('Ingrese el precio del prodcuto: ');
		readln(precio);
		if (precio<minpreciouno) then
			begin
			minpreciodos:=minpreciouno;
			minpreciouno:=precio;
			mincodigodos:=mincodigouno;
			mincodigouno:=codigo;
			end
		else
			if (precio<minpreciodos) then
			begin
			minpreciodos:=precio;
			mincodigodos:=codigo;
			end;
		if (codigo mod 2=0) and (precio>16) then
			cantidad161:= cantidad161 +1;
		end;
end;
var
	mincodigo, mincodigo2, cantidad16: integer;
	minprecio, minprecio2: real;
begin
	mincodigo:=250; mincodigo2:=250; minprecio:=32000; minprecio2:=32000;cantidad16:=0;
	leer (mincodigo,mincodigo2,cantidad16,minprecio,minprecio2);
	writeln('El codigo del producto mas barato es: ',mincodigo,' y el codigo del segundo precio mas barato es: ',mincodigo2);
	writeln('La cantidad de productos con codigo par con un precio mayor a 16 es de: ',cantidad16);
end.
