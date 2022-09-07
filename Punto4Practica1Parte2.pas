program Punto4Practica1Parte2;
var
    i, numero, primerMinimo, segundoMinimo :integer;
begin
    primerMinimo := 32767;
    segundoMinimo := 32767;
    for i:=1 to 1000 do
        begin
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
        end;
   write('El menor numero leido es: ', primerMinimo,', el segundo menor numero leido es: ', segundoMinimo,'.');
end.
