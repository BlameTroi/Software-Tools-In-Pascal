{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ isalphanum -- true if c is letter or digit }
function isalphanum (c : character) : boolean;
begin
  isalphanum := c in
    [ord('a')..ord('z'),
     ord('A')..ord('Z'),
     ord('0')..ord('9')]
end;
