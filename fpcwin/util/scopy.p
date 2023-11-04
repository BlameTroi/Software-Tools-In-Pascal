{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ scopy -- copy string at src[i] to dest[j] }
procedure scopy (var src : string; i : integer;
    var dest : string; j : integer);
begin
  while (src[i] <> ENDSTR) do begin
    dest[j] := src[i];
    i := i + 1;
    j := j + 1
  end;
  dest[j] := ENDSTR
end;
