{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ xclose (fpc windows) -- interface to file close }
procedure xclose (fd : filedesc);
begin
  case (cmdfil[fd]) of
  CLOSED, STDIO:
    ;	{ do nothing }
  FIL1:
    close(file1);
  FIL2:
    close(file2);
  FIL3:
    close(file3);
  FIL4:
    close(file4)
  end;
  cmdopen[cmdfil[fd]] := false;
  cmdfil[fd] := CLOSED
end;
