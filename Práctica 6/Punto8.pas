program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure insertarOrdenado(var l:lista; v:integer);
var
    ant,act,nue:lista;
begin
    new(nue);
    nue^.num:=v;
    ant:=l;
    act:=l;
    while((act<>nil)and (act^.num<v))do begin
        ant:=act;
        act:=act^.sig;
    end; 
    if(ant=act)then
        l:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure imprimirLista(l:lista);
begin
    while (l<>nil) do begin
        writeln(l^.num);
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
        insertarOrdenado(pri, valor);
        writeln('Ingrese un numero: ');
        read(valor);
    end;
    imprimirLista(pri);
end.