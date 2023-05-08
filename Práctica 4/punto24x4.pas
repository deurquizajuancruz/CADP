{
Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 0. La información se lee ordenada por código de país.
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país

Se tiene que hacer un corte de control ya que la info se lee ordenada por pais, usar un while porque no se lee el 0, no hace falta un vector. 
El sueldo maximo se calcula dentro del corte de control, la cantidad de empleados una vez que se termina de procesar la cantidad total
}
program punto24x4;
type
    codigosEmpleados= 0..2000;
    codigosPais= 1..25;
    empleado = record
        codigoE: codigosEmpleados;
        codigoP : codigosPais;
        antiguedad: integer;
        sueldo: real;
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

procedure corteDeControl;
var
    e:empleado;
    maxCodigo:codigosEmpleados;
    maxSueldo:real;
    maxCantidad,cantidadPorPais,cantidadMenor:integer;
    maxPais,paisActual:codigosPais;
begin
    leerEmpleado(e);
    cantidadMenor:=0;
    maxCantidad:=-1;
    while (e.codigoE<>0) do begin
        paisActual:=e.codigoP;
        cantidadPorPais:=0;
        maxSueldo:=-1;
        while ((e.codigoE<>0) and (paisActual=e.codigoP)) do begin
            if ((e.antiguedad>10) and (e.sueldo<1500)) then cantidadMenor+=1;
            cantidadPorPais+=1;
            if (e.sueldo>maxSueldo) then begin
                maxSueldo:=e.sueldo;
                maxCodigo:=e.codigoE;
            end;
            leerEmpleado(e);
        end;
        writeln('El codigo del empleado que cobra el mejor sueldo en el pais ',paisActual,' es: ',maxCodigo);
        if (cantidadPorPais>maxCantidad) then begin
            maxCantidad:=cantidadPorPais;
            maxPais:=paisActual;
        end;
    end;
    writeln('La cantidad de empleados con mas de 10 anios de antiguedad y un sueldo menor de 1500 dolares es: ',cantidadMenor);
    writeln('El pais con mayor cantidad de empleados es: ',maxPais);
end;

begin
    corteDeControl;
end.