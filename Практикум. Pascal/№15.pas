
procedure ShowVariant1( n : integer );
var
 n1,n2,n3,n4 : integer; 
begin
 
 n4 := n mod 10;
 n := n div 10;
 
 n3 := n mod 10;
 n := n div 10;
 
 n2 := n mod 10;
 n := n div 10;
 
 n1 := n;
 
 writeln(n1,' ',n2,' ',n3,' ',n4 );
 writeln(n1,' ',n2,' ',n4,' ',n3 );
 writeln(n1,' ',n3,' ',n2,' ',n4 );
 writeln(n1,' ',n3,' ',n4,' ',n3 );
 writeln(n1,' ',n4,' ',n3,' ',n2 );
 writeln(n1,' ',n4,' ',n2,' ',n3 );

 writeln(n2,' ',n1,' ',n3,' ',n4 );
 writeln(n2,' ',n1,' ',n4,' ',n3 );
 writeln(n2,' ',n3,' ',n1,' ',n4 );
 writeln(n2,' ',n3,' ',n4,' ',n2 );
 writeln(n2,' ',n4,' ',n3,' ',n1 );
 writeln(n2,' ',n4,' ',n1,' ',n3 );
 
 writeln(n3,' ',n2,' ',n1,' ',n4 );
 writeln(n3,' ',n2,' ',n4,' ',n1 );
 writeln(n3,' ',n1,' ',n2,' ',n4 );
 writeln(n3,' ',n1,' ',n4,' ',n2 );
 writeln(n3,' ',n4,' ',n2,' ',n1 );
 writeln(n3,' ',n4,' ',n1,' ',n2 );
 
 writeln(n4,' ',n2,' ',n3,' ',n1 );
 writeln(n4,' ',n2,' ',n1,' ',n3 );
 writeln(n4,' ',n3,' ',n2,' ',n1 );
 writeln(n4,' ',n3,' ',n1,' ',n2 );
 writeln(n4,' ',n1,' ',n2,' ',n3 );
 writeln(n4,' ',n1,' ',n3,' ',n2 );

end;

//******************************************************
procedure ShowVariant2(S0,S1 : string);
var I :byte;
begin
  if length(S1)=1 then begin WriteLn(S0+S1); Exit end;
  for i:=1 to length(S1) do 
  ShowVariant2(S0+S1[i],copy(S1,1,I-1)+
                             copy(S1,I+1,length(S1)));
end;
//******************************************************

var
 n : integer;
begin
  
  write('¬ведите число: ');
  readln(n);
  //ShowVariant1(n);
  ShowVariant2('', IntToStr(n));
  
  
  
end. 