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

Se almacena la informacion en un vector de paises que tiene un vector de empleados, la cantidad y los maximos. Se utiliza un while para terminar la ejecucion
}
program punto44x4;
type
    codigosEmpleados= 0..2000;
    codigosPais= 1..25;
    empleado = record
        codigoE: codigosEmpleados;
        codigoP : codigosPais;
        antiguedad: integer;
        sueldo: real;
    end;
    vectorEmpleados = array[codigosEmpleados] of empleado;
    infoVector = record
        cantidad:codigosEmpleados;
        maximo:real;
        codigoMaximo:codigosEmpleados;
        empleados:vectorEmpleados;
    end;
    vectorPaises = array [codigosPais] of infoVector;

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

procedure leerEmpleado(var e: empleado);
begin
    writeln('Ingrese codigo de empleado:'); readln(e.codigoE);
    if (e.codigoE<>0) then begin
        writeln('Ingrese codigo de pais del empleado:'); readln(e.codigoP);
        writeln('Ingrese antiguedad de empleado:'); readln(e.antiguedad);
        writeln('Ingrese sueldo de empleado:'); readln(e.sueldo);
    end;
end;

procedure leerEmpleados(var v:vectorPaises);
var
    e:empleado;
    cantidadMenor:integer;
begin
    cantidadMenor:=0;
    leerEmpleado(e);
    while (e.codigoE<>0) do begin
        v[e.codigoP].empleados[e.codigoE]:=e;
        v[e.codigoP].cantidad+=1;
        if (e.sueldo>v[e.codigoP].maximo) then begin
            v[e.codigoP].maximo:=e.sueldo;
            v[e.codigoP].codigoMaximo:=e.codigoE;
        end;
        if ((e.antiguedad>10) and (e.sueldo<1500)) then cantidadMenor+=1;
        leerEmpleado(e);
    end;
    writeln('La cantidad de empleados con mas de 10 anios de antiguedad y un sueldo menor de 1500 dolares es: ',cantidadMenor);
end;

procedure procesarEmpleados(v:vectorPaises);
var
    cantMax:integer;
    maxPais,i:codigosPais;
begin
    cantMax:=-1;
    for i := 1 to 25 do begin
        if (v[i].cantidad>cantMax) then begin
            cantMax:=v[i].cantidad;
            maxPais:=i;
        end;
        writeln('El codigo del empleado con el mejor sueldo del pais con codigo ',i,' es: ',v[i].codigoMaximo);
    end;
    writeln('El pais con mayor cantidad de empleados es: ',maxPais);
end;

var
    v:vectorPaises;
begin
    inicializarVector(v);
    leerEmpleados(v);
    procesarEmpleados(v);
end.