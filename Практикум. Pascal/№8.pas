// 8. ���� ����������� ����� n. ���������� ���������� ���� ������� ����� � ����� ���� �����.

var
 m,n :integer;
 k : integer;
 sum : integer;
begin
 Write(' ������� ����� �����: ');
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
 
 writeln('� ����� ',n,': ',k,' ����');
 writeln('����� ',sum);
 
end. 