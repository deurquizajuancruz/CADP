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

Se recorre un vector de empleados (que se dispone) y se procesan todos los mismos paises con un corte de control.
}
program punto34x4;
const
    dimf = 10; // se dispone, numero aleatorio
type
    codigosEmpleados= 1..2000;
    codigosPais= 1..25;
    empleado = record
        codigoE: codigosEmpleados;
        codigoP : codigosPais;
        antiguedad: integer;
        sueldo: real;
    end;
    vectorEmpleados = array[codigosEmpleados] of empleado;

procedure procesarInfo(v:vectorEmpleados);
var
    i:codigosEmpleados;
    cantidadPorPais,maxCantidad,cantidadMenor:integer;
    paisActual,maxPais:codigosPais;
    maxSueldo:real;
begin
    cantidadMenor:=0;
    maxCantidad:=-1;
    i:=1;
    while (i<dimf) do begin //se empieza a leer el primer empleado cargado
        paisActual:=v[i].codigoP;
        cantidadPorPais:=0;
        maxSueldo:=-1;
        while ((i<dimf) and (paisActual=v[i].codigoP)) do begin // mientras no se terminen los empleados y el pais sea el mismo
            if ((v[i].antiguedad>10) and (v[i].sueldo<1500)) then cantidadMenor+=1;
            cantidadPorPais+=1;
            if (v[i].sueldo>maxSueldo) then begin
                maxSueldo:=v[i].sueldo;
                codigoMaximo:=v[i].codigoE;
            end;
            i+=1;
        end;
        if (cantidadPorPais>maxCantidad) then begin
            maxCantidad:=cantidadPorPais;
            maxPais:=paisActual;
        end;
        writeln('El codigo del empleado con el mejor sueldo del pais ',paisActual,' es: ',codigoMaximo);
    end;
    writeln('La cantidad de empleados con mas de 10 anios de antiguedad y un sueldo menor de 1500 dolares es: ',cantidadMenor);
    writeln('El pais con mayor cantidad de empleados es: ',maxPais);
end;

var
    v:vectorEmpleados;
begin
    procesarInfo(v);
end.
