{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ isdigit -- true if c is a digit }
function isdigit (c : character) : boolean;
begin
  isdigit := c in [ord('0')..ord('9')]
end;
