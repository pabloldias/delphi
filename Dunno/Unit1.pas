unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ImgList, Registry, math, Buttons;

type
  TCor = (Amarelo, Verde, Azul, Vermelho, Agua, Nada);
  Tabul = array [1..20,1..10] of TCor;
  TForm1 = class(TForm)
    Label1: TLabel;
    img: TImageList;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Button1: TSpeedButton;
    Timer1: TTimer;
    Panel1: TPanel;
    procedure Novo;
    procedure Desenha;
    procedure Compacta;
    function Desceu(c: integer): boolean;
    function PosicaoValida(X,Y: integer): boolean;
    function Acabou: boolean;
    procedure MudaIgual(x,y: integer);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure Scoring(GameOver: boolean);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  t: Tabul;
  po: TPoint;
  playing: boolean = false;
  clicks, score, multi: integer;
  imgt: TBitmap;

implementation

{$R *.DFM}
{$R NAMES.RES}

procedure Tform1.Novo;
var
  x: array [0..4] of byte;
  i,j,c: integer;
begin
  for i:= 0 to 4 do
      x[i]:=20;
  for i:= 1 to 20 do
    for j:= 1 to 10 do
    begin
      repeat
        c:= Random(5)
      until x[c] > 0;
      t[i,j]:=TCor(c);
    end;
  clicks:=0;
  label1.Caption:='';
end;

procedure tform1.Desenha;
var
  i,j: integer;
begin
  score:= 0;
  for i:= 1 to 20 do
  for j:= 1 to 10 do
  begin
    case t[i,j] of
      Amarelo: Canvas.Brush.Color:=clYellow;
      Verde: Canvas.Brush.Color:=clGreen;
      Azul: Canvas.Brush.Color:=clBlue;
      Vermelho: Canvas.Brush.Color:=clRed;
      Agua: Canvas.Brush.Color:=clAqua;
      Nada:
      begin
        Canvas.Brush.Color:=clSilver;
        score:= score + 3;
      end;
    end;
    if playing then
      img.Draw(imgt.Canvas,(i * 20) - 20,(j * 20) - 20,Ord(Tcor(t[i,j])));
  end;
  if playing then Canvas.Draw(20,20,imgt);
end;

function TForm1.Desceu(c: integer): boolean;
var
  i,f: integer;
begin
  Result:=true;
  f:= 0;
  for i:= 10 downto 1 do
  begin
    if t[c,i] = Nada then
    begin
      f:=i;
      Break;
    end;
  end;
  if f <> 0 then
    for i:= f downto 1 do
      if t[c,i] <> Nada then
        Result:=false;
end;

procedure TForm1.Compacta;
var
  i,j,k: integer;
begin
  for i:= 1 to 20 do
  begin
    while not Desceu(i) do
    begin
      for j:= 10 downto 1 do
      begin
        if t[i,j] = Nada then
        begin
          tag:=j;
          Break;
        end;
      end;
      for j:= tag downto 2 do
          t[i,j]:= t[i,j-1];
      t[i,1]:= Nada;
    end;
  end;
  for i:= 20 downto 1 do
  begin
    if t[i,10] = Nada then
    begin
      for j:= i to 19 do
        for k:= 1 to 10 do
          t[j,k]:= t[j+1,k];
      for k:= 1 to 10 do
        t[20,k]:= Nada;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  imgt:= TBitmap.Create;
  imgt.Width:= 400;
  imgt.Height:= 200;
  po:=Point(0,0);
  Randomize;
  Canvas.Pen.Style:= psClear;
  Canvas.Font.Size:= 14;
end;

function TForm1.PosicaoValida(X,Y: integer): boolean;
begin
  if (x div 20 > 0) and (x div 20 < 21) and
    (y div 20 > 0) and (y div 20 < 11) then
  result:=true else result:=false;
end;

procedure TForm1.MudaIgual(x,y: integer);
var
  c: Tcor;
begin
  c:=t[x,y];
  if c <> Nada then
  begin
    t[x,y]:=Nada;
    Inc(multi);
    if (t[x-1,y] = c) and (x-1 > 0) then MudaIgual(x-1,y);
    if (t[x+1,y] = c) and (x+1 < 21) then MudaIgual(x+1,y);
    if (t[x,y-1] = c) and (y-1 > 0) then MudaIgual(x,y-1);
    if (t[x,y+1] = c) and (y+1 < 11) then MudaIgual(x,y+1);
  end;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if PosicaoValida(X,Y) and playing then
  begin
    if (t[(x div 20)-1,(y div 20)] = t[x div 20,y div 20]) or
      (t[(x div 20)+1,(y div 20)] = t[x div 20,y div 20]) or
      (t[(x div 20),(y div 20)-1] = t[x div 20,y div 20]) or
      (t[(x div 20),(y div 20)+1] = t[x div 20,y div 20])
    then
    begin
      multi:= 0;
      MudaIgual(x div 20,y div 20);
      Compacta;
      Inc(clicks);
      clicks:= clicks - Trunc(Power(multi,3));
      Desenha;
      if multi <> 0 then
        with panel1 do
        begin
          Caption:='x'+inttostr(multi);
          Width:=Canvas.TextWidth(Caption);
          Height:=Canvas.TextHeight(Caption);
          Left:=x-width;
          Top:=y-height;
          Visible:=true;
        end;
      Timer1.Enabled:=true;
      if Acabou then
      begin
        score:= score - clicks;
        Scoring(true);
        playing:= false;
      end;
      label1.caption:= inttostr(score - clicks);
    end;
  end;
end;

function TForm1.Acabou: boolean;
var
  i,j: integer;
begin
  Screen.Cursor:= crHourglass;
  Result:=true;
  for i:= 1 to 20 do
  begin
    for j:= 10 downto 1 do
    begin
      if t[i,j] <> Nada then
      begin
        if ((t[i-1,j] = t[i,j]) and (i-1 > 0)) or
          ((t[i+1,j] = t[i,j]) and (i+1 < 21)) or
          ((t[i,j-1] = t[i,j]) and (j-1 > 0)) or
          ((t[i,j+1] = t[i,j]) and (j+1 < 11))
        then
        begin
          Result:=false;
          Break;
        end;
      end;
    end;
    if Result = false then Break;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  clicks:=0;
  playing:= true;
  Novo;
  Desenha;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then application.Minimize;
  if key = vk_f1 then Scoring(false);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  Desenha;
end;

procedure TForm1.Scoring(GameOver: boolean);
var
  ptos: array [1..10,1..2] of string;
  i: integer;
  reg: TRegIniFile;
  pto: string;
const
  Dummy = 'djh9ª4u3º08uºeoi§30';
begin
  reg:=TRegIniFile.Create ('Software\Xprnz');
  for i:= 1 to 10 do
  begin
    ptos[i,1]:=reg.ReadString('Fitter','Name'+IntToStr(i),'0');
    ptos[i,2]:=reg.ReadString('Happier','Score'+IntToStr(i),'0');
  end;
  if Gameover then
  begin
    for i:= 10 downto 1 do
    begin
      if score > strtointdef(ptos[i,2],0) then
      begin
        if i <> 10 then
        begin
          ptos[i+1,1]:=ptos[i,1];
          ptos[i+1,2]:=ptos[i,2];
        end;
        ptos[i,1]:=Dummy;
        ptos[i,2]:=IntToStr(score);
      end;
    end;
    for i:= 1 to 10 do
      if ptos[i,1] = Dummy then
        ptos[i,1]:= InputBox('Recorde!','Aê moleque, conseguiste um '+IntTostr(i)+'º lugar!','');
    for i:= 1 to 10 do
    begin
      reg.WriteString('Fitter','Name'+IntToStr(i),ptos[i,1]);
      reg.WriteString('Happier','Score'+IntToStr(i),ptos[i,2]);
    end;
  end;
  reg.Destroy;
  pto:='avoid danoid even though'#13'feito por Pablo Lima'+
    #13'pabloidz@ig.com.br'#13#13'Pontuações:'#13#13;
  for i:= 1 to 10 do
  begin
    if ptos[i,2] <> '0' then
    begin
      pto:= pto + inttostr(i) + '.'#9;
      pto:= pto + ptos[i,2] + #9;
      pto:= pto + ptos[i,1] + #9#13;
    end;
  end;
  pto:= pto + #13'Você já ouviu '+LoadStr(Random(311)+1)+'?';
  MessageBoxEx(Handle,PChar(pto),'A.D.E.T.',64,0);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  imgt.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  panel1.Visible:=false;
  Timer1.Enabled:=false;
end;

end.
