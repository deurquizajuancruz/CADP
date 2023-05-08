{
Se dispone de datos de empleados de una empresa multinacional. De cada empleado se
conoce su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y
25), la antigüedad en años y el sueldo bruto en dólares. La información se encuentra
ordenada por código de país.
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● el código del empleado que cobra el mejor sueldo en cada país

Se dispone de una estructura de datos que contiene la informacion de todos los paises. Hay que recorrerla, totalizando y sacando maximos, sin leer la informacion
}
program punto34x4;
type
    codigosEmpleados= 1..2000;
    codigosPais= 1..25;
    empleado = record
        codigoE: codigosEmpleados;
        codigoP : codigosPais;
        antiguedad: integer;
        sueldo: real;
    end;
    infoVector = record
        cantidad:integer;
        codigoMaximo:codigosEmpleados;
        cantidadMenor:integer;
    end;
    vectorPaises = array [codigosPais] of infoVector;
    
procedure procesarInfo(v:vectorEmpleados);
var
    i:codigosPais;
    totalCantidad,maxCantidad:integer;
    maxPais:codigosPais;
begin
    totalCantidad:=0;
    for i := 1 to 25 do begin
        if (v[i].cantidad>maxCantidad) then begin
            maxCantidad:=v[i].cantidad;
            maxPais:=i;
        end;
        totalCantidad+=v[i].cantidadMenor;
        writeln('El codigo del empleado con mayor sueldo del pais ',i,' es: ',v[i].codigoMaximo);
    end;
    writeln('La cantidad de empleados con mas de 10 anios de antiguedad y un sueldo menor de 1500 dolares es: ',totalCantidad);
    writeln('El pais con mayor cantidad de empleados es: ',maxPais);
end;

var
    v:vectorEmpleados;
begin
    procesarInfo(v);
end.
