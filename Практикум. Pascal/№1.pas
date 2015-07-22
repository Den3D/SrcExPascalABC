
procedure Method1;
var
 a, b, c : integer;
begin
 a := 12;
 b := 5;
 
 c := a;
 a := b;
 b := c;
 
 writeln ('a= ',a);
 writeln ('b= ',b);
end;
 
 
procedure Method2;
var
 a, b : integer;
begin
 a := 12;
 b := 5;
 
 a := a + b; //12+5 = 17
 b := a - b; //17-5 = 12
 a := a - b; //17-12 = 5
 

 
 writeln ('a= ',a);
 writeln ('b= ',b);
end; 
 
 
begin
Method1;
writeln;
Method2;


end. 