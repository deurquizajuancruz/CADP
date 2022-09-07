program Punto3Practica1EA;
var
	tipoTanque : char;
	anchoR, largoR, altoR, radioC, altoC, volumenC, volumenR, maxvol1, maxvol2, volumenTotalC, volumenTotalR, promedioVolC, promedioVolR, pi: real;
	alto140, metroscubicos800, tanqueC, tanqueR : integer;
begin
	alto140 := 0; metroscubicos800 :=0; maxvol1 :=-1; maxvol2:=-1; volumenTotalC :=0; volumenTotalR := 0;promedioVolC :=0; promedioVolR:=0; tanqueC :=0; tanqueR:=0; pi := 3.14159;
	writeln ('Ingrese el tipo de tanque (C si es cilindrico o R si es rectangular): ');
	readln (tipoTanque);
	while (tipoTanque <> 'Z') do
			begin
			volumenC :=0; volumenR := 0;
		if (tipoTanque = 'R') then
			begin
			tanqueR := tanqueR +1;
			writeln ('Ingrese el ancho de su tanque rectangular: ');
			readln (anchoR);
			writeln ('Ingrese el alto de su tanque rectangular: ');
			readln(altoR);
			if (altoR < 1.4) then
			alto140 := alto140 +1;
			writeln ('Ingrese el largo de su tanque rectangular: ');
			readln(largoR);
			volumenR := (anchoR*altoR*largoR);
			if (volumenR<800) then
				metroscubicos800 := metroscubicos800 +1;
			volumenTotalR := volumenTotalR + volumenR;
			end;
		if (tipoTanque = 'C') then
			begin
			tanqueC := tanqueC +1;
			writeln ('Ingrese el radio de su tanque cilindrico: ');
			readln (radioC);
			writeln ('Ingrese el alto de su tanque cilindrico: ');
			readln (altoC);
			if (altoC < 1.4) then
			alto140 := alto140 +1;
			volumenC := (pi*radioC*radioC*altoC);
			if (volumenC<800) then
				metroscubicos800 := metroscubicos800 +1;
			volumenTotalC := volumenTotalC + volumenC;
			end;
		if (volumenC > volumenR) then
			begin
			if (volumenC> maxvol1) then
			begin
			maxvol2:= maxvol1;
			maxvol1 := volumenC;
			end
			else if (volumenC>maxvol2) then
			maxvol2:=volumenC;
			end;
		if (volumenR> volumenC) then
			begin
			if (volumenR>maxvol1) then
			begin
			maxvol2:=maxvol1;
			maxvol1:= volumenR;
			end
			else if (volumenR>maxvol2) then
			maxvol2:=volumenR;
			end;
		writeln ('Ingrese el tipo de tanque (C si es cilindrico o R si es rectangular): ');
		readln (tipoTanque);
		end;
	promedioVolC := (volumenTotalC/tanqueC);
	promedioVolR := (volumenTotalR/tanqueR);
	writeln ('El volumen mas alto de los 2 tanques es ',maxvol1:4:2,' y ',maxvol2:4:2);
	writeln ('El volumen promedio de todos los tanques cilindricos vendidos es de: ',promedioVolC:4:2);
	writeln ('El volumen promedio de todos los tanques rectangulares es de: ',promedioVolR:4:2);
	writeln ('La cantidad de tanques que tienen un alto menor a 1,4 metros es de: ',alto140);
	writeln ('La cantidad de tanques cuyo volumen es menor a 800 metros cubicos es de: ',metroscubicos800);
end.
