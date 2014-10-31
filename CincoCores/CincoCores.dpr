program CincoCores;

uses
  Forms,
  uMain in 'uMain.pas' {main};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Algoritmo das Cinco Cores';
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
