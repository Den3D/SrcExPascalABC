uses 
  GraphABC ;
 
// ������� ���� �����
type
  RootNode = record
    x, y : integer;
  end; 
 
// ����
type
  Car = record
    Mycar: Picture;
    X, Y: integer;    
    Speed: byte;
  end;
 
 // ������� ������
 type
  Entity = record
    x, y : integer;
    Pic: Picture;
  end; 
  
 var
  bgr1: Picture;
  W, H: integer; 
  fEND: boolean;
  Avto: Car;
  camera : RootNode;
  WorldW, WorldH : integer;
  i : integer;
  a :array[1..10000] of Entity;
  ent : Picture;
  
// ���������� ������ �������  
procedure KeyDown(Key: integer);
begin
  Window.Caption := IntToStr(camera.Y);
  case Key of   
    
     //----------------------------------------------------------------------//
     // �������� �����
     VK_Left:  
             if (camera.x > 0 ) then
            if (camera.x < w/2.5)or(WorldW < camera.x + W*1.5 ) then
            begin 
              camera.x := camera.x - Avto.Speed;  
              Avto.x := Avto.x - Avto.Speed; 
            end else
              camera.x := camera.x - Avto.Speed; 
     //----------------------------------------------------------------------//
    
    
    //----------------------------------------------------------------------//
    // �������� ������
    VK_Right: 
            if (camera.x < WorldW - W ) then
            if (camera.x < w/2.5)or(WorldW < camera.x + W*1.5 ) then
            begin 
              camera.x := camera.x + Avto.Speed;  
              Avto.x := Avto.x + Avto.Speed; 
            end else
              camera.x := camera.x + Avto.Speed; 
    //----------------------------------------------------------------------//
  
  //----------------------------------------------------------------------//
  // �������� �����
    VK_Up: if ( camera.y > 0) then
            if (camera.y < H/2.5)or(WorldH < camera.y + H*1.5 ) then
            begin 
              camera.y := camera.y - Avto.Speed;  
              Avto.y := Avto.y - Avto.Speed; 
            end else
              camera.y := camera.y - Avto.Speed; 
    
  //----------------------------------------------------------------------//  
   //----------------------------------------------------------------------//
   // �������� ����
   VK_Down: if ( camera.y < WorldH - H) then
            if (camera.y < H/2.5)or(WorldH < camera.y + H*1.5 ) then
             begin 
               camera.y := camera.y + Avto.Speed;  
               Avto.y := Avto.y + Avto.Speed; 
             end else
              camera.y := camera.y + Avto.Speed; 
  //----------------------------------------------------------------------//
  end;
end;

function isFrustum ( enty : Entity ) : boolean ;
var 
 px, py, ph, pw : integer ;
begin
 px := enty.x;
 py := enty.y;
 pw := enty.pic.Width;
 ph := enty.pic.Height; 
 
 if ((camera.X+W < px)or(px+pw < camera.X)
     or(camera.y+H < py)or (py+ph <  camera.y))
 then isFrustum := false 
 else isFrustum := true;
 
end;

BEGIN
  Window.Width := 625;
  Window.Height := 540;
  W := Window.Width;
  H := Window.Height;
  
  Avto.X := 200;
  Avto.Y := 20; 
  Avto.Speed := 10;
  
  camera.x := Avto.X ;
  camera.y := Avto.Y;
  
  WorldW := 2112;
  WorldH := 2092;
  
  
  bgr1 := Picture.Create('data/bgr_1.jpg');
  Avto.Mycar :=  Picture.Create('data/MyCar_R.png');
  ent := Picture.Create('data/image 29.png');
  
  
  Randomize;
  for i:= 1 to 100 do begin
    a[i].Pic := ent;
    a[i].x := Random (WorldW);
    a[i].y := Random (WorldH);
  end;
  
  
  repeat  
    LockDrawing; 
    Window.Caption := IntToStr(MillisecondsDelta);
     ClearWindow(clBlack); 
     
     var t : System.Drawing.Rectangle ;
     t.X := 0+camera.x;
     t.Y := 0+camera.y;
     t.Width := W;
     t.Height := H;     
     
     //bgr1.Draw(0 - camera.x, 0 - camera.y);
     bgr1.Draw(0, 0, W, H,  t);
     Avto.Mycar.Draw(Avto.X,  Avto.Y);
     
     for i:= 1 to 100 do 
      if (isFrustum(a[i])) then
       a[i].Pic.Draw(a[i].x - camera.x, a[i].y - camera.y);
     
     Redraw;
    UnlockDrawing;
    OnKeyDown   := KeyDown; 
  until (fEND);
    
  
END.
  
  
