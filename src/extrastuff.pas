unit ExtraStuff;

{$mode objFPC}

// public -----
interface

   function DoStuff(Num : Integer): Integer;

implementation
// private ----
   var
      Factor : Integer;

   function Multiply(Num : Integer ): Integer;
   begin
      Result := Num * Factor;
   end;

   function DoStuff(Num : Integer): Integer;
   begin
      Result := Multiply(Num);
   end;

   // run when loaded/included
initialization

   begin
      Factor := 2;
   end;

   // executes at program end
finalization

   begin
      WriteLn('Bye!');
   end;

end.
