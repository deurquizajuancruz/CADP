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
    while((act<>nil)and (act^.num>v))do begin
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

function mayorAMenor(l:lista):boolean;
var
    num:integer;
begin
    mayorAMenor:=true;
    num:=32760;
    while (l<>nil) and (mayorAMenor) do begin
        if (l^.num<=num) then 
            num:=l^.num
        else
            mayorAMenor:=false;
        l:=l^.sig;
    end;
end;

function menorAMayor(l:lista):boolean;
var
    num:integer;
begin
    menorAMayor:=true;
    num:=-32760;
    while (l<>nil) and (menorAMayor) do begin
        if (l^.num>=num) then 
            num:=l^.num
        else
            menorAMayor:=false;
        l:=l^.sig;
    end;
end;

function estaOrdenada(l:lista):boolean;
begin
    estaOrdenada:=(mayorAMenor(l) or menorAMayor(l));
end;

procedure eliminar(var l:lista; num:integer);
var
    ant,act:lista;
begin
    act:=l;
    while (act<>nil) and (act^.num<>num) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act<>nil) then begin // encontro el elemento
        if (act = l) then // si es la primera posicion, actualizo para que el 1ro sea el 2do
            l:=act^.sig
        else begin // sino, el nodo anterior ahora apunta al siguiente de actual (nodo que contiene el elemento a eliminar)
            ant^.sig:=act^.sig;
        end;
        dispose(act);
    end;
end;

procedure subLista(l:lista; a,b:integer; var nueva:lista);
begin
    while (l<>nil) do begin
        if (l^.num>a) and (l^.num<b) then
            insertarOrdenado(nueva,l^.num);
        l:=l^.sig;
    end;
end;

procedure subListaAscendente(l:lista; a,b:integer; var nueva:lista);
begin
    while (l<>nil) and (l^.num<a)do begin
        l:=l^.sig;
    end;
    if (l<>nil) then begin
        while (l<>nil) and (l^.num>b) do begin
            insertarOrdenado(nueva,l^.num);
            l:=l^.sig;
        end;
    end;
end;

procedure subListaDescendente(l:lista; a,b:integer; var nueva:lista);
begin
    while (l<>nil) and (l^.num>b)do begin
        l:=l^.sig;
    end;
    if (l<>nil) then begin
        while (l<>nil) and (l^.num>a) do begin
            insertarOrdenado(nueva,l^.num);
            l:=l^.sig;
        end;
    end;
end;

var
    pri: lista;
    valor: integer;
begin
    pri := nil;
    writeln('Ingrese un numero: ');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero: ');
        read(valor);
    end;
    imprimirLista(pri);
    writeln(estaOrdenada(pri));
end.