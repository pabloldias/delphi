unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ImgList, ToolWin, Menus, Grids, AppEvnts,
  Aligrid, Numbers;

type
  TMain = class(TForm)
    p1: TPanel;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Novo1: TMenuItem;
    ToolBar1: TToolBar;
    status: TStatusBar;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Tabela1: TMenuItem;
    Montar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    EsquemaIterativo1: TMenuItem;
    PassoaPasso1: TMenuItem;
    SimularExecuo1: TMenuItem;
    N2: TMenuItem;
    Imprimir1: TMenuItem;
    N3: TMenuItem;
    Voltar1: TMenuItem;
    ImageList1: TImageList;
    btNovo: TToolButton;
    btAbrir: TToolButton;
    btSalvar: TToolButton;
    btSair: TToolButton;
    btSimula: TToolButton;
    btMontar: TToolButton;
    btPasso: TToolButton;
    btImprime: TToolButton;
    btVoltar: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton15: TToolButton;
    Label1: TLabel;
    edPadrao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edEstado: TEdit;
    Label5: TLabel;
    edAlfabeto: TEdit;
    Label6: TLabel;
    grid: TStringAlignGrid;
    open: TOpenDialog;
    edPos: TNumbers;
    Avanar1: TMenuItem;
    btAvancar: TToolButton;
    save: TSaveDialog;
    N4: TMenuItem;
    ConverterPasp1: TMenuItem;
    p2: TPanel;
    Label9: TLabel;
    ToolButton7: TToolButton;
    Label13: TLabel;
    Label14: TLabel;
    lEntrada: TLabel;
    lSaida: TLabel;
    g: TStringAlignGrid;
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edPadraoEnter(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Montar1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure ConverterPasp1Click(Sender: TObject);
    function NumItems(Arr: string): integer;
    procedure gridValidateEdit(Sender: TObject; col, row: Integer;
      var result: Boolean);
    function ValorInvalido(Col, Row: integer): boolean;
    procedure SimularExecuo1Click(Sender: TObject);
    procedure Avanar1Click(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    function TudoOk: boolean;
    function PosValida(Fita: string; Posicao: integer): boolean;
    function FitaValida(Fita: string): boolean;
    function SimboloValido(Simbolo: string): boolean;
    function AcoesValidas: boolean;
    procedure PassoaPasso1Click(Sender: TObject);
    procedure MostraPasso(Passo, Posicao: integer; Estado, Fita: string);
    procedure gDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  // arrays que guardam os estados e os símbolos
  estados, alfabeto: array of string;
  // propriedades da fita
  fita, estado: string;
  Posicao, contPasso: integer;
  acao: string;
  // stringlist p/ arquivo
  arq: TStringList;
  // diz se está na 1ª tela
  especif: boolean;
  // diz se está simulando
  simulando: boolean = false;
  // diz se é simulação completa
  simulaExec: boolean = false;

implementation

uses uConvert;

{$R *.DFM}

procedure TMain.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  arq:= TStringList.Create;
  especif:= true;
  g.ColFont[3].Name:= 'Courier New';
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
  arq.Free;
end;

procedure TMain.edPadraoEnter(Sender: TObject);
begin
  status.SimpleText:= TControl(Sender).Hint;
end;

procedure TMain.Abrir1Click(Sender: TObject);
var
  i, j, line: integer;
begin
  if especif then
  begin
    if open.Execute then
    begin
      try try
        Screen.Cursor:= crHourglass;
        grid.Enabled:= false;
        if FileExists(open.FileName) then
          arq.LoadFromFile(open.FileName);
        edPadrao.Text:= arq[0];
        edPos.Text:= arq[1];
        edEstado.Text:= arq[2];
        edAlfabeto.Text:= arq[3];
        Montar1Click(Sender);
        line:= 4;
        for i:= 1 to grid.ColCount - 1 do
          for j:= 1 to grid.RowCount - 1 do
          begin
            grid.Cells[i,j]:= arq[line];
            Inc(line);
          end;
        grid.ResetBrushCellAll;
      finally
        ActiveControl:= edPadrao;
        Screen.Cursor:= crDefault;
      end;
      except
        MessageBoxEx(Handle, 'Houve algum erro na hora de abrir o arquivo!', 'Abrir', 16, 0);
      end;
    end;
  end
  else
    MessageBoxEx(Handle, 'Volte para as especificações!', 'Abrir', 16, 0);
end;

procedure TMain.Novo1Click(Sender: TObject);
var
  i, j: integer;
begin
  if especif then
  begin
    if(MessageBoxEx(Handle, 'Deseja criar uma nova simulação?', 'Novo', 36, 0) = idYes) then
    begin
      // limpa na especificacao
      edPadrao.Text:= '';
      edPos.ValInt:= 0;
      edEstado.Text:= '';
      edAlfabeto.Text:= '';
      // limpa cada célula
      for i:= 1 to grid.ColCount - 1 do
        for j:= 1 to grid.RowCount - 1 do
          grid.Cells[i,j]:= '';
      // desabilita grid
      grid.ColCount:= 0;
      grid.RowCount:= 0;
      grid.Enabled:= false;
      
      ActiveControl:= edPadrao;
      especif:= true;
    end;
  end
  else
    MessageBoxEx(Handle, 'Volte para as especificações!', 'Novo', 16, 0);
end;

function TMain.NumItems(Arr: string): integer;
var
  i: integer;
begin
  // a partir da string (ex: q0,q1,q2) descobre qtos elementos o array terá (ex: 3)
  Result:= 0;
  for i:= 1 to Length(Arr) do
    if Arr[i] = ',' then Inc(Result);
  Result:= Result + 1;
end;

procedure TMain.Montar1Click(Sender: TObject);
var
  i, Posicao: integer;
  s: string;
begin
  if especif then
  try
    Screen.Cursor:= crHourglass;
    // monta array estados
    SetLength(estados, NumItems(edEstado.Text));
    i:= 0;
    s:= '';
    for Posicao:= 1 to Length(edEstado.Text) do
    begin
      if edEstado.Text[Posicao] <> ',' then
        s:= s + edEstado.Text[Posicao]
      else
      begin
        estados[i]:= s;
        s:= '';
        Inc(i);
      end;
    end;
    estados[i]:= s;
    // todos os itens de estado ñ podem ser vazio
    for i:= 1 to length(estados) do
      if length(estados[i-1]) = 0 then
      begin
        MessageBoxEx(Handle, 'Os estados não foram definidos corretamente!', 'Montar Tabela', 16, 0);
        Abort;
      end;
    // monta array alfabeto
    SetLength(alfabeto, NumItems(edAlfabeto.Text));
    i:= 0;
    s:= '';
    for Posicao:= 1 to Length(edAlfabeto.Text) do
    begin
      if edAlfabeto.Text[Posicao] <> ',' then
        s:= s + edAlfabeto.Text[Posicao]
      else
      begin
        alfabeto[i]:= s;
        s:= '';
        Inc(i);
      end;
    end;
    alfabeto[i]:= s;
    // todos os itens de alfabeto devem ser char e diferentes de &
    for i:= 1 to length(alfabeto) do
      if (length(alfabeto[i -1]) <> 1) or (alfabeto[i-1] = '&') then
      begin
        MessageBoxEx(Handle, 'O alfabeto não foi definido corretamente!', 'Montar Tabela', 16, 0);
        Abort;
      end;
    //monta grid
    if (Length(estados) > 1) and (Length(alfabeto) > 1) then
    begin
      grid.RowCount:= Length(estados) + 1;
      grid.ColCount:= Length(alfabeto) + 1;
      grid.FixedCols:= 1;
      grid.FixedRows:= 1;
      grid.FixedColFont[0].Style:= [fsBold];
      grid.FixAlignCol[0]:= alRight;
      grid.FixedRowFont[0].Style:= [fsBold];
      grid.FixAlignRow[0]:= alCenter;

      for Posicao:= 1 to Length(estados) do
        grid.Cells[0, Posicao]:= estados[Posicao -1] + ' ';
      for Posicao:= 1 to Length(alfabeto) do
        grid.Cells[Posicao, 0]:= alfabeto[Posicao -1];
      grid.Enabled:= true;
    end
    else
    begin
      MessageBoxEx(Handle, 'O alfabeto ou os estados não foram definidos corretamente!', 'Montar Tabela', 16, 0);
      Abort;
    end;
  finally
    Screen.Cursor:= crDefault;
  end // try
  else
    MessageBoxEx(Handle, 'Volte para as especificações!', 'Montar Tabela', 16, 0);
end;


procedure TMain.Salvar1Click(Sender: TObject);
var
  i, j: integer;
begin
  if especif then
  begin
    if save.Execute then
    begin
      Screen.Cursor:= crHourglass;
      with arq do
      begin
        Clear;
        Add(edPadrao.Text);
        Add(edPos.Text);
        Add(edEstado.Text);
        Add(edAlfabeto.Text);
        for i:= 1 to grid.ColCount - 1 do
          for j:= 1 to grid.RowCount - 1 do
            Add(grid.Cells[i,j]);
        SaveToFile(save.FileName);
      end;
      Screen.Cursor:= crDefault;
    end;
  end
  else
    MessageBoxEx(Handle, 'Volte para as especificações!', 'Salvar', 16, 0);
end;

procedure TMain.ConverterPasp1Click(Sender: TObject);
begin
  Convert:= TConvert.Create(self);
  Convert.ShowModal;
end;

procedure TMain.gridValidateEdit(Sender: TObject; col, row: Integer;
  var result: Boolean);
begin
  if ValorInvalido(col,row) then
    grid.CellBrush[col,row].Color:= clYellow
  else
    grid.CellBrush[col,row].Color:= clWindow;
end;

function TMain.ValorInvalido(Col, Row: integer): boolean;
var
  i: integer;
  cel: string;
  estOK, alfOK, dirOK: boolean;
begin
  Result:= false;
  cel:= grid.Cells[col,row];
  if cel <> '' then
  begin
    // ajusta halt
    if UpperCase(cel) = 'HALT' then
      cel:= 'Halt'
    else
    begin
      // verifica símbolo do alfabeto
      alfOK:= false;
      for i:= 1 to length(alfabeto) do
        if UpperCase(cel[1]) = UpperCase(alfabeto[i-1]) then
        begin
          cel[1]:= alfabeto[i-1][1];
          alfOK:= true;
          Break;
        end;

      // verifica direção
      dirOK:= true;
      if UpperCase(cel[2]) = 'L' then
        cel[2]:= 'L'
      else
        if UpperCase(cel[2]) = 'R' then
          cel[2]:= 'R'
        else // não é nem L nem R
          dirOK:= false;

      // verifica estado
      estOK:= false;
      for i:= 1 to length(estados) do
        if UpperCase(Copy(cel,3,Length(cel)-2)) = UpperCase(estados[i-1]) then
        begin
          cel:= Copy(cel,1,2) + estados[i-1];
          estOK:= true;
          Break;
        end;

      Result:= not (estOK and alfOK and dirOK);
    end;
    // mostra valor ajustado
    grid.Cells[col,row]:= cel;
  end;
end;

procedure TMain.SimularExecuo1Click(Sender: TObject);
begin
  if not especif then
  begin
    // enquanto não der halt (ou erro), vai simulando
    simulaExec:= true;
    while simulando do
      PassoaPasso1Click(Sender);
    simulaExec:= false;
    g.Row:= g.RowCount - 1;
  end
  else
    MessageBoxEx(Handle, 'Clique em Avançar!', 'Simular Execução', 16, 0);
end;

procedure TMain.Avanar1Click(Sender: TObject);
begin
  if TudoOk then
  begin
    status.SimpleText:= '';
    especif:= false;
    simulando:= true;
    p2.Visible:= true;
    p1.Visible:= false;
    btVoltar.Enabled:= true;
    btAvancar.Enabled:= false;
    contPasso:= 1;
    fita:= edPadrao.Text;
    Posicao:= edPos.ValInt;
    MostraPasso(contPasso, Posicao, estados[0], fita);
    // a largura duma letra Courier New 8 é 7
    // se a fita tiver um comprimento maior que o previsto, ajusta
    if (length(fita) * 7) > 495 then
      g.AdjustColWidth(3);
  end
  else
    MessageBoxEx(Handle, 'Existe(m) erro(s) nas entradas de dados!', 'Avançar', 16, 0);
end;

procedure TMain.Voltar1Click(Sender: TObject);
begin
  especif:= true;
  simulando:= false;
  p1.Visible:= true;
  p2.Visible:= false;
  btVoltar.Enabled:= false;
  btAvancar.Enabled:= true;
  // limpa o grid
  g.RowCount:= 1;
  g.ColWidths[3]:= 495;
  lEntrada.Caption:= '';
  lSaida.Caption:= '';
  contPasso:= 1;
end;

function TMain.TudoOk: boolean;
begin
  // verifica tudo
  Result:= FitaValida(edPadrao.Text) and PosValida(edPadrao.Text, edPos.ValInt) and AcoesValidas;
end;

function TMain.PosValida(Fita: string; Posicao: integer): boolean;
begin
  // verifica se a Posicao inicial é válida
  Result:= (Posicao > 0) and (Posicao <= Length(Fita));
end;

function TMain.AcoesValidas: boolean;
var
  i, j: integer;
begin
  // se tiver alguma célula errada (yellow), retorna false
  result:= true;
  for i:= 1 to grid.ColCount - 1 do
  begin
    for j:= 1 to grid.RowCount - 1 do
      if grid.CellBrush[i,j].Color = clYellow then
      begin
        Result:= false;
        Break;
      end;
    if not Result then Break;
  end;
end;

procedure TMain.PassoaPasso1Click(Sender: TObject);
begin
  if not especif then
  begin
    if acao <> '' then
    begin
      if acao = 'Halt' then // terminou
      begin
        simulando:= false;
        lEntrada.Caption:= Copy(edPadrao.Text, 1, edPos.ValInt - 1) + '&' +
          Copy(edPadrao.Text, edPos.ValInt, length(edPadrao.Text) - edPos.ValInt + 1);
        lSaida.Caption:= Copy(fita, 1, Posicao - 1) + '&' + Copy(fita, Posicao, length(fita) - Posicao + 1);
        MessageBoxEx(Handle, 'Halt', 'Simular', MB_ICONINFORMATION + MB_OK, 0);
      end
      else
      begin
        // muda o símbolo na Posicao p/ o indicado na açao
        fita[Posicao]:= acao[1];
        // anda com o cabeçote
        if acao[2] = 'L' then
          Dec(Posicao)
        else
          Inc(Posicao);
        // muda p/ o estado da ação
        estado:= Copy(acao, 3, length(acao) - 2);
        // prox passo
        Inc(contPasso);
        MostraPasso(contPasso, Posicao, estado, fita);
      end;
    end
    else
    begin
      MessageBoxEx(Handle, 'Não há uma ação definida para o símbolo e estado atuais!', 'Simular Passo a Passo', 16, 0);
      btVoltar.Click;
    end;
  end
  else
    MessageBoxEx(Handle, 'Clique em Avançar!', 'Simular Passo a Passo', 16, 0);
end;

procedure TMain.MostraPasso(Passo, Posicao: integer; Estado,
  Fita: string);
var
  //p: TPasso;
  i, alf, est: integer;
begin
  // adiciona linha ao grid
  g.RowCount:= g.RowCount + 1;
  // nº do passo
  g.CellAsInt[0,passo]:= passo;
  // lê símbolo na fita
  g.Cells[1,passo]:= Fita[Posicao];
  // lê estado
  g.Cells[2,passo]:= Estado;
  // fita indicando a Posicao
  Insert('&', Fita, Posicao);
  g.Cells[3,passo]:= Fita;
  // determina a açao
  alf:= 0; est:= 0;
  for i:= 1 to Length(estados) do
    if estados[i - 1] = Estado then
    begin
      alf:= i;
      Break;
    end;
  for i:= 1 to Length(alfabeto) do
    if alfabeto[i - 1] = g.Cells[1,passo] then
    begin
      est:= i;
      Break;
    end;
  // mostra ação
  g.Cells[4,passo]:= grid.Cells[est, alf];
  acao:= grid.Cells[est, alf];
  // se ação estiver vazia, já marca lá no grid
  if acao = '' then
    grid.CellBrush[est, alf].Color:= clYellow;
  // mostra no grid
  if passo mod 2 = 0 then
    g.RowBrush[passo].Color:= $F0F0F0
  else
    g.RowBrush[passo].Color:= clWhite;
  // mostra os cabeçalhos
  if g.FixedRows = 0 then
    g.FixedRows:= 1;
  // se for passo a passo vai descendo a tabela
  if not simulaExec then
    g.Row:= g.RowCount - 1;
end;

function TMain.FitaValida(Fita: string): boolean;
var
  i: integer;
begin
  Result:= true;
  for i:= 1 to length(Fita) do
    if not SimboloValido(Fita[i]) then
    begin
      Result:= false;
      Break;
    end;
end;

function TMain.SimboloValido(Simbolo: string): boolean;
var
  i: integer;
begin
  Result:= false;
  for i:= 1 to length(alfabeto) do
    if alfabeto[i-1] = Simbolo then
    begin
      Result:= true;
      Break;
    end;
end;

procedure TMain.gDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  p: integer;
  cell: string;
begin
  with g do
  begin
    if (aCol = 3) and (aRow <> 0) then
    begin
      p:= Pos('&', cells[3, aRow]);
      if p <> 0 then
      begin
        cell:= cells[3,aRow];
        delete(cell, p, 1);
        Canvas.TextRect(Rect, Rect.Left, Rect.Top, cell);
        //canvas.Font.Color:= clRed;
        canvas.Font.Style:= [fsBold];
        canvas.TextOut(Rect.left + (7 * (p - 1)),rect.Top,cell[p]);
        canvas.Font.Style:= [];
        //canvas.Font.Color:= clWindowText;
        Canvas.FrameRect(Rect);
      end;
    end;
  end;
end;

procedure TMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    MessageBoxEx(Handle, 'feito por Pablo Lima Dias'#13'baseado no Pasp2'#13#13'pabloidz 2003'#13'pabloidz@powerline.com.br',
    'Sobre SimTur', MB_ICONINFORMATION + MB_OK, 0);
end;

end.
