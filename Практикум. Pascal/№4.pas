//4. ���� ����������� �����. �������� ����� � �������� �������.

//uses crt;
var
 n, q : integer;
 e,d,s : integer;
begin
 Write('������� ���������� �����: '); 
 ReadLn( n );
 
 if ( n > 99 ) and ( n < 1000 ) then
 begin
  e :=  n mod 10;
  d := (n div 10) mod 10;
  s :=  n div 100;
     
 writeln( e,' ',d,'  ',s );
 
 q := (e*100)+(d*10)+s;
 writeln('����� �����: ',q);

 end else
  writeln('Error!!! ������� ������������ ��������!!');

end.