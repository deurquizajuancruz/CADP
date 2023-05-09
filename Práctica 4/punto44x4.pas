{
Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 0.
Realizar un programa que lea y almacene la información de los empleados en una
estructura de datos adecuada. Una vez completada la carga, procese la información de los
empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● el código del empleado que cobra el mejor sueldo en cada país

Se tiene un vector de empleados. Hay que cargarlo hasta cierto punto (diml) y despues procesar toda la informacion
}
program punto44x4;
type
    codigosEmpleados= 1..2000;
    codigosPais= 1..25;
    empleado = record
        codigoE: integer;
        codigoP : codigosPais;
        antiguedad: integer;
        sueldo: real;
    end;
    vectorEmpleados = array [codigosEmpleados] of empleado;
    infoVector = record
        cantidad:integer; // integer porque si se pone codigosEmpleados no se puede asignar 0 al inicializar el vector
        maximo:real;
        codigoMaximo:integer; // integer porque si se pone codigosEmpleados no se puede asignar 0 al inicializar el vector
    end;
    vectorPaises = array [codigosPais] of infoVector;

procedure leerEmpleado(var e: empleado);
begin
    writeln('Ingrese codigo de empleado:'); readln(e.codigoE);
    if (e.codigoE<>0) then begin
        writeln('Ingrese codigo de pais del empleado:'); readln(e.codigoP);
        writeln('Ingrese antiguedad de empleado:'); readln(e.antiguedad);
        writeln('Ingrese sueldo de empleado:'); readln(e.sueldo);
    end;
end;

procedure cargarVector(var v:vectorEmpleados;var diml:integer);
var
    e:empleado;
begin
    leerEmpleado(e);
    while (e.codigoE<>0) do begin
        diml+=1;
        v[diml]:=e;
        leerEmpleado(e);
    end;
end;

procedure inicializarVector(var v:vectorPaises);
var
    i:codigosPais;
begin
    for i := 1 to 25 do begin
        v[i].cantidad:=0;
        v[i].maximo:=-1;
        v[i].codigoMaximo:=0;
    end;
end;

procedure procesarInfo(v:vectorEmpleados; var vPaises:vectorPaises; diml:integer);
var
    i:codigosEmpleados;
    cantidadMax,cantidadMenor:integer;
    maxPais:codigosPais;
begin
    cantidadMenor:=0;
    cantidadMax:=-1;
    for i := 1 to diml do begin
        vPaises[v[i].codigoP].cantidad+=1;
        if ((v[i].antiguedad>10) and (v[i].sueldo<1500)) then cantidadMenor+=1;
        if (v[i].sueldo>vPaises[v[i].codigoP].maximo) then begin
            vPaises[v[i].codigoP].maximo:=v[i].sueldo;
            vPaises[v[i].codigoP].codigoMaximo:=v[i].codigoE;
        end;
    end;
    writeln('La cantidad de empleados con mas de 10 anios de antiguedad y un sueldo menor de 1500 dolares es: ',cantidadMenor);
    for i := 1 to 25 do begin
        writeln('El codigo del empleado con el mejor sueldo del pais con codigo ',i,' es: ',vPaises[i].codigoMaximo);
        if (vPaises[i].cantidad>cantidadMax) then begin
            cantidadMax:=vPaises[i].cantidad;
            maxPais:=i;
        end;
    end;
    writeln('El pais con mayor cantidad de empleados es: ',maxPais);
end;

var
    v:vectorEmpleados;
    diml:integer;
    vPaises:vectorPaises;
begin
    diml:=0;
    inicializarVector(vPaises);
    cargarVector(v,diml);
    procesarInfo(v,vPaises,diml);
end.