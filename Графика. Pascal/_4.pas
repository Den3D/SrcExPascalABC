uses GraphABC;
 
type 
 mySnow = record 
  x, y   : integer; 
  dy, dx : integer;  
 end; 
 
 Const N = 100; 

procedure  Snegok (x,y:integer);
begin
 SetPenColor(clBlack);
 // тело
 ellipse(x-80,y+50,x+80,y+180); 
 circle(x,y,60);
 circle(x,y-90,40);
 
 //----------------------
 //  ведро
 line(x-30,y-210,x+30,y-210);
 line(x-40,y-120,x+40,y-120);
 line(x-30,y-210,x-40,y-120);
 line(x+30,y-210,x+40,y-120);
 
 floodfill(x,y-127,clblack);
 floodfill(x,y-177,clblack);
 
 //---------------------------
 // лицо
 setbrushcolor(clblack);
 
 // глаза
 circle(x-10,y-100,5);
 circle(x+10,y-100,5);
 
 // нос
 line(x, y-90, x+20, y-80);
 line(x, y-80, x+20, y-80);
 line(x, y-90, x,    y-80);
 
 // рот
 setpenwidth(5);
 arc(x,y-75,10,-180,0);
//------------------------------------------ 

 // руки
 line(x-130,y+30,x-30,y-50);
 line(x+30,y-50,x+130,y);
 
  // метла
 line(x+100, y+150, x+150, y-100); 
 line(x+150, y-100, x+120, y-160);
 line(x+150, y-100, x+140, y-160);
 line(x+150, y-100, x+160, y-160);
 line(x+150, y-100, x+180, y-160);
 line(x+150, y-100, x+200, y-160);


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
// x1,y1,x2,y2 : integer;

 sn : array[1..N] of mySnow;
 pSnow : Picture;
 W, H : integer; 
 i : integer;
 fEND : boolean;
 
 
begin

// Elka  (300,-50, 80);
// Snegok(150,300);

 pSnow:=Picture.Create('snow.png'); 
 pSnow.Transparent:=True; 
 
 W := Window.Width; 
 H := Window.Height; 

 for i := 1 to N do begin 
  sn[ i ].x := Random(3*W)-W; 
  sn[ i ].y := Random(H); 
  sn[ i ].dy := Random(3)+1; 
  sn[ i ].dx := Random(3) - 1; 
 end; 
 
 repeat 
  LockDrawing; 
  ClearWindow(clBlue); 
  for i := 1 to N do begin 
   pSnow.Draw(sn[ i ].x, sn[ i ].y); 
   sn[ i ].y := sn[ i ].y + sn[ i ].dy; 
   sn[ i ].x := sn[ i ].x + sn[ i] .dx; 
   if sn[ i ].y > H then begin 
    sn[ i ].y := -10; 
    sn[ i ].x := Random(3*W)-W; 
   end; 
  end; 
 Redraw;
 until (fEND);
 
 
end. 