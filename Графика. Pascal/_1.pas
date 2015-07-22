uses GraphABC;

procedure  Snegok ( x:integer; y:integer ) ;
 var r,i, tr :integer; 
begin
 r := 30;
 tr := r;
 for i:=1 to 3 do
  begin
   Circle ( x, y, r );
   r := r + tr;
   y := y + r*2 - tr;   
  end;
end;


procedure  Elka ( x:integer; y:integer; size :integer );
var
 i,j,ty : integer;
 x0,y0 : integer;
begin
 
for j:= 1 to 3 do begin
 ty:= size*j;
 for i:= 1 to size do
 begin
  Pen.Color := RGB(0,100,0);
  Line(size-i+x, i+y+ty, size+i+x, i+y+ty);
 end; 
 end;
 
 //x0:= 
 
 //y0:=
 
 SetPenColor(clBrown);
 Rectangle(x,y,x+10,y+10 );
 
end;


var
 x1,y1,x2,y2 : integer;
 
begin

 //Snegok (300,50);
 Elka (100, 100, 50);
 

 
end. 