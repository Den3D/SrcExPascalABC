// 11. �������� ������� ��������� �� ��������� �������� ���������.
uses crt;

function Mul(a, b: integer ): integer;
var
  i, res: integer;
begin
  res := 0;
  for i := 1 to b do
    res := res + a;
  Mul := res; 
end;

function Mul2(a, b: integer ): integer;
var
  n, res, acc: integer;
begin
  res := 0;
  while (b > 0) do
  begin
    n := 1;
    acc := a;
    while (n + n <= b) do
    begin
      acc := acc + acc;
      n := n + n;
    end;
    res := res + acc;
    b := b - n;
  end;
  Mul2 := res; 
end;

var
  time: integer;
  a, b: integer;

begin
  a := 2;
  b := 3000000;
  time := Milliseconds;
  writeln('������ 1: ', a * b );
  time := Milliseconds - time;
  writeln('�����: ', time);
  
  time := Milliseconds;
  writeln('������ 2: ', Mul(a, b));
  time := Milliseconds - time;
  writeln('�����: ', time);
  
  time := Milliseconds;
  writeln('������ 3: ', Mul2(a, b));
  time := Milliseconds - time;
  writeln('�����: ', time);
 
  
end.