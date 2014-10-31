unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TSobre = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sobre: TSobre;

implementation

{$R *.DFM}

procedure TSobre.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TSobre.FormCreate(Sender: TObject);
var
  Res: TResourceStream;
  b: TBitmap;
begin
  Res:= TResourceStream.Create(Hinstance, 'splash', Pchar('FILE'));
  b:= TBitmap.Create;
  b.LoadFromStream(res);
  Image1.Picture.Bitmap:= b;
  b.Free;
  Res.Free;
end;

end.
