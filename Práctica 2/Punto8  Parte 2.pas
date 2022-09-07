program Punto8Practica2Parte2;
procedure todos (codigo1:real; precio1:real;var mincodigo1:real;var mincodigo2:real;var minprecio1:real;var minprecio2:real);
		begin
			if (precio1<minprecio1) then
				begin
				minprecio2:=minprecio1;
				minprecio1:=precio1;
				mincodigo2:=mincodigo1;
				mincodigo1:=codigo1;
				end
			else 
				if (precio1<minprecio2) then
				begin
				minprecio2:=precio1;
				mincodigo2:=codigo1;
				end;
		end;
procedure maxP (var maxprecio1:real;codigo2:real;precio2:real; var maxcodigo1:real);
	begin
		if (precio2>maxprecio1) then
			begin
			maxprecio1:=precio2;
			maxcodigo1:=codigo2;
			end;
	end;
var
	i:integer;
	codigo, precio, mincodigo, mincodigos, minprecio, minprecios, precioTotal,maxprecio, maxcodigo, promedio:real;
	tipo:string;
begin
	mincodigo:=32000; mincodigos:=32000; minprecio:=32000; minprecios:=32000; precioTotal:=0; maxprecio := -1; maxcodigo:=-1;
	for i:= 1 to 100 do
		begin
		writeln ('Ingrese el codigo del producto: ');
		readln(codigo);
		writeln ('Ingrese el precio del producto: ');
		readln(precio);
		precioTotal :=precioTotal+precio;
		writeln('Ingrese el tipo del producto: ');
		readln(tipo);
		todos (codigo,precio,mincodigo,mincodigos,minprecio,minprecios);
		if (tipo = 'pantalon') then
			maxP (maxprecio, codigo, precio,maxcodigo);
		end;
	promedio:=(precioTotal/100);
	writeln('El codigo del producto mas barato es: ',mincodigo:4:2, ' y el codigo del segundo producto mas barato es: ',mincodigos:4:2);
	writeln('El codigo del pantalon mas caro es: ',maxcodigo:4:2);
	writeln('El precio promedio de todos los productos es de: ',promedio:4:2);
end.
