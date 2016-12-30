uses 
  GraphABC ;
 
// главный узел сцены
type
  RootNode = record
    x, y : integer;
  end; 
 
// авто
type
  Car = record
    Mycar: Picture;
    X, Y: integer;    
    Speed: byte;
  end;
 
 // простой объект
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
  a :array[1..100] of Entity;
  ent : Picture;
  
// обработчик нажати¤ клавиши  
procedure KeyDown(Key: integer);
begin
  Window.Caption := IntToStr(camera.Y);
  case Key of   
    
     //----------------------------------------------------------------------//
     // движение влево
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
    // движение вправо
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
  // движение вверх
    VK_Up: if ( camera.y > 0) then
            if (camera.y < H/2.5)or(WorldH < camera.y + H*1.5 ) then
            begin 
              camera.y := camera.y - Avto.Speed;  
              Avto.y := Avto.y - Avto.Speed; 
            end else
              camera.y := camera.y - Avto.Speed; 
    
  //----------------------------------------------------------------------//  
   //----------------------------------------------------------------------//
   // движение вниз
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
  for i:= 1 to 30 do begin
    a[i].Pic := ent;
    a[i].x := Random (WorldW);
    a[i].y := Random (WorldH);
  end;
  
  
  repeat  
    LockDrawing; 
     ClearWindow(clBlack);  
     bgr1.Draw(0 - camera.x, 0 - camera.y);
     Avto.Mycar.Draw(Avto.X,  Avto.Y);
     
     for i:= 1 to 30 do 
       a[i].Pic.Draw(a[i].x - camera.x, a[i].y - camera.y);
     
     Redraw;
    UnlockDrawing;
    OnKeyDown   := KeyDown; 
  until (fEND);
    
  
END.
  
  
