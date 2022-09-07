program ValorAbsoluto;
var num:real;
begin
	writeln('Valor absoluto de un numero. Ingrese un numero: ');readln(num);
	if (num=0) then
		writeln('No existe el valor absoluto de 0.')
	else 
		if (num>0) then 
			writeln('El valor absoluto de ',num:0:2,' es: ',num:0:2)
	else begin
		num:=num - num - num;
		{num:= num*num;
		num:=Sqrt(num);}
		writeln('El valor absoluto de -',num:0:2,' es: ',num:0:2);
	end;
end.
