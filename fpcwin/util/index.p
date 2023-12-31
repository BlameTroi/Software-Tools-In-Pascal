{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ index -- find position of character c in string s }
function index (var s : string; c : character) : integer;
var
  i : integer;
begin
  i := 1;
  while (s[i] <> c) and (s[i] <> ENDSTR) do
    i := i + 1;
  if (s[i] = ENDSTR) then
    index := 0
  else
    index := i
end;
