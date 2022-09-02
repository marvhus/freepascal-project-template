program Main;

{$mode objFPC}

uses
    ExtraStuff;

var
   Number : Integer;
begin
   Number := DoStuff(10);
   WriteLn(Number);
end.
