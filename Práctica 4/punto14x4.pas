{
Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 1, el cual debe procesarse.
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país

Se tiene que usar un repeat until ya que se debe procesar el codigo 1. Se debe usar un vector para ir almacenando la informacion de cada pais (cantidad y maximos)
}
program punto14x4;
type
    codigosEmpleados= 0..2000;
    codigosPais= 1..25;
    empleado = record
        codigoE: codigosEmpleados;
        codigoP : codigosPais;
        antiguedad: integer;
        sueldo: real;
    end;
    infoVector = record
        cantidad:integer;
        maximo:real;
        codigoMaximo:codigosEmpleados;
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
    writeln('Ingrese codigo de pais del empleado:'); readln(e.codigoP);
    writeln('Ingrese antiguedad de empleado:'); readln(e.antiguedad);
    writeln('Ingrese sueldo de empleado:'); readln(e.sueldo);
end;

procedure procesarEmpleados(var v:vectorPaises);
var
    cantidadMenor: integer;
    e: empleado;
begin
    cantidadMenor:=0;
    repeat
        leerEmpleado(e);
        v[e.codigoP].cantidad+=1;
        if ((e.antiguedad>10) and (e.sueldo<1500)) then cantidadMenor+=1;
        if (e.sueldo>v[e.codigoP].maximo) then begin
            v[e.codigoP].maximo:=e.sueldo;
            v[e.codigoP].codigoMaximo:=e.codigoE;
        end;
    until (e.codigoE=1);
    writeln('La cantidad de empleados con mas de 10 anios de antiguedad y un sueldo menor de 1500 dolares es: ',cantidadMenor);
end;

procedure recorrerVector(v:vectorPaises);
var
    maxPais,i:codigosPais;
    cantidadMax:integer;
begin
    cantidadMax:=-1;
    for i := 1 to 25 do begin
        writeln('El codigo del empleado con el mejor sueldo del pais con codigo ',i,' es: ',v[i].codigoMaximo);
        if (v[i].cantidad>cantidadMax) then begin
            cantidadMax:=v[i].cantidad;
            maxPais:=i;
        end;
    end;
    writeln('El pais con mayor cantidad de empleados es: ',maxPais);
end;

var
    v:vectorPaises;
begin
    randomize;
    inicializarVector(v);
    procesarEmpleados(v);
    recorrerVector(v);
end.