uses GraphABC;

type
  Storona = (Left, Right, Up, Down);

type
  Car = record
    X, Y  : integer; 
    Mycar : Picture;
    Poloj : Storona;
    Speed : byte; 
  end; 
  
  
var
  fEND: boolean;
  bgr1, bgr2, bgr3, bgrcol: Picture;
  Avto : Car;
  TrainPic  : Car;
  i, j : integer;
  
  fColl : boolean := true;
  ColorColl : Color;  


procedure LoadCar(poloj: Storona );
begin
  case poloj of
    Left:  Avto.Mycar.Load('data/Car/MyCar_L.png');
    Right: Avto.Mycar.Load('data/Car/MyCar_R.png');
    Up:    Avto.Mycar.Load('data/Car/MyCar_Up.png');
    Down:  Avto.Mycar.Load('data/Car/MyCar_Down.png');
  end;
end;

procedure KeyDown(Key: integer);
begin
if (fColl) then 
  case Key of
    // повороты
    VK_A: if (Avto.Poloj <> Left) then begin LoadCar(Left);  Avto.Poloj:= Left   end;
    VK_D: if (Avto.Poloj <> Right) then begin LoadCar(Right); Avto.Poloj:= Right; end;
    VK_W: if (Avto.Poloj <> Up)    then begin LoadCar(Up);    Avto.Poloj:= Up;    end;
    VK_S: if (Avto.Poloj <> Down)  then begin LoadCar(Down);  Avto.Poloj:= Down;  end;
    
    // повороты
    VK_Left:  if (Avto.X > 0 )   then Avto.X := Avto.X - Avto.Speed; 
    VK_Right: if (Avto.X < 555 ) then Avto.X := Avto.X + Avto.Speed;
    VK_Up:    if (Avto.Y > 0 )   then Avto.Y := Avto.Y - Avto.Speed;
    VK_Down:  if (Avto.Y < 500 ) then Avto.Y := Avto.Y + Avto.Speed;
  end
 else // if
      // если есть столкновение, отбрасываем назад авто  в
 case (Key) of  
   VK_Left:  Avto.X := Avto.X + Avto.Speed+2; 
   VK_Right: Avto.X := Avto.X - Avto.Speed-2;
   VK_Up:    Avto.Y := Avto.Y + Avto.Speed+2;
   VK_Down:  Avto.Y := Avto.Y - Avto.Speed-2;
  end;

end;


// движение поезда  
procedure UpdataTrainPic;
begin
  TrainPic.X := TrainPic.X+TrainPic.Speed;
  TrainPic.Mycar.Draw(TrainPic.X, TrainPic.Y);
  if (TrainPic.X > 600) then TrainPic.X := -500;
end; 

procedure LoadSave(name : string);
var
 bool : boolean;
begin
 if (FileExists(name)=true) then
  bgr2 := Picture.Create('sav/bgr.dat') 
else
 bgr2 := Picture.Create('data/Background/bgr_2.jpg');
end; 




begin
  Window.Caption := 'Уборщик снега.';
  Window.Width := 625;
  Window.Height := 540;
  
  bgr1 := Picture.Create('data/Background/bgr_1.jpg');    // основной фон
  LoadSave ('sav/bgr.dat');
  //bgr2 := Picture.Create('data/Background/bgr_2.jpg');    // заснеженный фон
  //bgr2 := Picture.Create('bgr.png');    // заснеженный фон
  bgr3 := Picture.Create('data/Background/bgr_3.png');    // фон с крышали
  bgrcol := Picture.Create('data/Background/bgr_col.jpg');    // фон колизия
  
  TrainPic.Mycar := Picture.Create('data/Car/train.png'); // поезд   
  TrainPic.X := -100;
  TrainPic.Y := 505;
  TrainPic.Speed := 2;
  
  Avto.Mycar :=  Picture.Create('data/Car/MyCar_L.png');
  Avto.Poloj := Down;
  LoadCar( Down );
  Avto.X := 170;
  Avto.Y := 10;
  Avto.Speed := 2;
  
  // берем цвет дороги 
  ColorColl := bgrcol.GetPixel(170,10);
  
 
  bgr2.Save('sav/bgr.dat');
  repeat
   bgr2.Load('sav/bgr.dat');
   bgr2.TransparentColor := clRed;
   bgr2.Transparent:=True;
  
   LockDrawing;
    
   // ClearWindow(clBlue); 
   
   
  // берем 2 пикселя и сравниваем его со СТАНДАРТ
  // если отличается то столкновение иначе нет    
  if (bgrcol.GetPixel(Avto.X ,Avto.Y)= ColorColl) and 
  (bgrcol.GetPixel(Avto.X + Avto.Mycar.Width, Avto.Y+Avto.Mycar.Height)= ColorColl)
     then fColl := true else fColl := false;
    
    
    bgr1.Draw(0, 0);
    bgr2.Draw(0, 0);
    
 
 // ----------- установка альфы ---------------------
    if ( Avto.Poloj = Left) then begin
      for i := 1 to 6 do
        for j := 1 to 23 do
          bgr2.SetPixel( Avto.X + i, Avto.Y + j, clRed);
    end;  
    
    if (Avto.Poloj = Right) then begin
      for i := 1 to 6 do
        for j := 1 to 23 do
          bgr2.SetPixel(  50 + Avto.X + i, Avto.Y + j, clRed);
    end;
    
    if (Avto.Poloj = Up) then begin
      for i := 1 to 23 do
        for j := 1 to 6 do
          bgr2.SetPixel( Avto.X + i, Avto.Y + j, clRed);
    end;  
    
    if (Avto.Poloj = Down) then begin
      for i := 1 to 23 do
        for j := 1 to 6 do
          bgr2.SetPixel( Avto.X + i, 50 + Avto.Y + j, clRed);
    end;  
    // ----------- установка альфы (END) ------------------
    
    
    
    
    Avto.Mycar.Draw(Avto.X, Avto.Y);
    
    UpdataTrainPic;
      
    bgr3.Draw(0, 0);  
    
    Redraw; 
    
    bgr2.Save('sav/bgr.dat');
    OnKeyDown := KeyDown;

  until (fEND); 
end.