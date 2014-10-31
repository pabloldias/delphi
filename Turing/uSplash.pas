unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash: TSplash;

implementation

{$R *.dfm}

procedure TSplash.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TSplash.FormCreate(Sender: TObject);
var
  r: HRgn;
begin
  r:= CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,30,30);
  SetWindowRgn(Handle, r, true);
end;

end.
