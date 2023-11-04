{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ addstr -- put c in outset[j] if it fits, increment j }
function addstr(c : character; var outset : string;
    var j : integer; maxset : integer) : boolean;
begin
  if (j > maxset) then 
    addstr := false
  else begin
    outset[j] := c;
    j := j + 1;
    addstr := true
  end
end;
