program Punto7Practica7;
type
	subrango=1..5;
	vmaterias=array[subrango] of real;
	alumno=record
	nro:integer;
	apellido:string;
	nombre:string;
	correo:string;
	anioingreso:integer;
	anioegreso:integer;
	notas:vmaterias;
end;
	lista=^nodo;
	nodo=record
	elem:alumno;
	sig:lista;
end;
procedure ordenarvector (var v:vmaterias);
var
	i,j,p:integer;
	item:real;
begin
	for i:=1 to 4 do
		begin
		p:=i;
		for j:=i+1 to 5 do
			if (v[j]>v[p]) then
				p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
		end;
end;
procedure leerinfo(var a:alumno);
var
	i:subrango;
begin
	writeln('Ingrese el numero del alumno: ');
	readln(a.nro);
	if (a.nro<>-1) then
		begin
		writeln('Ingrese el apellido del alumno: ');
		readln(a.apellido);
		writeln('Ingrese los nombres del alumno: ');
		readln(a.nombre);
		writeln('Ingrese el correo del alumno: ');
		readln(a.correo);
		writeln('Ingrese el anio de ingreso del alumno: ');
		readln(a.anioingreso);
		writeln('Ingrese el anio de egreso del alumno: ');
		readln(a.anioegreso);
		for i:=1 to 5 do
			begin
			writeln('Ingrese la nota de la materia numero ',i);
			readln(a.notas[i]);
			end;
		ordenarvector(a.notas);
		end;
end;
procedure agregaradelante(var l:lista;a:alumno);
var
	nue:lista;
begin
	new(nue);nue^.elem:=a;nue^.sig:=nil;
	if (l=nil) then
		l:=nue
	else
		begin
		nue^.sig:=l;
		l:=nue;
		end;
end;
procedure cargarlista(var l:lista);
var
	a:alumno;
begin
	leerinfo(a);
	while (a.nro<>-1) do
		begin
		agregaradelante(l,a);
		leerinfo(a);
		end;
end;
function digitosimpares(nro:integer):boolean;
var
	cantidad,aux,pares,impares:integer;
begin
	cantidad:=0;pares:=0;impares:=0;aux:=0;
	while (nro<>0) do
		begin
		aux:=(nro mod 10);
		cantidad:=cantidad+1;
		if (aux mod 2=0) then
			pares:=pares +1
		else
			impares:=impares+1;
		nro:=nro div 10;
		end;
	if (cantidad=impares) then
		digitosimpares:=true
	else
		digitosimpares:=false;
end;
procedure minimos(var minapellido1,minapellido2,minnombre1,minnombre2,mincorreo1,mincorreo2:string;apellido,nombre,correo:string;var min1,min2:integer;aniorecibo:integer);
begin
	if (aniorecibo<min1) then
		begin
		min2:=min1;
		min1:=aniorecibo;
		minapellido2:=minapellido1;
		minapellido1:=apellido;
		minnombre2:=minnombre1;
		minnombre1:=nombre;
		mincorreo2:=mincorreo1;
		mincorreo1:=correo;
		end
	else
	if (aniorecibo<min2) then
		begin
		min2:=aniorecibo;
		minapellido2:=apellido;
		minnombre2:=nombre;
		mincorreo2:=correo;
		end;
end;
procedure recorrerlista(l:lista);
var
	i:subrango;
	promedionotas:real;
	impares2012,min1,min2:integer;
	minapellido1,minapellido2,minnombre1,minnombre2,mincorreo1,mincorreo2:string;
begin
	impares2012:=0;min1:=100;min2:=100;
	while (l<>nil) do
		begin
		promedionotas:=0;
		for i:=1 to 5 do
			promedionotas:=promedionotas + l^.elem.notas[i];
		writeln('El promedio de las notas de lalumno con nombre ',l^.elem.nombre,' es de: ',(promedionotas/5):4:2);
		if (digitosimpares(l^.elem.nro)=true) and (l^.elem.anioingreso=2012) then
			impares2012:=impares2012 +1;
		minimos(minapellido1,minapellido2,minnombre1,minnombre2,mincorreo1,mincorreo2,l^.elem.apellido,l^.elem.nombre,l^.elem.correo,min1,min2,(l^.elem.anioegreso-l^.elem.anioingreso));
		l:=l^.sig;
		end;
	writeln('La cantidad de alumnos que ingresaron en 2012 y su numero de alumno contiene solo digitos impares es de: ',impares2012);
	writeln('El alumno que tardo menos anios en recibirse tiene como nombre ',minnombre1,' su apellido es ',minapellido1,' y su correo es ',mincorreo1);
	writeln('El segundo alumno que tardo menos anios en recibirse tiene como nombre ',minnombre2,' su apellido es ',minapellido2,' y su correo es ',mincorreo2);
end;
procedure eliminarnumero(var l:lista;nroeliminar:integer;var ok:boolean);
var
	act,ant:lista;
begin
	act:=l;
	while (act<>nil) and (act^.elem.nro<>nroeliminar) do
		begin
		ant:=act;act:=act^.sig;
		end;
	if (act<>nil) then
		begin
		ok:=true;
		if (act=ant) then
			l:=l^.sig
		else
			ant:=act^.sig;
		dispose(l);
		end;
end;
var
	l:lista;
	nroeliminar:integer;
	ok:boolean;
begin
	l:=nil;
	cargarlista(l);
	recorrerlista(l);
	writeln('Ingrese el numero de alumno a eliminar: ');
	readln(nroeliminar);
	eliminarnumero(l,nroeliminar,ok);
	if (ok=true) then
		writeln('El numero fue eliminado correctamente de la lista.')
	else
		writeln('El numero no fue eliminado de la lista ya que no existia en ella.');
end.
