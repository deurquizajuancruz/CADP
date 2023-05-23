program punteros;
type
    cadena = string[9];
    producto = record
        precio: real;
        codigo: integer;
        descripcion: cadena;
    end;
    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes'); // 1
    writeln(sizeof(prod), ' bytes'); // 2
    new(p);
    writeln(sizeof(p), ' bytes'); // 3
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes'); // 4
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes'); // 5
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes'); // 6
end.