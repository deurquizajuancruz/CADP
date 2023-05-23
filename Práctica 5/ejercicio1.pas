program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	writeln(sizeof(pc), ' bytes'); // 1
	new(pc);
	writeln(sizeof(pc), ' bytes'); // 2
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc), ' bytes'); // 3
	writeln(sizeof(pc^), ' bytes'); // 4
	pc^:= 'otro nuevo nombre distinto al anterior';
	writeln(sizeof(pc^), ' bytes'); // 5
end.