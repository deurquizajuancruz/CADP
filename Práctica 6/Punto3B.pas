program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num:integer;
        sig:lista;
    end;

procedure agregarAlFinal(var pri,ult: lista; v: integer);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if (l = nil) then begin
        pri:=nuevo;
        ult:=nuevo;
    end
    else begin
        ult^.sig:=nuevo;
        ult:=nuevo;
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
    pri,ult:lista;
    valor:integer;
begin
    pri:=nil;
    ult:=nil;
    writeln('Ingrese un numero: ');
    read(valor);
    while (valor <> 0) do begin
        agregarAlFinal(pri,ult,valor);
        writeln('Ingrese un numero: ');
        read(valor);
    end;
    imprimirLista(pri);
    incrementar(5,pri);
    imprimirLista(pri);
end.