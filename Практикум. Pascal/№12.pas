uses crt;

function NodEvklid1(a,b:integer):integer;
begin
 while (a<>b) do
  if a>b then a:=a-b else b:=b-a; 
 NodEvklid1:=a 
end;

function NodEvklid2(a,b:integer):integer;
begin
 
 while (a<>0)and(b<>0) do
  if a>b then a:=a mod b else b:=b mod a; 
  
 NodEvklid2:=a+b; 
end;


function BinaryNod(a,b:integer):integer;
var 
 k: integer;
 begin
 k:=1;
 while(a<>0)and(b<>0)do
 begin
  while (a mod 2=0)and(b mod 2=0) do
  begin
   a:= a div 2;
   b:= b div 2;
   k:= k * 2;
  end;
  
  while (a mod 2 = 0) do a:=a div 2;
  while (b mod 2 = 0) do b:=b div 2;
  if a>=b then a:=a-b else b:=b-a;
 end;
  
  BinaryNod:= b*k; 
 end;
 
 
 
 function NodEvklid1R(a,b:integer):integer;
begin

  if (a * b = 0)then NodEvklid1R:=a+b else
 if a>b then  NodEvklid1R:=NodEvklid1R(a-b, b) else 
   NodEvklid1R:=NodEvklid1R(a, b-a); 
end;
    
/////////////////////////////////////////////////
var
 time, temp : integer;
 a, b : integer;
BEGIN
 write('A :'); readln(a);
 write('B :'); readln(b);
 writeln('Алгоритм Евклида (вычитание)');
  time := Milliseconds;
  temp := NodEvklid1(a,b);
  time := Milliseconds - time;
  writeln('NOD = ' ,temp );
  writeln('Время: ', time );
  
 writeln('Алгоритм Евклида (деление)');
  time := Milliseconds;
  temp := NodEvklid2(a,b);
  time := Milliseconds - time;
  writeln('NOD = ' ,temp );
  writeln('Время: ', time );
  
 writeln('Алгоритм BinaryNod');
  time := Milliseconds;
  temp := BinaryNod(a,b);
  time := Milliseconds - time;
  writeln('NOD = ' ,temp );
  writeln('Время: ', time ); 
  
  
 writeln('Алгоритм NodEvklid1R');
  time := Milliseconds;
  temp := NodEvklid1R(a,b);
  time := Milliseconds - time;
  writeln('NOD = ' ,temp );
  writeln('Время: ', time ); 
  
END.



