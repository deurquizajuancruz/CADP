program ejercicio7;
type
    nombreCiudad = string[50];
    puntero = ^nombreCiudad;
    vectorCiudades = array[1..2500] of puntero; //2.500 * 4 = 10.000
    // vectorCiudades = array[1..2500] of nombreCiudad 2.500 * 51 = 127.500

procedure reservarMemoria(var punteros:vectorCiudades);
var
    i:integer;
begin
    for i := 1 to 2500 do begin
        new(punteros[i]);
    end;
end;

procedure cargarVector(punteros:vectorCiudades;var diml:integer);
var
    ciudad:nombreCiudad;
begin
    writeln('Ingrese nombre de la ciudad. La carga termina con ZZZ: ');
    readln(ciudad);
    while (diml<2500) and (ciudad<>'ZZZ') do begin
        diml+=1;
        punteros[diml]^:=ciudad;
        writeln('Ingrese nombre de la ciudad. La carga termina con ZZZ: ');
        readln(ciudad);
    end;
end;

var
    punteros: vectorCiudades;
    i,diml:integer;
begin
    diml:=0;
    reservarMemoria(punteros); // 2500 * 51 = 127.500 bytes memoria dinamica
    cargarVector(punteros,diml);
    for i := 1 to diml do begin
        writeln(punteros[i]^);
    end;
end.