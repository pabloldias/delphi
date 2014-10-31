unit uConvert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls;

type
  TConvert = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edF1: TEdit;
    edF2: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    open: TOpenDialog;
    save: TSaveDialog;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Convert: TConvert;

implementation

uses uMain;

{$R *.DFM}

procedure TConvert.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TConvert.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TConvert.SpeedButton1Click(Sender: TObject);
begin
  open.Title:= 'Abrir arquivo Pasp fase '+Inttostr(TSpeedButton(Sender).tag);
  if open.Execute then
    TEdit(FindComponent(TSpeedButton(Sender).Hint)).Text:= open.FileName;
end;

procedure TConvert.SpeedButton3Click(Sender: TObject);
var
  old, new: TStringList;
  col, row, ncol, nrow: integer;
begin
  if FileExists(edF1.Text) and FileExists(edF2.Text) then
  begin
    old:= TStringlist.Create;
    new:= TStringList.Create;
    try try
      // abre o 1º arquivo
      old.LoadFromFile(edF1.Text);
      // copia para novo arquivo, na nova ordem
      new.Add(Trim(old[0]));
      new.Add(Trim(old[3]));
      new.Add(Trim(old[1]));
      new.Add(Trim(old[2]));
      // abre o 2º arquivo
      old.LoadFromFile(edF2.Text);
      // faz o laço para pegar os vals
      ncol:= main.NumItems(new[3]);
      nrow:= main.NumItems(new[2]);
      for col:= ncol - 1 downto 0 do
        for row:= nrow - 1 downto 0 do
          new.Add(old[(row * ncol) + col]);
      // salva novo arquivo
      if save.Execute then
        new.SaveToFile(save.FileName);
    except
      MessageBoxEx(Handle, 'Um dos arquivos escolhidos não é compatível com o Pasp!',
        'Converter', 16, 0);
    end;
    finally
      old.Free;
      new.Free;
      Close;
    end;
  end
  else
    MessageBoxEx(Handle, 'Um dos arquivos não existe!', 'Converter Pasp', 16, 0);
end;

end.
