{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ Copyright 2023 by Troy Brumley, all rights reserved. }
{ initcmd (fpc win) -- read command line and redirect files }
procedure initcmd;
var
  fd : filedesc;
  fname : xstring;
  ft : filtyp;
  idx : 1 .. MAXSTR;
  junk : boolean;
begin
  cmdfil[STDIN] := STDIO;
  cmdfil[STDOUT] := STDIO;
  cmdfil[STDERR] := STDIO;
  for fd := succ(STDERR) to MAXOPEN do
    cmdfil[fd] := CLOSED;
  write('$ ');
  for ft := FIL1 to FIL4 do
    cmdopen[ft] := false;
  kbdn := 0;
  { txb: parsing from a command line on stdin, change
        to use paramstr and paramcount }
  if (not getline(cmdlin, STDIN, MAXSTR)) then
    exit(program);
  cmdargs := 0;
  idx := 1;
  while ((cmdlin[idx] <> ENDSTR)
    and (cmdlin[idx] <> NEWLINE)) do begin
    while (cmdlin[idx] = BLANK) do
      idx := idx + 1;
    if (cmdlin[idx] <> NEWLINE) then begin
      cmdargs := cmdargs + 1;
      cmdidx[cmdargs] := idx;
      while ((cmdlin[idx] <> NEWLINE)
        and (cmdlin[idx] <> BLANK)) do
        idx := idx + 1;
      cmdlin[idx] := ENDSTR;
      idx := idx + 1;
      if (cmdlin[cmdidx[cmdargs]] = LESS) then begin
        xclose(STDIN);
        cmdidx[cmdargs] := cmdidx[cmdargs] + 1;
        junk := getarg(cmdargs, fname, MAXSTR);
        fd := mustopen(fname, IOREAD);
        cmdargs := cmdargs - 1;
      end
      else if (cmdlin[cmdidx[cmdargs]] = GREATER) then begin
        xclose(STDOUT);
        cmdidx[cmdargs] := cmdidx[cmdargs] + 1;
        junk := getarg(cmdargs, fname, MAXSTR);
        fd := mustcreate(fname, IOWRITE);
        cmdargs := cmdargs - 1;
      end
    end
  end
end;
