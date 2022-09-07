program Thiago6;
var
	dolares,valor,comision:real;
begin
	writeln('Ingresar el monto de los dolares: ');readln(dolares);
	writeln('Ingresar el valor del dolar hoy en dia: ');readln(valor);
	writeln('Ingresar el valor de la comision que cobrara el banco: ');readln(comision);
	comision:= (dolares * valor * comision/100);
	writeln('La transaccion sera de ',(dolares*valor+comision):0:2, ' pesos argentinos.');
end.
