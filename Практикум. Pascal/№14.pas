
procedure Re(n: integer );
begin
  if n > 1 then Re(n div 2 );
  Write(n mod 2 );   
end;


procedure Re2(n: integer; b: integer );
begin
  if n > 1 then 
    Re2(n div b, b );
  Write(n mod b );   
end;


var
  n, b: integer;

begin
  write('¬ведите число : ');readln(n);
  write('¬ведите систему : ');readln(b);
  Re(n);
  writeln;
  Re2(n, b);
  
  readln;
end.