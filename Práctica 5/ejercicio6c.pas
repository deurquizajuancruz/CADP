program ejercicio6c;
type
    vector = array [1..24998] of integer;
    punteroVector = ^vector;
var
    p:punteroVector;
begin
    new(p);
    writeln(sizeof(p));
    writeln(sizeof(p^));
end.