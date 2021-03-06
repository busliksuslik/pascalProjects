program Stack;

type
    cellptr = ^cell;
    cell = record
        prev : cellptr;
        data : integer;
    end;
var
    last : ^cell;
    c : integer;
    
procedure push(num: integer);
var newCell : ^cell;
begin
    new(newCell);
    newCell^.data := num;
    newCell^.prev := last;
    last := newCell;
end;
function pull(): integer;
var ret : integer;
begin
    ret := last^.data;
    last := last^.prev;
    pull := ret;
end;

begin
    last := nil;
    while not SeekEof do
        begin
            read(c);
            push(c);
        end;
    while last^.prev <> nil do
        begin
            writeln (pull());
        end;
    writeln (pull());
end.

