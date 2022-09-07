program Punto6Practica1Parte2;
var
	i, precio, minimo1, minimo2, precio16, codigo : integer;
begin
	minimo1:= 32000;
	minimo2:= 32000;
	precio16 := 0;
	for i:= 1 to 200 do
		begin
		write ('Ingrese el codigo del producto: ');
		read (codigo);
		write ('Ingrese el precio del producto: ');
		read (precio);
		if (precio<minimo2) then
			if (precio<minimo1) then
				begin
				minimo2 := minimo1;
				minimo1 := precio;
				end
			else
				minimo2 := precio;
		if (precio> 16) then
			precio16 := precio16 + 1;
	end;
	write ('El precio del producto mas barato es de: ', minimo1,' peso/s y el precio del segundo producto mas barato es de: ', minimo2, ' pesos.');
	write ('La cantidad de productos que su precio es mayor a 16 pesos es de: ', precio16);
end.
