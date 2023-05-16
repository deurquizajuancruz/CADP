program ejercicio6b;
type
    vectorDinamica = array [1..12500] of integer;
    puntero = ^vectorDinamica;
    vectorEstatica = array[1..12498] of integer;
var
    p:puntero;
    vector:vectorEstatica;
begin
    new(p);
    writeln(sizeof(p));
    writeln(sizeof(p^));
    writeln(sizeof(vector));
end.