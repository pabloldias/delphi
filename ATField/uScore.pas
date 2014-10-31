unit uScore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufScore, siFltBtn, ExtCtrls;

type
  TScore = record
    Nome: string[30];
    Pecas: integer;
    Tempo: TTime;
  end;

  THiscore = class(TForm)
    fScore1: TfScore;
    fScore2: TfScore;
    fScore3: TfScore;
    fScore4: TfScore;
    fScore5: TfScore;
    fScore6: TfScore;
    fScore7: TfScore;
    fScore8: TfScore;
    fScore9: TfScore;
    fScore10: TfScore;
    Image1: TImage;
    siFlatBtn1: TsiFlatBtn;
    procedure FormCreate(Sender: TObject);
    function Cript(Texto: string; Encr: boolean): string;
    function IncluiScore(Pecas: integer; Tempo: TTime): integer;
    procedure Mostra;
    procedure GravaTop10;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure siFlatBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    top10: array [1..10] of TScore;
  end;

var
  Hiscore: THiscore;
  score: file of TScore;

implementation

uses uMain;

{$R *.DFM}

function THiscore.Cript(Texto: string; Encr: boolean): string;
var
  i,lt,pos: integer;       
const
  c = 'MQFIACOWPK';
begin
  lt:=length(Texto);
  for i:= 1 to lt do
  begin
    if i > 6 then
    begin
      pos:= i mod 6;
      if pos = 0 then pos:=6;
    end
    else
      pos:=i;

    if Encr then
      insert(Chr(Ord(c[pos])+Ord(texto[i])),texto,i)
    else
      insert(Chr(Ord(texto[i])-Ord(c[pos])),texto,i);
      
    delete(texto,i+1,1);
  end;
  Result:=texto;
end;

procedure THiscore.FormCreate(Sender: TObject);
var
  i: integer;
begin
  AssignFile(score, 'HiScore.dat');
  Reset(score);
  for i:= 1 to 10 do
  begin
    read(score, top10[i]);
    top10[i].Nome:= cript(top10[i].nome, false);
  end;
  CloseFile(score);
  Mostra;
  Main.CarregaFigura(Image1, 'top10');
end;

procedure THiscore.GravaTop10;
var
  i: integer;
begin
  AssignFile(score, 'HiScore.dat');
  Rewrite(score);
  for i:= 1 to 10 do
  begin
    top10[i].Nome:= cript(top10[i].nome, true);
    Write(score, top10[i]);
    top10[i].Nome:= cript(top10[i].nome, false);
  end;
  CloseFile(score);
end;

function THiscore.IncluiScore(Pecas: integer; Tempo: TTime): integer;
// retorna a posicao em que entrou
var
  i: integer;
begin
  Result:= 0;
  for i:= 10 downto 1 do
  begin
    if (Pecas < top10[i].Pecas) or ((Pecas = top10[i].Pecas) and (Tempo < top10[i].Tempo)) then
    begin
      if i <> 10 then top10[i+1]:=top10[i];
      top10[i].Nome:= '@';
      top10[i].Pecas:= Pecas;
      top10[i].Tempo:= Tempo;
      Result:= i;
    end;
  end;
end;

procedure THiscore.Mostra;
var
  i: integer;
begin
  for i:= 1 to 10 do
  begin
    with TfScore(FindComponent('fScore'+IntToStr(i))) do
    begin
      lNome.Caption:= top10[i].Nome;
      lPecas.Caption:= IntToStr(top10[i].Pecas);
      lTempo.Caption:= FormatDateTime('nn:ss',top10[i].Tempo);
    end;
  end;
end;

procedure THiscore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Close;
end;

procedure THiscore.siFlatBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
