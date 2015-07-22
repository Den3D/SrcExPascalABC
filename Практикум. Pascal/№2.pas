//uses crt;
var
 min, h, m : integer;
begin
 
 write('Ведите крличество минут: ');
 readln(min);
 
 h:= min div 60;
 m:= min mod 60;
 
 writeln(min,' мин. - это ',h,' час. ',m,' мин. ');
 
 
end.