//3. ���� ����������� �����. ����� ����� � ������������ ��� ����.
//uses crt;
var
 n : integer;
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
 writeln('�����: ', e + d + s );
 writeln('������������: ', e * d * s );
 end else
  writeln('Error!!! ������� ������������ ��������!!');

end.

