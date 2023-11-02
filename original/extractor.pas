program extractor;

{ a quick hack to split the source files from the addison-wesley
  source tape for software tools in pascal.  the file was downloaded
  from archive.org and its heading/metadata chopped off since it
  didn't follow the documented format of the rest of the archive.

  convert tabs to spaces when the occur at the beginning of a line.
  my standard for pascal indenting is two spaces per indent.

  as with all my code, while there's a copyright notice i consider
  it all public domain as in the unlicense.

  Copyright 2023 by Troy Brumley, all rights reserved. 
  Troy Brumley
  blametroi@gmail.com }

const
  MARKER = '-h-';   { prefix of a file header }

{ file header line is '-h- path size' }
function isheader(s: string): boolean;
begin
  isheader := false;
  if length(s) > 3 then
    isheader := (s[1] = '-') and (s[2] = 'h') and (s[3] = '-');
end;

{ extract path from header line }
function getpath(s: string): string;
var
  i: integer;
  p: string;
begin
  p := '';
  i := 5; { first byte of path }

  while s[i] <> ' ' do begin
    p := p + s[i];
    i := i + 1;
  end;

  getpath := p;
end;

{ skip past path and extract size from header line }
function getsize(s: string): integer;
var
  i: integer;
  n: integer;
begin
  n := 0;
  i := 5; { from first byte of path } 

  repeat
    i := i + 1;
  until s[i] = ' ';

  while i < length(s) do begin
    i := i + 1;
    n := (n * 10) + ord(s[i]) - ord('0');
  end;

  getsize := n;
end;

var
  ifile: text;
  ofile: text;
  iline: string;
  oname: string;
  i, j: integer;
  s, t: string;
  osize: integer;
  f: boolean;

begin

  assign(ifile, 'softwaretools.txt');
  reset(ifile);
  writeln('begin processing...');
  oname := '';
  osize := 0;

  while not eof(ifile) do begin

    readln(ifile, iline);
    if isheader(iline) then begin
      if oname <> '' then begin
        writeln('closing "', oname, '" with remaining size ', osize);
        close(ofile);
      end;
      oname := getpath(iline);
      osize := getsize(iline);
      writeln('header: "', iline, '"');
      writeln('  path: "', oname, '"');
      writeln('  size: "', osize, '"');
      writeln('opening "', oname, '" with remaining size ', osize);
      assign(ofile, oname);
      rewrite(ofile);
    end else begin
      osize := osize - length(iline) - 1; { remember newline }
      f := false;
      for i := 1 to length(iline) do
        if (not f) and (iline[i] = chr(9)) then
          write(ofile, '  ')
        else begin
          write(ofile, iline[i]);
          f := true;
        end;
      writeln(ofile);
    end;
    
  end;

  writeln('end of input...');
  writeln('closing "', oname, '" with remaining size ', osize);
  close(ofile);
  close(ifile);
  writeln('files closed...');

end.
