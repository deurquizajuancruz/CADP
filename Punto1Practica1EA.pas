program Punto1Practica1EA;
var
	codigo, cantI, cantE5, i, codigomaximo : integer;
	montoI, promedio, montoTotal, maximo : real;
begin
	montoTotal:= 0;
	maximo := -1;
	cantE5 := 0;
	repeat
		begin
		write ('Ingrese el codigo de empresa:');
		read (codigo);
		write ('Ingrese la cantidad de inversiones de la empresa: ');
		read (cantI);
		for i:= 1 to cantI do
			begin
			write ('Ingrese monto de inversion: ');
			read (montoI);
			montoTotal := montoTotal + montoI;
			end;
		if (montoTotal>50000) then
			begin
			cantE5:= cantE5 + 1;
			end;
		if (montoTotal>maximo) then
			begin
			codigomaximo := codigo;
			maximo := montoTotal;
			end;
		promedio:= (montoTotal / cantI);
		write ('Resultado del analisis: Empresa ',codigo, '. Monto promedio ',promedio:3:2,'. ');
		promedio := 0; cantI:= 0; montoTotal := 0;
		end;
	until (codigo = 100);
	write ('La empresa ',codigomaximo,' es la que mayor dinero posee invertido: ',maximo:4:2);
	write ('. Hay ',cantE5,' empresas con inversiones mayores a 50000');
end.
