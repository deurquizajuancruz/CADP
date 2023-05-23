program punteros;
type
    numeros = array[1..10000] of integer;
    puntero_numeros = ^numeros;
var
    n: puntero_numeros;
    num: numeros;
    i:integer;
begin
    writeln(sizeof(n), ' bytes'); // 1
    writeln(sizeof(num), ' bytes'); // 2
    new(n);
    writeln(sizeof(n^), ' bytes'); // 3
    for i:= 1 to 5000 do
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes'); // 4
end.
