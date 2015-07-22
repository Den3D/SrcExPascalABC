uses GraphABC; 
type mySnow = record 
 x, y : integer; 
 dy, dx : integer; 
 
 end; 
Const N = 100; 
var 
 W, H : integer; 
 sn : array[1..N] of mySnow; 
 veter : integer; 
 fEND : boolean; 
 pSnow : Picture; 
 i : integer; 

{ 
 procedure KeyDown(Key: integer); 
begin 
 case Key of 
 VK_F10 : fEND := true; 
 VK_Left: veter := veter - 1; 
 VK_Right: veter := veter + 1; 
 VK_Down: veter := 0; 
 end; 
end; 
}
 
BEGIN 
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
 sn[ i ].x := sn[ i ].x + sn[ i] .dx + veter; 
 if sn[ i ].y > H then begin 
 sn[ i ].y := -10; 
 sn[ i ].x := Random(3*W)-W; 
 end; 
 end; 
 Redraw; 
// OnKeyDown := KeyDown; 
 until (fEND); 
 
END. 