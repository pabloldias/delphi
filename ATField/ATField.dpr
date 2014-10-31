program ATField;

uses
  Forms,
  uMain in 'uMain.pas' {Main},
  uScore in 'uScore.pas' {Hiscore},
  ufScore in 'ufScore.pas' {fScore: TFrame},
  uSobre in 'uSobre.pas' {Sobre};

{$R *.RES}

begin
  Sobre:= TSobre.Create(Application);
  Sobre.Timer1.Enabled:= true;
  Sobre.ShowModal;
  Sobre.Free;
  Application.Initialize;
  Application.Title:= 'Absolute Terror Field';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(THiscore, Hiscore);
  Application.Run;
end.
