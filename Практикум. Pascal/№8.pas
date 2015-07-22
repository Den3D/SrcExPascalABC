// 8. Дано натуральное число n. Подсчитать количество цифр донного числа и сумму цифр числа.

var
 m,n :integer;
 k : integer;
 sum : integer;
begin
 Write(' Введите целое число: ');
 Readln(n);
 m := n;
 k := 0;
 sum := 0;
 
 While m <> 0 do
 begin
  Inc(k);
  sum :=  sum + (m mod 10);
  m := m div 10; 
 end;
 
 writeln('В числе ',n,': ',k,' цифр');
 writeln('Сумма ',sum);
 
end. 