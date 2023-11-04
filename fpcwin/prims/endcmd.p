{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ endcmd (fpc win) -- close all files on exit }
procedure endcmd;
var
  fd : filedesc;
begin
  for fd := STDIN to MAXOPEN do
    xclose(fd)
end;
