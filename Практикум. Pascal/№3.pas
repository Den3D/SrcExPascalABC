//3. Äàíî òğåõçíà÷íîå ÷èñëî. Íàéòè ñóììó è ïğîèçâåäåíèå åãî öèôğ.
//uses crt;
var
 n : integer;
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
 writeln('Ñóììà: ', e + d + s );
 writeln('Ïğîèçâåäåíèå: ', e * d * s );
 end else
  writeln('Error!!! Ââåäåíî íåïğàâåëüíîå çíà÷åíèå!!');

end.

