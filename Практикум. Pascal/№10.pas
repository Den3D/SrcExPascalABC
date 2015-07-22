// 10. Написать функцию возведения в степень (с использованием рекурсии)

//------------------------------------------------

function Pow1(a,n:real): real;
begin
 Pow1 := power( a, n );
end;
//------------------------------------------------

function Pow2( a, n :real): real;
begin
 Pow2 := exp( n * LN(a));
end;
//------------------------------------------------

function Pow3( a, n :real): real;
var
 i : integer;
 res : Real;
begin
 res := 1;
 for i:= 1 to abs(Trunc(n)) do
   res :=  res * a;
 Pow3 := res;
end;
//------------------------------------------------

function Pow4( a, n :real): real;
var
 i : integer;
 res : Real;
begin
 i:=0;
 res:=1;
 
 while ( abs(Trunc(n)) div 2 > i) do
 begin
  res:= res * sqr(a);
  inc(i);
 end;
 
 if ( Trunc(n) mod 2 <> 0) then res:=res*a;
 
 Pow4:= res;

end;
//------------------------------------------------

function Pow5( a, n :integer): integer;
begin
 if n = 0 then Pow5:=1 else
  if n mod 2 = 0 then Pow5 := Pow5( sqr(a), n div 2) 
   else Pow5:= Pow5(a, n-1)*a;  
end;
//------------------------------------------------

var
 a, n : Real;
 time : Integer;
 res  : Real;  
begin
 Write('Введите число: ');   Readln(a);
 Write('Введите степень: '); Readln(n);
 
 time := Milliseconds;
 res := Pow1(a, n);
 time := Milliseconds - time;
 Writeln('Row1: ',res,'  -  ',time,' милисек');
 
 time := Milliseconds;
 res := Pow2(a, n);
 time := Milliseconds - time;
 Writeln('Row2: ',res,'  -  ',time,' милисек');
 
 time := Milliseconds;
 res := Pow3(a, n);
 time := Milliseconds - time;
 Writeln('Row3: ',res,'  -  ',time,' милисек');
 
 time := Milliseconds;
 res := Pow4(a, n);
 time := Milliseconds - time;
 Writeln('Row4: ',res,'  -  ',time,' милисек');
 
 time := Milliseconds;
 res := Pow5(Trunc(a), Trunc(n));
 time := Milliseconds - time;
 Writeln('Row5: ',res,'  -  ',time,' милисек');

end.