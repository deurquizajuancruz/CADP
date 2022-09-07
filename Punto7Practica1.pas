Program Punto7Practica1;
var
	codigo,precioantes,precioactual,diez : real;
begin
	write('Ingresar el codigo del producto: ');
	read(codigo);
	if codigo = 32767 then
		write ('Codigo invalido.');
	while (codigo<>32767) do
		begin
			write('Ingrese el precio de antes del producto: ');
			read (precioantes);
			write ('Ingrese el precio actual del producto: ');
			read (precioactual);
			diez := (precioantes/100)*10;
			if precioactual>precioantes + diez then
				write ('El aumento de precio del producto ', codigo:3:0, ' supera al 10%.');
			if precioactual<= precioantes + diez then
				write ('El aumento del precio del producto ', codigo:3:0, ' no supera al 10%.');
			write (' Ingresar el codigo del producto: ');
			read (codigo);
			if codigo = 32767 then
				write ('Codigo invalido.');
		end;
end.
