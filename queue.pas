type
    cellptr = ^cell;
    cell = record
        next : cellptr;
        data : integer;
    end;
var
    last, first : ^cell;
    c : integer;

procedure push(num: integer);
var newCell : ^cell;
begin
    last^.data := num;
    new(newCell);
    last^.next := newCell; 
    last := newCell;
    last^.next := nil;
end;

procedure dumpAll;
var tmp : integer;
    tmpcell : ^cell;
begin
    tmpcell := first;
    while tmpcell^.next <> nil do
    begin
        writeln(tmpcell^.data);
        tmpcell := tmpcell^.next
    end;
end;

begin
    new(first);
    last := first;
    while not SeekEof do
        begin
            read(c);
            push(c);
        end;
        dumpAll;
        dumpAll;
end.