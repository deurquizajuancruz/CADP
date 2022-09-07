program Punto12Practica2Parte2;
function vocal (c:char) :boolean;
	begin
	vocal :=((c='a') or (c='e') or (c='i') or (c='o') or (c='u') or (c='A') or (c='E') or (c='I') or (c='O') or (c='U'));
	end;
procedure cumpleA (var cumple: boolean);
	var
		secuenciaA: char;
	begin
		writeln('Ingrese la secuencia A: ');
		readln(secuenciaA);
		while (secuenciaA<>'$') and (cumple) do
			begin
				if (not vocal(secuenciaA)) then
					cumple:=false
				else
					read(secuenciaA);
			end;
	end;
function letra (l:char) : boolean;
	begin
	letra:=((l='a') or (l='e') or (l='i') or (l='o') or (l='u') or (l='A') or (l='E') or (l='I') or (l='O') or (l='U'));
	end;
procedure cumpleB (var cumple: boolean);
	var
		secuenciaB: char;
	begin
		writeln('Ingrese la secuencia B: ');
		readln(secuenciaB);
		while (secuenciaB<>'#') and (cumple) do
		begin
			if (letra(secuenciaB)) then
				cumple:=false
			else
				read(secuenciaB);
		end;
	end;
var
	cumple: boolean;
begin
	cumple:= true;
	cumpleA(cumple);
		if (cumple=true) then
		begin
			cumpleB(cumple);
				if (cumple=true) then
					writeln ('Se cumplieron los patrones.')
				else
					writeln ('No se cumplio el patron B.');
		end
		else
			writeln('No se cumplio el patron A.');
end.
