{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ min -- compute minimum of two integers }
function min (x, y : integer) : integer;
begin
  if (x < y) then
    min := x
  else
    min := y
end;
