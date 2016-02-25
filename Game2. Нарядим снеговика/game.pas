uses
  GraphABC, ABCObjects, Inifile ;

// �������� ��������. ��� ���������   
type
  TSnowMan = record
    Pic: PictureABC;  // ������� ����� ����/������
    Index : integer;  // ����� ������������ ������� 
  end;

// �������� �����
type
  TSnow = record
    X, Y: integer;       // ���������� ������
    dX, dY: integer;     // �������� ��������
    Pic: PictureABC;     // �������
  end;

const
  CountSnow = 100;    // ���������� ��������

var
  fEND: boolean;      // �������� �� ���������� �������� �����
  W, H : integer;     // ������� ���������
  
  Snow : array of TSnow;    // ������ ��������
  bgr: PictureABC;          // �������� �������� �����  
  SnowMan : PictureABC;     // �������� ���������
  SMDetail: array of TSnowMan; // ������ ��� �������� �������� �����
  
  Fileini : TIniFile;          // ��� �������� INI-�����     
  
  // ������ � ����� Button
  Button: array of PictureABC; 
  NameButton : array of string := 
  ('BGolova','BGlaza','BNos','BRot','BSharf','BRuki','BMetla','BTelo','BPodarok');


//------------------------------------------------------//
//--------   ������ ������ �� ����� ini   --------------// 
procedure LoadPictureOfIni( int : integer; str : string );
var
 px,py : integer;
 sx,sy : real;
begin
 var path := 'data/SMan/';  
 var count := Fileini.ReadInteger('List', str, -1); 
  
 if (SMDetail[int].Index < count ) then
     SMDetail[int].Index := SMDetail[int].Index + 1
 else SMDetail[int].Index := 1;  
 
 px := Fileini.ReadInteger(str+IntToStr(SMDetail[int].Index),'PosX',-1);
 py := Fileini.ReadInteger(str+IntToStr(SMDetail[int].Index),'PosY',-1);
 sx := StrToFloat(Fileini.ReadString (str+IntToStr(SMDetail[int].Index),'ScalX','-1'));
 sy := StrToFloat(Fileini.ReadString(str+IntToStr(SMDetail[int].Index),'ScalY','-1'));
 
 SMDetail[int].Pic.MoveTo( px ,py );
 SMDetail[int].Pic.ScaleX := sx;
 SMDetail[int].Pic.ScaleY := sy;
 SMDetail[int].Pic.ChangePicture(path+str+'/'+str+SMDetail[int].Index+'.png');
end;

//------------------------------------------------------//
//--- ���������� ������� �� ������ ���� ---------------//
// � ������ ������ ���� ��������� �� �������
//       �� ������ "������ ���������"    
procedure MyMouseDown(x, y, mb: integer);
begin
  var ob1 := ObjectUnderPoint(x, y); 
  case ob1.Number of
   1: LoadPictureOfIni( 0, 'Golova' );  
   2: LoadPictureOfIni( 1, 'Glaza'  ); 
   3: LoadPictureOfIni( 2, 'Nos'    ); 
   4: LoadPictureOfIni( 3, 'Rot'    ); 
   5: LoadPictureOfIni( 4, 'Sharf'  ); 
   6: LoadPictureOfIni( 5, 'Ruki'   ); 
   7: LoadPictureOfIni( 6, 'Metla'  ); 
   //8: 
   //9:
 end; // case
  
end;

//------------------------------------------------------//
//--  ��������� ����������� ����� ����� �� ������� ������
//--  � ��������������� � ��������� ����������
//------------------------------------------------------//
procedure UpdataSnow;
var
  i: integer;
begin
 for i := 0 to CountSnow-1 do begin 
  Snow[ i ].pic.Moveto(Snow[ i ].x, Snow[ i ].y); 
  Snow[ i ].y := Snow[ i ].y + Snow[ i ].dy; 
  Snow[ i ].x := Snow[ i ].x + Snow[ i] .dx; 
  if (Snow[ i ].y > H)or(Snow[ i ].x > W)  then begin 
    Snow[ i ].y := -10; 
    Snow[ i ].x := Random(3*W)-W; 
  end; 
 end;
end;

//------------------------------------------------------//
//------   �������� �����  -----------------------------// 
//------------------------------------------------------//
procedure LoadScene( n : integer );
begin
 case ( n ) of
 0: 
   begin
    bgr := PictureABC.Create(0, 0, 'data/Background/bgr_1.png');
    bgr := PictureABC.Create(0, 125, 'data/Background/bgr_2.png');
   end;
 1: 
   begin
    bgr := PictureABC.Create(0, 0, 'data/Background/bgr_3.png');
    bgr.ScaleX := 1.14;
   end;
 end;    
end;

//------------------------------------------------------//
//-----------    �������� ������   ---------------------//
procedure LoadButton;
var
 x, y : integer;
begin
 y := 10; x := 690; // ��������� ���������� ������ ������
 Button := new PictureABC[9];

  for var i := 0 to  8 do begin
   Button[i] := PictureABC.Create(x, y, 'data/Button/'+NameButton[i]+'.png');
   Button[i].ScaleX := 0.6;  Button[i].ScaleY := 0.6;
   Button[i].Number := i+1;  Button[i].TextVisible := false;
   
  
   if ( y + 120 < 500 ) then y := y + 120 else
     begin  y := 10; x := x - 120; end;
  end;
end;

//------------------------------------------------------//
//-----------    �������� ������ ���������   -----------//
procedure LoadSnowmanDetail;
begin
  SMDetail := new TSnowMan[9];  
  
  SMDetail[0].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[1].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[3].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[2].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[5].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[4].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[6].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[7].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  SMDetail[8].Pic := PictureABC.Create(100, 100, 'data/null.png');SMDetail[0].Index := 0;
  
  
end;

//------------------------------------------------------//
//----------  ������� ����� ��������� ------------------// 
//------------------------------------------------------//
begin
  Window.Width := 800;
  Window.Height := 600;
  Window.IsFixedSize := true; // ������ �� ��������� ������� ����
  W := 600;      // ����������� ��� �����
  H := 400;      // ����������� ��� �����
  
  Randomize;
  
  // ����������� ��������� ��� �������
  var x := Random(2); 
  LoadScene(x); 
  
  // ��������� �������� ����
  Snow := new TSnow[CountSnow];  
  for var i := 0 to CountSnow-1 do begin 
    Snow[ i ].X   :=  Random(3*W)-W; 
    Snow[ i ].Y   :=  Random(H); 
    Snow[ i ].Pic :=  PictureABC.Create(Snow[ i ].x,Snow[ i ].y,'data/Background/snow1.png');
    Snow[ i ].dY  :=  Random(3)+1; 
    Snow[ i ].dX  :=  Random(3) - 1; 
  end; 
  
   // �������� � ��������� ���������
  SnowMan := PictureABC.Create(150, 160, 'data/snowman2.png');
  // �������� INI-�����
  Fileini := TIniFile.Create('data/res.ini');
  // �������������� �������� ������ ���������
  LoadSnowmanDetail; 
  // ����������� ������ 
  LoadButton;
  
  // Game Loop
  repeat
  
  UpdataSnow;
  
    
    // ������ ��������� ���������
    // ����� ��� ��������� ������ �����
  //  Window.Caption := IntToStr( MillisecondsDelta); 
    
       // ����������� ���������� 
   OnMouseDown := MyMouseDown;
    
  until (fEND);  // end gameloop
  
end.