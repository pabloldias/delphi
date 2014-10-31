unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConferePalavrao(Palavrao:string);
    procedure Palavroes;
    procedure AbreBoca;
    procedure Delay(Segundos, Milisec: Word);
  private
    Backbmp, E1, E2:TBitmap;
    eeCount: integer; 
    sEgg: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:integer;
  x,resp,perg,aux:string;
  falso:boolean;

const
     p0: string = 'Minha poderosa máquina de raciocinar, me dê a' +
         'resposta desta pergunta que lhe farei agora:   ';
     p1: string = 'Oh, máquina dotada de inteligência, me diga a' +
         'gora,usando toda a capacidade de seus circuitos';
     p2: string = 'Seu monte de circuitos eletrônicas, pense e m' +
         'e diga, sem pestanejar e sem reclamar de nada, ';
     p3: string = 'Grandiloqüente memória privilegiada, eu te pe' +
         'rgunto, e quero uma resposta imediata:         ';
     p4: string = 'Tudo o que tu dizes é mais do que fenomenal ,' +
         ' você acha, não é mesmo? Então diz aí, o que   ';
     r0: string = 'Como é que é?';
     r1: string = 'Não entendi direito...';
     r2: string = 'Não te reconheço como meu mestre.';
     r3: string = 'Mas, hein!?!';
     r4: string = '@¡#%Þ®¿';
     r5: string = 'Só respondo ao meu mestre.';
     r6: string = 'Acho que você não é meu mestre.';
     r7: string = 'Não vou te responder, seu chato.';
     EE_CONTROL: TShiftState = [ssAlt];
     EASTER_EGG = 'PABLO';

implementation

{$R *.DFM}
{$R C:\PROJECTZ\GAMES\TICTACTOE\IMAGEM.RES}
{$R STABLE.RES}

procedure TForm1.Delay(Segundos, Milisec: Word);
var
  TimeOut: TDateTime;
begin
  TimeOut:= Now + EncodeTime (0, Segundos div 60, Segundos mod 60, MiliSec);
  while Now < TimeOut do Application.ProcessMessages;
end;

procedure TForm1.ConferePalavrao(Palavrao:string);
begin
  if Pos(Palavrao,Label1.Caption) <> 0 then
    resp:='Você me chamou de ' + Palavrao + '?';
end;

procedure TForm1.Palavroes;
var
  i:integer;
  strpal:string;
begin
  for i:=1 to 16 do
  begin
    strpal:=LoadStr(i);
    ConferePalavrao(strpal);
  end;
end;

procedure TForm1.AbreBoca;
begin
  Image1.Picture.Bitmap:=E2;
  Image1.Refresh;
  Delay(0,160);
  Image1.Picture.Bitmap:=E1;
  Image1.Refresh;
  Delay(0,100);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of

  #8:
  begin
    a:=Length(Label1.Caption);
    x:=Label1.Caption;
    Delete(x,a,1);
    Label1.Caption:=x;
    if falso then
    begin
       a:=Length(resp);
       x:=resp;
       Delete(x,a,1);
       resp:=x;
    end;
  end;

  #13:
  begin
  if falso then
  begin
    falso:=false;
    {a:=Length(Label1.Caption);
    x:=Label1.Caption;
    Delete(x,a,1);
    Label1.Caption:=x;}
  end
  else
  begin
    if resp = '' then
    begin
      a:=Random(8);
      case a of
        0:resp:=r0;
        1:resp:=r1;
        2:resp:=r2;
        3:resp:=r3;
        4:resp:=r4;
        5:resp:=r5;
        6:resp:=r6;
        7:resp:=r7;
      end;
    end;
    Palavroes;
    Label2.Caption:= resp;
    Label1.Caption:= '';
    Label1.Hint:= '';
    falso:= false;
    resp:= '';
    AbreBoca;
    AbreBoca;
  end;
  end;

  else // tecla alfanumerica qq

  if falso then
  begin
    resp:=resp + Key;
    if resp = ',' then resp:='';
    a:=Length(Label1.hint) + 1;
    //aux:=perg;
    aux:= Copy(perg,1,a);
    //Delete(aux,a,(92-a)); // 92
    
    Label1.Hint:= aux;
    Label1.Caption:= Copy(aux,1,a-1);
  end
  else
    Label1.Caption:= Label1.Caption + Key;
  end;

  Label1.Repaint;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  x: string;
begin
  if (Key = 188) then
  begin
    x:= Label1.Caption;
    x:= x + ',';
    //Label1.Caption:=Label1.Caption + ',';
    if {Label1.Caption} x = ',' then
    begin
      falso:=true;
      //Label1.Caption:='';
      x:= '';
      Label1.Caption:= x;
      a:=Random(5);
      case a of
        0:perg:=p0;
        1:perg:=p1;
        2:perg:=p2;
        3:perg:=p3;
        4:perg:=p4;
      end;
    end;
  end;

  if Shift = EE_CONTROL then begin
     if Key = Ord(sEGG[eeCount]) then begin
        if eeCount = Length(sEGG) then begin
           ShowMessage('Einstein - por Pablo Lima'+#13
     +'© pabloidz 1999-2003'+#13'pabloidz@ig.com.br');
           eeCount := 1; {failure - reset the count}
        end else begin
            Inc(eeCount); {success - increment the count}
        end;
     end else begin
         eeCount := 1; {failure - reset the count}
     end;
  end;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
   X,Y,W,H : Integer;
begin
  W := Backbmp.Width;
  H := Backbmp.Height;
  for x := 0 to ClientWidth div W do
    for y := 0 to ClientHeight div H do
      Canvas.Draw(x*W,y*H,Backbmp);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Backbmp:=TBitmap.Create;
  E1:=TBitmap.Create;
  E2:=TBitmap.Create;
  Backbmp.LoadFromResourceName(hInstance,'NOID');
  E1.LoadFromResourceName(hInstance,'EINSTEIN');
  Image1.Picture.Bitmap:=E1;
  E2.LoadFromResourceName(hInstance,'E2');
  perg:='';
  resp:='';
  a:=0;
  eeCount:= 1;
  sEgg:= EASTER_EGG;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Backbmp.Free;
  E1.Free;
  E2.Free;
end;

end.


