{
******************************************************************
IMPLEMENTAÇÃO DO ALGORITMO DAS CINCO CORES
******************************************************************
}

unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, StrUtils, Buttons;

type
  Tmain = class(TForm)
    grid: TStringGrid;
    Label2: TLabel;
    edNVert: TEdit;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    grid2: TStringGrid;
    btAvancar: TSpeedButton;
    btColorir: TSpeedButton;
    btExemplo: TSpeedButton;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    btSobre: TSpeedButton;

    procedure CincoCores;
    function NVertSemCor: integer;
    function CorPossivel(Vertice: integer): integer;
    procedure MontaTabAdj;
    function ProxVert: integer;
    function AchaVert5: integer;
    function AdjUsam5Cores(Vertice: integer): boolean;
    procedure ModificaRedor(Vertice: integer);

    procedure FormCreate(Sender: TObject);
    procedure btAvancarClick(Sender: TObject);
    procedure btExemploClick(Sender: TObject);
    procedure edNVertChange(Sender: TObject);
    procedure gridClick(Sender: TObject);
    procedure btColorirClick(Sender: TObject);
    procedure edNVertKeyPress(Sender: TObject; var Key: Char);
    procedure btSobreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main: Tmain;

  // array verts guarda as cores em cada vértice
  // as cores serão representadas por nºs inteiros > 0 (de 1 a 5)
  // var booleana colorido indica se já foi colorido ou não
  verts: array of
    record
      cor: integer;
      colorido: boolean;
    end;

  // array que guarda a tabela de adjacências entrada pelo usuário
  // a fim de facilitar o acesso às arestas de cada vértice
  tabAdj: array of array of integer;

  // var vertice guarda o índice do vértice sendo trabalhado atualmente
  vertice: integer;


implementation

{$R *.dfm}




// realiza a coloração
procedure Tmain.CincoCores;
var
  // vert5 guarda o índice de um vértice com grau >= 5
  vert5, i: integer;
  // guarda as adjacencias de um vértice com grau >= 5
  adjVert5: array of integer;
begin
  // se há 5 ou menos vértices sem cor
  if NVertSemCor <= 5 then
  begin

    // enquanto houver vértices a serem coloridos
    while NVertSemCor <> 0 do
    begin
      // encontra um vértice não colorido
      vertice:= ProxVert;
      // colore
      verts[vertice].cor:= CorPossivel(vertice);
      verts[vertice].colorido:= true;
    end;

  end
  else //o grafo tem mais de 5 vértices
  begin

    // tenta selecionar um vértice de grau >= 5
    vert5:= AchaVert5;

    // se não houver vértices de grau >= 5
    if vert5 = -1 then
    begin

      // colore normalmente enquanto houver vértices a serem coloridos
      while NVertSemCor <> 0 do
      begin
        // encontra um vértice não colorido
        vertice:= ProxVert;
        // colore o vertice
        verts[vertice].cor:= CorPossivel(vertice);
        verts[vertice].colorido:= true;
      end;

    end
    else // existe um vértice com grau >= 5
    begin

      verts[vert5].colorido:= true;

      // alocar espaço para a array que guardará os verts adjacentes ao vert de grau >= 5
      SetLength(adjVert5, Length(tabAdj));
      for i:= 0 to Length(adjVert5) - 1 do
      begin
        // guardo num array as adjacencias do vertice de grau >= 5
        adjVert5[i]:= tabAdj[vert5][i];
        // retiro da matriz de adjacencias o vértice
        tabAdj[vert5][i]:= 0;
        tabAdj[i][vert5]:= 0;
      end;

      // colore o grafo sem contar o vert5
      CincoCores;

      // incluo novamente no array de adjacencias as arestas que haviam sido retiradas
      for i:= 0 to Length(adjVert5) - 1 do
      begin
        tabAdj[vert5][i]:= adjVert5[i];
        tabAdj[i][vert5]:= adjVert5[i];
      end;

      // verifico ao redor do vértice de grau >= 5
      // se os verts adjacentes usarem as cinco cores
      if AdjUsam5Cores(vert5) then
        ModificaRedor(vert5);
        // modifica as cores ao redor do vert5,
        // de modo que fiquem somente 4 cores ao redor


      // a cor do vert5 será uma cor não usada pelos verts adjacentes
      verts[vert5].cor:= CorPossivel(vert5);
      verts[vert5].colorido:= true;

    end;

  end;
end;




// faz a contagem de quantos vértices ainda não foram coloridos
function Tmain.NVertSemCor: integer;
var
  i: integer;
begin
  Result:= 0;
  for i:= 0 to Length(verts) - 1 do
    if verts[i].colorido = false then Result:= Result + 1;
end;


{
Retorna uma cor que pode ser usada pelo vértice, isto é,
não está sendo utilizada pelos vértices adjacentes.}
function Tmain.CorPossivel(Vertice: integer): integer;
var
  usado: array [1..5] of boolean;
  i: integer;
begin
  Result:= -1;
  for i:= 1 to 5 do
    usado[i]:= false;

  for i:= 0 to Length(TabAdj) - 1 do
    // se for adjacente ao Vertice
    if tabAdj[i][Vertice] = 1 then
      // se o vert adjacente estiver colorido
      if verts[i].colorido = true then
        // ver qual a cor usada pelo vert adjacente, e marcar ela como usada
        usado[verts[i].cor]:= true;

  // verificar qual a primeira cor que não foi utilizada ainda e retornar seu nº
  for i:= 1 to 5 do
    if usado[i] = false then
    begin
      Result:= i;
      break;
    end;
end;


// passa a tabela que está no grid para a array de inteiros
// essa array é espelhada, ao contrário do grid
procedure Tmain.MontaTabAdj;
var
  i, j: integer;
begin
  // aloca espaço para o array
  SetLength(tabAdj, grid.RowCount - 1);
  for i:= 0 to Length(tabAdj) - 1 do
    SetLength(tabAdj[i], Length(tabAdj));
  // copia os valores do grid para a array
  for i:= 0 to Length(tabAdj) - 1 do
    for j:= 0 to Length(tabAdj) - 1 do
    begin
      if i > j then
        // matriz triangular superior
        tabadj[i][j]:= StrToInt(grid.Cells[i + 1, j + 1])
      else
        if i < j then
          // matriz triangular inferior (espelho da superior)
          tabadj[i][j]:= StrToInt(grid.Cells[j + 1, i + 1])
        else
          if i = j then
            // diagonal principal
            tabadj[i][j]:= 0;
    end;
end;


// informa o índice do primeiro vértice não colorido
function Tmain.ProxVert: integer;
var
  i: integer;
begin
  Result:= -1;
  for i:= 0 to Length(verts) - 1 do
    if verts[i].colorido = false then
    begin
      Result:= i;
      break;
    end;
end;


// retorna o índice de um vértice maior que 5 ainda não colorido
// se não achar retorna -1
function Tmain.AchaVert5: integer;
var
  i, j, nv: integer;
begin
  Result:= -1;
  for i:= 0 to Length(tabAdj) - 1 do
  begin

    nv:= 0;
    for j:= 0 to Length(tabAdj) - 1 do
      if tabAdj[i][j] = 1 then Inc(nv);

    if nv >= 5 then
    begin
      Result:= i;
      Break;
    end;

  end;
end;


// verifica se os vértices adjacentes ao Vertice passado utilizam todas as 5 cores
function Tmain.AdjUsam5Cores(Vertice: integer): boolean;
var
  i: integer;
  usado: array [1..5] of boolean;
begin
  for i:= 1 to 5 do
    usado[i]:= false;

  for i:= 0 to Length(TabAdj) - 1 do
    // se for adjacente ao Vertice
    if tabAdj[i][Vertice] = 1 then
      // se o vert adjacente estiver colorido
      if verts[i].colorido = true then
        // ver qual a cor usada pelo vert adjacente, e marcar ela como usada
        usado[verts[i].cor]:= true;

  // retorna true se todas as cinco cores foram usadas
  Result:= usado[1] and usado[2] and usado[3] and usado[4] and usado[5];
end;



// se os vértices adjacentes ao Vértice escolhido utilizam todas as 5 cores,
// modifica essa coloração ao redor de modo a esses vértices usarem somente 4 cores
procedure Tmain.ModificaRedor(Vertice: integer);
var
  i, j: integer;
begin
  // encontrar dois vértices não-conexos que sejam adjacentes ao Vértice
  for i:= 0 to Length(tabAdj) - 1 do for j:= 0 to Length(tabAdj) - 1 do
    if
      (tabAdj[Vertice][i] = 1) and (tabAdj[Vertice][j] = 1) // são adjs. ao Vertice
      and (tabAdj[i][j] = 0) // i e j são desconexos
      and (verts[i].cor <> verts[j].cor) // i e j tem cores diferentes
      and (CorPossivel(i) = CorPossivel(j))
      and (CorPossivel(i) <> -1)
    then
    begin
      // muda os dois para essa mesma cor
      verts[i].cor:= CorPossivel(i);
      verts[j].cor:= CorPossivel(j);
      Abort;
    end;
    
end;





{ Funções da interface do programa }


procedure Tmain.FormCreate(Sender: TObject);
begin
  // inicializações
  grid.ColCount:= 1;
  grid.RowCount:= 1;
  grid.Enabled:= false;
  panel1.Left:= 120;
  panel1.Top:= 10;
end;

procedure Tmain.btAvancarClick(Sender: TObject);
var
  nvert, i, j: integer;
begin
  // lê o nº de vértices entrado
  nvert:= StrToIntDef(edNVert.Text, 0);
  // se o valor é válido
  if nvert <> 0 then
  begin
    // monta o grid para a entrada das arestas
    grid.ColCount:= nvert + 1;
    grid.RowCount:= nvert + 1;
    grid.FixedCols:= 1;
    grid.FixedRows:= 1;
    // monta o grid que mostrará a coloração
    grid2.ColCount:= nvert;
    // escreve os valores no grid de arestas
    for i:= 1 to nvert do
    begin
      grid.Cells[0,i]:= 'v' + IntToStr(i - 1);
      grid.Cells[i,0]:= 'v' + IntToStr(i - 1);
      for j:= 1 to nvert do
        // só vou usar a matriz triangular superior
        if (i = j) or (i < j) then
          grid.Cells[i,j]:= '-'
        else
          grid.Cells[i,j]:= '0';

      grid2.Cells[i,0]:= 'v'+ IntToStr(i);
    end;
    // escreve os valores no grid de cores
    for i:= 0 to nvert - 1 do
    begin
      grid2.Cells[i,0]:= 'v' + IntToStr(i);
      grid2.Cells[i,1]:= '';
    end;

    // habilita a continuar
    grid.Enabled:= true;
    grid2.Enabled:= true;
    btAvancar.Enabled:= false;
    btColorir.Enabled:= true;
  end
  else // se valor não é válido
    MessageDlg('Por favor, digite um nº de vértices válido.', mtError,
      [mbOk],0);
end;

procedure Tmain.btExemploClick(Sender: TObject);
begin
  edNVert.Text:= '7';
  btAvancarClick(btAvancar);
  // insere as adjacencias no grid
  with grid do
  begin
    // formato: cells[coluna, linha]:= 1 se ncoluna adjacente a nlinha
    cells[2,1]:= '1';
    cells[3,1]:= '1';
    cells[4,1]:= '1';
    cells[5,1]:= '1';
    cells[6,1]:= '1';
    cells[5,2]:= '1';
    cells[6,2]:= '1';
    cells[7,2]:= '1';
    cells[4,3]:= '1';
    cells[5,3]:= '1';
    cells[7,3]:= '1';
    cells[6,5]:= '1';
    cells[7,5]:= '1';
  end;
end;


// se mudar o nº de vértices, volta os botões ao estado inicial
procedure Tmain.edNVertChange(Sender: TObject);
begin
  if not btAvancar.Enabled then
  begin
    btAvancar.Enabled:= not btAvancar.Enabled;
    btColorir.Enabled:= not btColorir.Enabled;
  end;
end;


// se digitar o nº de verts e apertar Enter, já monta o grid
procedure Tmain.edNVertKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btAvancarClick(btAvancar);
end;


// só aceita clicar na matriz triangular superior
procedure Tmain.gridClick(Sender: TObject);
begin
  if (grid.Row <> grid.Col) or (grid.Row < grid.Col) then
    if grid.Cells[grid.Col,grid.Row] <> '-' then
      grid.Cells[grid.Col,grid.Row]:= IfThen(grid.Cells[grid.Col,grid.Row] = '1', '0', '1');
end;

procedure Tmain.btColorirClick(Sender: TObject);
var
  i: integer;
  ok: boolean; // diz se foi possível colorir o grafo
begin
  SetLength(verts, grid.ColCount - 1); // monta o array de vértices
  for i:= 0 to Length(verts) - 1 do  // inicializa o array de vertices
  begin
    verts[i].cor:= -1;
    verts[i].colorido:= false;
  end;
  MontaTabAdj; // monta a array com as adjacencias, copiando do grid
  CincoCores; // aplica o algoritmo de coloração

  { só haverá uma coloração válida se o grafo for planar;
    contudo, no caso de alguns grafos não-planares,
    como o grafo de Kuratowski de grau 5, a coloração com 5 cores é possível}
  ok:= true;
  for i:= 0 to Length(verts) - 1 do
  begin

    if verts[i].cor = -1 then // se não pode fazer a coloração correta, terá cor -1
      ok:= false;
    grid2.Cells[i,1]:= IntToStr(verts[i].cor); // mostra a cor de cada vértice no grid

  end;

  // dá mensagem se não era um grafo planar
  if not ok then
    MessageDlg('O grafo não é planar, por isso não pôde ser colorido corretamente.',
      mtError, [mbOk],0);
end;


procedure Tmain.btSobreClick(Sender: TObject);
begin
  panel1.Visible:= not panel1.Visible;
  btSobre.Caption:= ifthen(btSobre.Caption = 'Sobre', 'Voltar', 'Sobre');
end;

end.
