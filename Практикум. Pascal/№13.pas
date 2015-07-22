uses crt;

function fact1( x : integer) : integer;
var
 i, s :integer;
begin
 s:=1;
   for i:=1 to x do  s:=s*i;
 fact1:= s;
end;

function fact2( x : integer) : integer;
begin
 if x=1 then  fact2:=1 else
  fact2 := fact2(x-1)*x; 
end;


var
 n : integer;
BEGIN
write('¬ведите N: '); readln(n);
writeln(n,'!= ',fact1(n));
writeln(n,'!= ',fact2(n));

END.