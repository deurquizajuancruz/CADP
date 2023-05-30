program Punto12Practica6;
type
    dispositivo = record
        android: real;
        pulgadas: real;
        ram: integer;
    end;
    lista = ^nodo;
    nodo = record
        elem: dispositivo;
        sig: lista;
    end;

procedure leerDispositivo(var d:dispositivo);
begin
    writeln('Ingrese version de Android: ');
    readln(d.android);
    if (d.android<>0) then begin
        writeln('Ingrese GB de RAM: ');
        readln(d.ram);
        writeln('Ingrese tamanio en pulgadas: ');
        readln(d.pulgadas);
    end;
end;

procedure insertarOrdenado(var l:lista; d:dispositivo);
var
    nue, ant, act:lista;
begin
    new(nue);
    nue^.elem:=d;
    ant:=l;
    act:=l;
    while (act<>nil) and (act^.elem.android<d.android) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant=act) then
        l:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure cargarLista(var l:lista);
var
    d:dispositivo;
begin
    leerDispositivo(d);
    while (d.android<>0) do begin
        insertarOrdenado(l,d);
        leerDispositivo(d);
    end;
end;

procedure procesarLista(l:lista);
var
    tamanioTotal,actual: real;
    cantidadTotal,cantidadMemoria, cantidadAndroid: integer;
begin
    tamanioTotal:=0;
    cantidadTotal:=0;
    cantidadMemoria:=0;
    while (l<>nil) do begin
        actual:=l^.elem.android;
        cantidadAndroid:=0;
        while (l<>nil) and (l^.elem.android=actual) do begin
            cantidadAndroid+=1;
            tamanioTotal+=l^.elem.pulgadas;
            if (l^.elem.ram>3) and (l^.elem.pulgadas<=5) then
                cantidadMemoria+=1;
            l:=l^.sig;
        end;
        writeln('La cantidad de dispositivos para la version ',actual:0:2,' es de: ',cantidadAndroid);
        cantidadTotal+=cantidadAndroid;
    end;
    writeln('El tamanio promedio de todos los dispositivos es: ',(tamanioTotal/cantidadTotal):0:2);
    writeln('La cantidad de dispositivos con mas de 3 GB de ram y a lo sumo 5 pulgadas es: ',cantidadMemoria);
end;

var
    l:lista;
begin
    l:=nil;
    cargarLista(l);
    procesarLista(l);
end.