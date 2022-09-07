program Punto4BPractica2EA;
const 
	pi= 3.14;
	diametroTierra= 12700;
	diametroMarte= 6780;
	perimetroJupiter=439264;
procedure CalculoDyP(var per,diam:real;rad:real);
begin
    diam:=2*rad;
    per:=pi*diam;
end;
function DentroDeRango(num:real):boolean;
begin
    DentroDeRango:=(diametroMarte<=num)and(num<=diametroTierra);
end;
function EsMayor(num:real):boolean;
begin
    EsMayor:=(perimetroJupiter<num);
end;
VAR
    Perimetro,radio,Diametro,distancia:real;
    grandes:integer;
    nombre:string;
begin
    grandes:=0;
    write('Ingrese el nombre del planeta: ');readln(nombre);
    write('Ingrese el radio (km) del planeta: ');readln(radio);
    write('Ingrese la distancia (anios luz) al planeta: ');readln(distancia);
    while(radio<>0)do begin
        CalculoDyP(Perimetro,Diametro,radio);
        if DentroDeRango(Diametro) then
            writeln(nombre,', a ',distancia:0:3,' anios luz, tiene un radio de ',radio:0:3,' km y es posiblemente habitable.');
 if EsMayor(Perimetro) then
            grandes:=grandes+1;
        write('Ingrese el nombre del planeta: ');readln(nombre);
        write('Ingrese el radio(km) del planeta: ');readln(radio);
        write('Ingrese la distancia (anios luz) al planeta: ');readln(distancia);
   end;
    writeln('Se leyeron ',grandes,' posibles gigantes gaseosos');
end.
