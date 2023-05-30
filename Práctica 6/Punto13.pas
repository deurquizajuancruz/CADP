program Punto13Practica6;
type
    usuario = record
        email:string;
        rol:integer;
        revista:string;
        ultimoAcceso:integer;
    end;
    lista=^nodo;
    nodo = record
        elem:usuario;
        sig:lista;
    end;
    vectorRoles = array [1..4] of integer;

{ SE DISPONE
procedure leerUsuario(var u:usuario);
begin
    writeln('Ingrese email: ');
    readln(u.email);
    if (u.email<>'ZZZ') then begin
        writeln('Ingrese revista: ');
        readln(u.revista);
        u.rol:=random(4)+1;
        writeln('Rol: ',u.rol);
        u.ultimoAcceso:=random(100)+1;
        writeln('Ultimo acceso: ',u.ultimoAcceso);
    end;
end;

procedure cargarLista(var l:lista);
var
    u:usuario;
begin
    leerUsuario(u);
    while (u.email<>'ZZZ') do begin
        insertarOrdenado(l,u);
        leerUsuario(u);
    end;
end;}

procedure inicializarVector(var v:vectorRoles);
var
    i:integer;
begin
    for i := 1 to 4 do begin
        v[i]:=0;
    end;
end;

procedure insertarOrdenado(var l:lista; u:usuario);
var
    nue, ant, act:lista;
begin
    new(nue);
    nue^.elem:=u;
    ant:=l;
    act:=l;
    while (act<>nil) and (act^.elem.ultimoAcceso<u.ultimoAcceso) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant=act) then
        l:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure maximos(var max1, max2:integer; var emailMax1, emailMax2:string; dias:integer; email:string);
begin
    if (dias>max1) then begin
        max2:=max1;
        emailMax2:=emailMax1;
        max1:=dias;
        emailMax1:=email;
    end
    else if (dias>max2) then begin
        max2:=dias;
        emailMax2:=email;
    end;
end;

procedure recorrerListaEconomica(l:lista);
begin
    writeln('Usuarios de la revista economica: ');
    while (l<>nil) do begin
        writeln('Nombre de usuario: ',l^.elem.email,' Ultimo acceso hace ',l^.elem.ultimoAcceso,' dias');
        l:=l^.sig;
    end;
end;

procedure procesarLista(l:lista;var economica:lista; var v:vectorRoles);
var
    max1,max2:integer;
    emailMax1,emailMax2:string;
    i:integer;
begin
    max1:=-1;
    max2:=-1;
    while (l<>nil) do begin
        if (l^.elem.revista = 'Economica') then
            insertarOrdenado(economica,l^.elem);
        v[l^.elem.rol]+=1;
        maximos(max1,max2,emailMax1,emailMax2,l^.elem.ultimoAcceso,l^.elem.email);
        l:=l^.sig;
    end;
    recorrerListaEconomica(economica);
    for i := 1 to 4 do begin
        writeln('Cantidad de usuarios del rol numero ',i,': ',v[i]);
    end;
    writeln('El usuario que hace mas no ingresa al portal: ',emailMax1);
    writeln('El segundo usuario que hace mas no ingresa al portal: ',emailMax2);
end;

var
    economica,l:lista;
    v:vectorRoles;
begin
    l:=nil;
    economica:=nil;
    //cargarLista(l);
    inicializarVector(v);
    procesarLista(l,economica,v);
end.