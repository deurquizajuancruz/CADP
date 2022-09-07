program Punto4BPractica1Parte2;
var
	numero, primerMinimo, segundoMinimo :integer;
begin
    primerMinimo := 32767;
    segundoMinimo := 32767;
    write('Ingrese un numero: ');
    read(numero);
    while (numero <>0) do 
		begin
        if numero < segundoMinimo then
           if numero < primerMinimo then
              begin
				segundoMinimo := primerMinimo;
                primerMinimo := numero;
              end
           else
                segundoMinimo := numero;
          write ('Ingrese un numero :');
          read (numero);
         end;
    write('El menor numero leido es: ', primerMinimo,', el segundo menor numero leido es: ', segundoMinimo,'.');
end.
