program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
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

function elementoMaximo(l:lista):integer;
var
    max:integer;
begin
    max:=-32760;
    while (l<>nil) do begin
        if (l^.num>max) then
            max:=l^.num;
        l:=l^.sig;
    end;
    elementoMaximo:=max;
end;

function elementoMinimo(l:lista):integer;
var
    min:integer;
begin
    min:=32760;
    while (l<>nil) do begin
        if (l^.num<min) then
            min:=l^.num;
        l:=l^.sig;
    end;
    elementoMinimo:=min;
end;

function multiplos(l:lista; a:integer):integer;
var
    cant:integer;
begin
    cant:=0;
    while (l<>nil) do begin
        if (l^.num mod a = 0) then
            cant+=1;
        l:=l^.sig;
    end;
    multiplos:=cant;
end;

var
    pri : lista;
    valor : integer;
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
    writeln('El elemento maximo de la lista es: ',elementoMaximo(pri));
    writeln('El elemento minimo de la lista es: ',elementoMinimo(pri));
    writeln('La cantidad de multiplos de 2 es: ', multiplos(pri,2));
end.