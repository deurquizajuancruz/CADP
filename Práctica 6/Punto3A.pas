program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure agregarAtras(var l: lista; v: integer);
var
    nuevo,aux: lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if (l = nil) then
        l:=nuevo
    else begin
        aux:=l;
        while (aux^.sig<>nil) do begin
            aux:=aux^.sig;
        end;
        aux^.sig:=nuevo;
    end;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

procedure incrementar(valor:integer; l:lista);
begin
    while (l<>nil) do begin
        l^.num+=valor;
        l:=l^.sig;
    end;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero: ');
    read(valor);
    while (valor <> 0) do begin
        agregarAtras(pri, valor);
        writeln('Ingrese un numero: ');
        read(valor);
    end;
    imprimirLista(pri);
    incrementar(5,pri);
    imprimirLista(pri);
end.