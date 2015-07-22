//5. Äàíî òğåõçíà÷íîå ÷èñëî. Íàéòè ìàõ èç òğåõ ÷èñåë.

//uses crt;

function Max3(a,b,c : integer): integer;
var 
 max : integer;
begin
 if ( a > b )and (a > c ) then max:= a else
    if ( b > a )and(b>c) then max := b else
      if (c>a) and (c>b) then max := c;
       
Max3 := max;
end;

var
 n, q : integer;
 e,d,s : integer;
begin
 Write('Ââåäèòå òğåõíà÷íîå ÷èñëî: '); 
 ReadLn( n );
 
 if ( n > 99 ) and ( n < 1000 ) then
 begin
  e :=  n mod 10;
  d := (n div 10) mod 10;
  s :=  n div 100;
     
 writeln( e,' ',d,'  ',s );

  
 writeln( Max3(s,d,e));

 end else
  writeln('Error!!! Ââåäåíî íåïğàâåëüíîå çíà÷åíèå!!');

end.