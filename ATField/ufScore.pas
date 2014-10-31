unit ufScore;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfScore = class(TFrame)
    Label1: TLabel;
    lNome: TLabel;
    lPecas: TLabel;
    Label2: TLabel;
    lTempo: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
