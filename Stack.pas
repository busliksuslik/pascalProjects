program Stack;

type
    cellptr = ^cell;
    cell = record
        prev : cellptr;
        data : integer;
    end;
        
var
    last : ^cell;
    
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
  push(10);
  push(13);
  push(17);
  writeln (pull());
  writeln (pull());
  writeln (pull());
end.

