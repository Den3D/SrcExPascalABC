// 7. —реди четырехзначных чисел выбрать те, у которых все четыре цифры различны.

function True3( x : integer): boolean;
var 
 bool : boolean;
 j1, j2 : integer;
begin
 
  j1 := x mod 100;
  j2 := x div 100;
  
  bool := ( j1 mod 10 <> j1 div 10 ) and
          ( j2 mod 10 <> j2 div 10 ) and
          ( j1 mod 10 <> j2 mod 10 ) and
          ( j1 div 10 <> j1 div 10 )
  ;

       
 True3 := bool;
end;

var
 
 n, i : integer;
begin
 Write('¬ведите трехначное число: '); 
 ReadLn( n );
 
 if ( n > 999 ) and ( n < 10000 ) then
 begin
 

  if True3( n ) then writeln ('True') else writeln (' False ');

 end else
  writeln('Error!!! ¬ведено неправельное значение!!');

end.