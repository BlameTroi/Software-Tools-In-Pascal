{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ getc (fpc win) -- get one character from standard input }
function getc (var c : character) : character;
begin
  getc := getcf(c, STDIN)
end;
