//uses crt;
var
 min, h, m : integer;
begin
 
 write('������ ���������� �����: ');
 readln(min);
 
 h:= min div 60;
 m:= min mod 60;
 
 writeln(min,' ���. - ��� ',h,' ���. ',m,' ���. ');
 
 
end.