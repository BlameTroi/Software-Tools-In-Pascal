{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ mustcreate -- create file or die }
function mustcreate (var name : string; mode : integer)
    : filedesc;
var
  fd : filedesc;
begin
  fd := create(name, mode);
  if (fd = IOERROR) then begin
    putstr(name, STDERR);
    error(': can''t create file')
  end;
  mustcreate := fd
end;
