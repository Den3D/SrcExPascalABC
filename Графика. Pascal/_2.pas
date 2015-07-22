uses GraphABC;

procedure  Snegok ( x:integer; y:integer; size : integer ) ;
 var r,i, tr :integer; 
begin
 r := size;
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
 
 x0:=size+x;
 y0:=size+y+(size*3);
 
 SetPenColor(clBrown);
 Rectangle(x0-7,y0,x0+7,y0+50 );
 FloodFill(x0,y0+10, clBrown );
 
end;


var
 x1,y1,x2,y2 : integer;
 
begin

 Snegok(250,100, 20);
 Elka  (300,-50, 80);
 

 
end. 