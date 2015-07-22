// 9. Решить квадратное уравнение ax^2 +bx+c = 0.


procedure sq(a, b, c: real);
var
  d, x1, x2: real;
begin
  d := b * b - 4 * a * c;
  if d >= 0 then begin
    x1 := (-b + sqrt(d)) / (2 * a);
    x2 := (-b - sqrt(d)) / (2 * a);
    
    if x1 = x2 then
      writeln('x = ', x1:6:2)
    else
      writeln('x1 = ', x1:6:2, '; x2 = ', x2:6:2);
  end
  else
    writeln('Корней нет!');
end;


//-----------------------------------------------

var
  a, b, c: real;
begin
  
  write('a = '); readln(a);
  write('b = '); readln(b);
  write('c = '); readln(c);
  
 if a = 0 then Writeln('Неверный коэффициент') else 
  begin
   // writeln(a:6:2, 'x*x + ', b:6:2, 'x + ', c:6:2, ' = 0'); 
    sq(a, b, c);
  end;  
end.