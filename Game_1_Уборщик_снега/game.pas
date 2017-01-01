uses GraphABC, Timers,  ABCObjects;
// новая структура Info
// -----------------------------------------------------
type
 InfoRec = record
  time  : integer;
  DateText : string[20];
  TimeText : string[20];
  
 end; 


type
  Storona = (Left, Right, Up, Down);

type
  Car = record
    Name: string[20];  // имя инрока
    Mycar: Picture;
    Poloj: Storona;
    X, Y: integer;     // положение
    dxv, dyv: integer;
    dxh, dyh: integer;
    Speed: byte;
  end;
  

//------------------------------------------------------
var
  // игровые объекты
  bgr1, bgr2, bgr3, bgrcol: Picture;
  BasaCar : Picture;
  text1 : Picture; 
  TrainPic  : Car;
  Avto: Car;
  
  info : InfoRec;

   
  // форма
  W, H: integer; 
  fEND : boolean;
  fColl : boolean := true;
  ColorColl :Color;
  // временные переменные
  i, j: integer;
  
//------------------------------------------------------
// Загрузка нужной текстуры для авто при повороте
procedure LoadCar(poloj: Storona );
begin
  case poloj of
    Left:  Avto.Mycar.Load('data/Car/MyCar_L.png');
    Right: Avto.Mycar.Load('data/Car/MyCar_R.png');
    Up:    Avto.Mycar.Load('data/Car/MyCar_Up.png');
    Down:  Avto.Mycar.Load('data/Car/MyCar_Down.png');
  end;
end;


// Обработчик нажатия клавиши  
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


// Timer
procedure TimerProc;
begin
  
 
  info.time := info.time -1;
end; 


//------------------------------------------------------------------------------------

BEGIN
  Window.Caption := 'Уборка снега.';
  Window.Width := 625;
  Window.Height := 540;
  
  //W := Window.Width;
  //H := Window.Height;
  
  info.time := 60;
  
  var t := new Timer(1000,TimerProc);
  t.Start;
  
  text1 := Picture.Create(200,100);
  text1.Clear;
  
  bgr1 := Picture.Create('data/Background/bgr_1.jpg');    // основной фон
  bgr2 := Picture.Create('data/Background/bgr_2.jpg');    // заснеженный фон
  bgr3 := Picture.Create('data/Background/bgr_3.png');    // фон с крышали
  bgrcol := Picture.Create('data/Background/bgr_col.jpg');    // фон колизия
  BasaCar := Picture.Create('data/Background/basacar.png');
  
  TrainPic.Mycar := Picture.Create('data/Car/train.png'); // поезд   
  TrainPic.X := -100;
  TrainPic.Y := 505;
  TrainPic.Speed := 2;
  
  Avto.Mycar :=  Picture.Create('data/Car/MyCar_L.png');  // ИГРОК - снегоуборочная машина
  
  Avto.Poloj := Down;
  LoadCar( Down );
  Avto.Speed := 2;
  Avto.dxv := 28;
  Avto.dyv := 12;
  Avto.dxh := 12;
  Avto.dyh := 28;
  
  Avto.X := 160;
  Avto.Y := 20;
  
  // берем один пиксель и сравниваем его с остальнвми
  // если отличается то столкновение иначе нет
  ColorColl := bgrcol.GetPixel(170,10);
  if (bgrcol.GetPixel(Avto.X,Avto.Y) = ColorColl) then fColl := true else fColl := false; 
  //Window.Caption := ColorColl.ToString;


   //var f :=  System.Media.SoundPlayer.Create('pole.wav');

    
    
  bgr2.Save('bgr.png');

//   f.Play;
    
  repeat
    bgr2.Load('bgr.png');
    bgr2.TransparentColor := clRed;
    bgr2.Transparent := True;  

    
    LockDrawing; 
    //  ClearWindow(clBlue); 
    
    
    bgr1.Draw(0, 0); 
    
     bgr2.Draw(0,0);
  
   
    
 
  
    // делаем альфу ---------------------
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
    // делаем альфу ---------------------
    

      

    
    UpdataTrainPic;
    
    
    

     // bgrcol.Draw(0,0);
    
    Avto.Mycar.Draw(Avto.X, Avto.Y);
    
    
     BasaCar.Draw(0,240);
    
 
  if (bgrcol.GetPixel(Avto.X+5 ,Avto.Y+5)= ColorColl) and 
  (bgrcol.GetPixel(Avto.X + Avto.Mycar.Width, Avto.Y+Avto.Mycar.Height)= ColorColl)
     then fColl := true else fColl := false;
  //Window.Caption := ColorColl.ToString;
     
     
    bgr3.Draw(0,0);
    
  
  
     text1.TextOut(5,5,'День первый');
    // text1.TextOut(5,30,'День первый');
     text1.TextOut(5,30,IntToStr(info.time));
    // text1.Draw(400,10);
    
    Redraw;
 
    
    // UnlockDrawing;
    
     bgr2.Save('bgr.png');

         
    // https://msdn.microsoft.com/ru-ru/library/system.media.soundplayer%28v=vs.110%29.aspx
   
    
    OnKeyDown := KeyDown; 
    
  until (fEND);
  
END.