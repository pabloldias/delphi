program SimTur;

uses
  Forms,
  uMain in 'uMain.pas' {Main},
  uConvert in 'uConvert.pas' {Convert},
  uSplash in 'uSplash.pas' {Splash};

{$R *.RES}

begin
  Splash:= TSplash.Create(Application);
  Splash.Timer1.Enabled:= true;
  Splash.ShowModal;
  Splash.Free;
  Application.Initialize;
  Application.Title := 'Simulador Turing';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
