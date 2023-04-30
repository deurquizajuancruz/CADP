program ejercicio1Practica4Parte2;
type
    vector = array[1..10] of integer;

procedure cargarEImprimirVector(var v:vector);
var
    i:integer;
begin
    for i := 1 to 10 do
        v[i]:=i*5;
    for i := 1 to 10 do
        writeln('Posicion ',i,' valor ',v[i]);
end;

function seEncuentra(v:vector; num:integer):boolean;
var
    i:integer;
begin
    i:=1;
    seEncuentra:=false;
    while ((i<=10) and (not seEncuentra)) do begin
        if (v[i]=num) then seEncuentra:=true;
        i+=1;
    end;
end;

function busquedaBinaria(v:vector;num:integer):boolean;
var
    primero,ultimo,medio:integer;
begin
    primero:=1;
    ultimo:=10;
    medio:=(primero+ultimo) div 2;
    while ((primero<ultimo) and (v[medio]<>num)) do begin
        if (num<v[medio]) then ultimo:=medio-1
        else primero:=medio+1;
        medio:=(primero+ultimo) div 2;
    end;
    if (primero<=ultimo) and (v[medio]=num) then busquedaBinaria:=true;
end;

function binariaRecursiva(v:vector;num,primero,ultimo:integer):boolean;
var
    medio:integer;
begin
    if (primero>ultimo) then binariaRecursiva:=false
    else begin
        medio:= (primero+ultimo) div 2;
        if (v[medio]=num) then binariaRecursiva:=true
        else if (num<v[medio]) then
            binariaRecursiva:=binariaRecursiva(v,num,primero,medio-1)
        else
            binariaRecursiva:=binariaRecursiva(v,num,medio+1,ultimo);
    end;
end;

procedure eliminar(var v:vector);
var
	j,i:integer;
begin
    i:=1;
    while ((i<=10) and (v[i]<>35)) do begin
        i+=1;
    end;
    if (i<=10) then begin
        for j := i to 10-1 do begin
            v[j]:=v[j+1];
        end;
    end;
end;

var
    v:vector;
    num,i:integer;
begin
    randomize;
    num:=7;
    cargarEImprimirVector(v);
    //if (binariaRecursiva(v,num,1,10)) then writeln(num,' se encuentra en el vector.')
    //else writeln(num,' no se encuentra en el vector.');
    eliminar(v);
    for i := 1 to 9 do begin
        writeln(v[i]);
    end;
end.