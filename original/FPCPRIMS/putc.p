{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ putc (fpc win) -- put one character on standard output }
procedure putc (c : character);
begin
  putcf(c, STDOUT)
end;
