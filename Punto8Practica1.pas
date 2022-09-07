Program Punto8Practica1;
var
	cantidadVocales : integer;
	c1, c2, c3: char;
begin
	cantidadVocales := 0;
	write ('Ingrese un caracter: ');
	readln (c1);
	write ('Ingrese otro caracter: ');
	readln (c2);
	write ('Ingrese el ultimo caracter: ');
	readln (c3);
	if (c1= 'a') or (c1 = 'e') or (c1 = 'i') or (c1 = 'o') or (c1 = 'u') then
		cantidadVocales := cantidadVocales +1;
	if (c2 = 'a') or (c2 = 'e') or (c1 = 'i') or (c2 = 'o') or (c1 = 'u') then
		cantidadVocales := cantidadVocales +1;
	if (c3 = 'a') or (c3 = 'e') or (c3 = 'i') or (c3 = 'o') or (c3 = 'u') then
		cantidadVocales := cantidadVocales +1;
	if cantidadVocales >=0 then
		if cantidadVocales = 3 then
			write ('Los tres son vocales.')
		else
			write ('Al menos un caracter no era vocal.');
end.
