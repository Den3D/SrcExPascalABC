// 6.  Даны три числа. Посчитать количество четных чисел.

var
 i, k  : integer;
 a : array[1..3] of byte; 
begin
 i:=0;
 k:=0;
 while ( i < 3 ) do
  begin
   i:=i+1;
   Write('Введите ',i,'-е число: ');
   readln(a[i]);     
  end;

  for i:= 1 to 3  do
  begin
   if (a[i] mod 2=0) then inc(k);
 end;
 
 writeln('Количество четных чисел: ', k);

end.