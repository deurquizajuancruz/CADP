program Punto4APractica1Parte2;
var
	numero, primerMinimo, segundoMinimo :integer;
begin
    primerMinimo := 32767;
    segundoMinimo := 32767;
	repeat
        write('Ingrese un numero: ');
        readln(numero);
        if numero < segundoMinimo then
           if numero < primerMinimo then
              begin
				segundoMinimo := primerMinimo;
                primerMinimo := numero;
              end
           else
                segundoMinimo := numero;
    until (numero = 0);
    write('El menor numero leido es: ', primerMinimo,', el segundo menor numero leido es: ', segundoMinimo,'.');
end.
