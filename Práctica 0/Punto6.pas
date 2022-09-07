Program Punto6Practica0;
var
	valorusd, montousd, porcentaje, comision: real;
begin
	write ('Inserte el monto en USD de la transaccion: ');
	read (montousd);
	write ('Inserte el valor del USD en el dia de la fecha: ');
	read (valorusd);
	write ('Inserte el porcentaje de comision que cobra el banco: ');
	read (porcentaje);
	comision := montousd * valorusd * porcentaje/100;
	write ('La transaccion sera de ', montousd* valorusd + comision:2:2, ' pesos argentinos');
end.
