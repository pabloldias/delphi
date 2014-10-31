unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, MMSystem, Label3D, StdCtrls, Registry, Buttons, Lklabel,
  MPlayer;

type

  TMarcada = record
    Marcada: boolean;
    NumPeca: integer;
  end;

  TPeca = record
    Num: integer;
    Coord: string;
    Vis: boolean;
  end;

  TJogada = record
    Peca1, Peca2: TMarcada;
  end;

  TMain = class(TForm)
    i1: TImage;
    i2: TImage;
    i3: TImage;
    i4: TImage;
    i5: TImage;
    i6: TImage;
    i7: TImage;
    i8: TImage;
    i9: TImage;
    i10: TImage;
    i11: TImage;
    i12: TImage;
    i13: TImage;
    i14: TImage;
    i15: TImage;
    i16: TImage;
    i17: TImage;
    i18: TImage;
    i19: TImage;
    i20: TImage;
    i21: TImage;
    i22: TImage;
    i23: TImage;
    i24: TImage;
    i25: TImage;
    i26: TImage;
    i27: TImage;
    i28: TImage;
    i29: TImage;
    i30: TImage;
    i32: TImage;
    i33: TImage;
    i34: TImage;
    i35: TImage;
    i36: TImage;
    i37: TImage;
    i38: TImage;
    i39: TImage;
    i40: TImage;
    i41: TImage;
    i42: TImage;
    i43: TImage;
    i46: TImage;
    i47: TImage;
    i48: TImage;
    i49: TImage;
    i50: TImage;
    i51: TImage;
    i52: TImage;
    i53: TImage;
    i54: TImage;
    i55: TImage;
    i56: TImage;
    i57: TImage;
    i58: TImage;
    i59: TImage;
    i60: TImage;
    i61: TImage;
    i62: TImage;
    i63: TImage;
    i64: TImage;
    i65: TImage;
    i66: TImage;
    i67: TImage;
    i68: TImage;
    i69: TImage;
    i70: TImage;
    i71: TImage;
    i72: TImage;
    i73: TImage;
    i74: TImage;
    i75: TImage;
    i76: TImage;
    i77: TImage;
    i78: TImage;
    i79: TImage;
    i80: TImage;
    i81: TImage;
    i82: TImage;
    i83: TImage;
    i84: TImage;
    i85: TImage;
    i86: TImage;
    i87: TImage;
    i31: TImage;
    i44: TImage;
    i45: TImage;
    i88: TImage;
    i89: TImage;
    i90: TImage;
    i91: TImage;
    i92: TImage;
    i93: TImage;
    i94: TImage;
    i95: TImage;
    i96: TImage;
    i97: TImage;
    i98: TImage;
    i99: TImage;
    i100: TImage;
    i101: TImage;
    i102: TImage;
    i103: TImage;
    i104: TImage;
    i105: TImage;
    i106: TImage;
    i107: TImage;
    i108: TImage;
    i109: TImage;
    i110: TImage;
    i111: TImage;
    i112: TImage;
    i113: TImage;
    i114: TImage;
    i115: TImage;
    i116: TImage;
    i117: TImage;
    i118: TImage;
    i119: TImage;
    i120: TImage;
    i121: TImage;
    i122: TImage;
    i123: TImage;
    i124: TImage;
    i125: TImage;
    i126: TImage;
    i127: TImage;
    i128: TImage;
    i129: TImage;
    i130: TImage;
    i131: TImage;
    i132: TImage;
    i133: TImage;
    i134: TImage;
    i135: TImage;
    i136: TImage;
    i137: TImage;
    i138: TImage;
    i139: TImage;
    i140: TImage;
    i141: TImage;
    i142: TImage;
    i143: TImage;
    i144: TImage;
    MainMenu1: TMainMenu;
    Jogo1: TMenuItem;
    Novo1: TMenuItem;
    Reiniciar1: TMenuItem;
    N2: TMenuItem;
    VoltarJogada1: TMenuItem;
    N3: TMenuItem;
    Recordes1: TMenuItem;
    N4: TMenuItem;
    Sair1: TMenuItem;
    Ajuda1: TMenuItem;
    ComoJogar1: TMenuItem;
    Sobre1: TMenuItem;
    clock: TLabel3D;
    Timer1: TTimer;
    numpecas: TLabel3D;
    Label3D1: TLabel3D;
    Som1: TMenuItem;
    gameover: TLabel3D;
    N1: TMenuItem;
    final: TNotebook;
    ii1: TImage;
    ii2: TImage;
    ii3: TImage;
    ii4: TImage;
    it1: TImage;
    it2: TImage;
    it3: TImage;
    it4: TImage;
    timerF: TTimer;
    ibuf: TImage;
    tFade: TTimer;
    procedure CarregaFigura(Peca: TImage; NumPeca: integer); overload;
    procedure NovoTabuleiro(Reinicia: boolean);
    procedure Embaralha;
    procedure MapeiaTodas;
    procedure FormCreate(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure MarcaPeca(Sender: TImage; var Peca: TMarcada);
    procedure ClicaPeca(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Desmarca(var Peca: TMarcada);
    function IgualPrimeira(Sender: TImage): boolean;
    function PecaLivre(NumPeca: integer): boolean;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Reiniciar1Click(Sender: TObject);
    function Acabou: boolean;
    procedure Timer1Timer(Sender: TObject);
    procedure VoltarJogada1Click(Sender: TObject);
    procedure Toca(Som: string);
    procedure Som1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Recordes1Click(Sender: TObject);
    procedure EntraScore(Pecas: integer; Tempo: TTime);
    procedure FormDestroy(Sender: TObject);
    procedure MostraFinal;
    procedure timerFTimer(Sender: TObject);
    procedure ComoJogar1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure RetiraPecas;
    procedure tFadeTimer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CarregaFigura(Image: TImage; Nome: string); overload;
  end;

const
  // sons do jogo
  Sim = 'sim.wav';
  Nao = 'nao.wav';
  Par = 'par.wav';

var
  Main: TMain;

  // tab1 é o 1º andar, onde estão a maioria das peças
  tab1: array [1..8, 0..16] of integer = (
    (0,0,1,2,3,4,5,6,7,8,9,10,11,12,0,0,0),
    (0,0,0,0,13,14,15,16,17,18,19,20,0,0,0,0,0),
    (0,0,0,21,22,23,24,25,26,27,28,29,30,0,0,0,0),
    (0,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,0),
    (0,31,46,47,48,49,50,51,52,53,54,55,56,57,44,45,0),
    (0,0,0,58,59,60,61,62,63,64,65,66,67,0,0,0,0),
    (0,0,0,0,68,69,70,71,72,73,74,75,0,0,0,0,0),
    (0,0,76,77,78,79,80,81,82,83,84,85,86,87,0,0,0)
    );
  tab2: array [2..7, 4..11] of integer = (
    (0,88,89,90,91,92,93,0),
    (0,94,95,96,97,98,99,0),
    (0,100,101,102,103,104,105,0),
    (0,106,107,108,109,110,111,0),
    (0,112,113,114,115,116,117,0),
    (0,118,119,120,121,122,123,0)
    );
  tab3: array [3..6, 5..10] of integer = (
    (0,124,125,126,127,0),
    (0,128,129,130,131,0),
    (0,132,133,134,135,0),
    (0,136,137,138,139,0)
    );
  tab4: array [4..5, 6..9] of integer = ((0,140,141,0), (0,142,143,0));
  // tab5 só contém uma peça, que cobre as 4 de baixo
  tab5: array [4..5, 7..8] of integer = ((144,144), (144,144));

  // tab representa o tabuleiro em si, dizendo qual imagem está em cada posição
  tabul: array [1..144] of TPeca;

  Res: TResourceStream;
  b: TBitmap;

  Primeira, Segunda: TMarcada;

  Jogando: boolean = false;

  Comeco: TTime;

  TotalPecas: integer;

  Jogadas: array [1..72] of TJogada;
  NumJogada: integer; // ponteiro para indice da ultima jogada

  reg: TRegIniFile;

implementation

uses uScore, ufScore;

{$R *.DFM}
{$R PECAS.RES}

{ TForm1 }

procedure TMain.CarregaFigura(Peca: TImage; NumPeca: integer);
begin
  // essa é usada para carregar as peças
  Res:= TResourceStream.Create(Hinstance, 'a' + IntToStr(NumPeca), Pchar('FILE'));
  b.LoadFromStream(res);
  Peca.Picture.Bitmap:= b;
  Res.Free;
end;

procedure TMain.CarregaFigura(Image: TImage; Nome: string);
begin
  // carrega qq figura
  Res:= TResourceStream.Create(Hinstance, Nome, Pchar('FILE'));
  b.LoadFromStream(res);
  Image.Picture.Bitmap:= b;
  Res.Free;
end;

procedure TMain.Embaralha;
var
  i, j, k, aux: integer;
begin
  // embaralha as peças para uma nova partida
  for i:= 1 to 144 do
  begin
    j:= Random(144) + 1;
    k:= Random(144) + 1;
    aux:= tabul[j].Num;
    tabul[j].Num:= tabul[k].Num;
    tabul[k].Num:= aux;
  end;
end;

procedure TMain.NovoTabuleiro(Reinicia: boolean);
var
  i: integer;
begin
  if not Reinicia then
    Embaralha;
  // mostra todas na tela
  for i:= 1 to 144 do
  begin
    tabul[i].Vis:= true;
    TImage(FindComponent('i' + IntToStr(i))).Visible:= true;
    CarregaFigura(TImage(FindComponent('i' + IntToStr(i))), tabul[i].Num);
  end;
  // inicializa vars
  Jogando:= true;
  Primeira.Marcada:= false;
  Segunda.Marcada:= false;
  NumJogada:= 0;
  gameover.Visible:= false;
  // mostra nº peças
  TotalPecas:= 144;
  numpecas.Caption:= IntToStr(TotalPecas);
  // dispara relógio
  Comeco:= Time;
  Timer1.Enabled:= true;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  i, j: integer;
begin
  Randomize;
  b:= TBitmap.Create;
  // lê configs
  reg:= TRegIniFile.Create('Software\pabloidz');
  Som1.Checked:= reg.ReadBool('ATField', 'SoundEnabled', true);
  reg.Destroy;
  // inicializa tabuleiro
  for i:= 1 to 36 do
    for j:= 0 to 3 do
      tabul[i + (j * 36)].Num:= i;
  // indica onde estão todas as peças
  MapeiaTodas;
  // inicia um jogo
  NovoTabuleiro(false);
end;

procedure TMain.Novo1Click(Sender: TObject);
begin
  if not final.Visible then
    if MessageBoxEx(Handle, 'Tem certeza de que deseja iniciar um novo jogo?', 'Novo Jogo',
      36, 0) = idYes then NovoTabuleiro(false);
end;

procedure TMain.FormPaint(Sender: TObject);
begin
  // carrega fundo
  Res:= TResourceStream.Create(Hinstance, 'fundo', Pchar('FILE'));
  b.LoadFromStream(res);
  Canvas.Draw(0,0,b);
  Res.Free;
end;

procedure TMain.MapeiaTodas;
var
  i, j: integer;
begin
  // coloca em cada coord do Tabul uma string de forma "TLC", onde:
  // T: tab(1..5), L:linha, C: coluna
  for i:= 1 to 8 do for j:= 1 to 15 do if tab1[i,j] <> 0 then
    tabul[tab1[i,j]].Coord:= '1' + IntToStr(i) + IntToStr(j);
  for i:= 2 to 7 do for j:= 5 to 10 do if tab2[i,j] <> 0 then
    tabul[tab2[i,j]].Coord:= '2' + IntToStr(i) + IntToStr(j);
  for i:= 3 to 6 do for j:= 6 to 9 do if tab3[i,j] <> 0 then
    tabul[tab3[i,j]].Coord:= '3' + IntToStr(i) + IntToStr(j);
  for i:= 4 to 5 do for j:= 7 to 8 do if tab4[i,j] <> 0 then
    tabul[tab4[i,j]].Coord:= '4' + IntToStr(i) + IntToStr(j);
  for i:= 4 to 5 do for j:= 7 to 8 do if tab5[i,j] <> 0 then
    tabul[tab5[i,j]].Coord:= '5' + IntToStr(i) + IntToStr(j);
  // coloca na tag de cada TImage o nº dela (i23 -> tag 23)
  for i:= 1 to 144 do
    TImage(FindComponent('i'+IntToStr(i))).Tag:= i;
end;

procedure TMain.MarcaPeca(Sender: TImage; var Peca: TMarcada);
var
  i,j, media: integer;
  corRgb: longint;
begin
  Peca.NumPeca:= TImage(Sender).Tag;

  // muda os pixels da figura para tons de cinza
  for i:= 1 to 51 do
    for j:= 1 to 51 do begin
      corRgb:= ColorToRgb(TImage(Sender).Canvas.Pixels[i,j]);
      media:= (GetRValue(corRgb) + GetGValue(corRgb) + GetBValue(corRgb)) div 3;
      TImage(Sender).Canvas.Pixels[i,j]:= RGB(media, media, media);
  end;

  Peca.Marcada:= true;
end;

procedure TMain.ClicaPeca(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  if Jogando then
  begin

    // se clicou com botão esquerdo
    if Button = mbLeft then
    begin

      // se 1ª não está marcada
      if not Primeira.Marcada then
      begin

        // vê se a peça está livre
        if PecaLivre(TImage(Sender).Tag) then
        begin
          // se pode então marca
          MarcaPeca(TImage(Sender), Primeira);
          Toca(Sim);
        end
        else
          Toca(Nao);

      end
      else // senão, se a 1ª já está marcada
      begin

        // vê se a 2ª está marcada
        if not Segunda.Marcada then
        begin

          if IgualPrimeira(TImage(Sender)) and PecaLivre(TImage(Sender).Tag) then
          begin
            MarcaPeca(TImage(Sender), Segunda);
            Toca(Sim);
          end
          else
            Toca(Nao);

        end
        else // ambas peças estão marcadas
        begin

          Toca(Par);
          // tira as peças da tela e verifica se o jogo acabou
          RetiraPecas;

        end; // endif else 2ª

      end; // endif else 1ª

    end; // endif mbLeft


    // se clicou com botão direito
    if Button = mbRight then
    begin

      // se 1ª não está marcada
      if Primeira.Marcada then
      begin

        // vê se a 2ª está marcada
        if not Segunda.Marcada then
          Desmarca(Primeira)
        else // ambas peças estão marcadas
          Desmarca(Segunda);

      end;

    end;  // endif mbRight

  end; // endif Jogando
end;

function TMain.IgualPrimeira(Sender: TImage): boolean;
begin
  Result:= false;
  // só marcou a 1ª até agora
  if Primeira.Marcada and not Segunda.Marcada then
  begin
    Segunda.NumPeca:= TImage(Sender).Tag;
    // desenhos são iguais e não está clicando na mesma peça
    Result:= (tabul[Primeira.NumPeca].Num = tabul[Segunda.NumPeca].Num) and
      (Primeira.NumPeca <> Segunda.NumPeca);
  end;
end;

function TMain.PecaLivre(NumPeca: integer): boolean;
var
  t, l, c: integer;
begin
  // decodifica a hint do TImage
  t:= StrToInt(Copy(tabul[NumPeca].Coord,1,1));
  l:= StrToInt(Copy(tabul[NumPeca].Coord,2,1));
  c:= StrToInt(Copy(tabul[NumPeca].Coord,3,Length(tabul[NumPeca].Coord)-2));

  Result:= false;

  case t of
    1:
    begin
      // pode deslizar ou para a esquerda ou para a direita
      if (tab1[l,c-1] = 0) or (not tabul[tab1[l,c-1]].Vis) or
        (tab1[l,c+1] = 0) or (not tabul[tab1[l,c+1]].Vis) then
      begin
        // vê se tem peça em cima
        if (l in [2..7]) and (c in [5..10]) then
          // não há peça em cima
          Result:= not tabul[tab2[l,c]].Vis
        else // não tem como ter peça em cima
          Result:= true;
      end;
    end;

    2:
    begin
      // pode deslizar ou para a esquerda ou para a direita
      if (tab2[l,c-1] = 0) or (not tabul[tab2[l,c-1]].Vis) or
        (tab2[l,c+1] = 0) or (not tabul[tab2[l,c+1]].Vis) then
      begin
        // vê se tem peça em cima
        if (l in [3..6]) and (c in [6..9]) then
          // não há peça em cima
          Result:= not tabul[tab3[l,c]].Vis
        else // não tem como ter peça em cima
          Result:= true;
      end;
    end;

    3:
    begin
      // pode deslizar ou para a esquerda ou para a direita
      if (tab3[l,c-1] = 0) or (not tabul[tab3[l,c-1]].Vis) or
        (tab3[l,c+1] = 0) or (not tabul[tab3[l,c+1]].Vis) then
      begin
        // vê se tem peça em cima
        if (l in [4..5]) and (c in [7..8]) then
          // não há peça em cima
          Result:= not tabul[tab4[l,c]].Vis
        else // não tem como ter peça em cima
          Result:= true;
      end;
    end;

    4:
    begin
      // pode deslizar ou para a esquerda ou para a direita
      if (tab4[l,c-1] = 0) or (not tabul[tab4[l,c-1]].Vis) or
        (tab4[l,c+1] = 0) or (not tabul[tab4[l,c+1]].Vis) then
      begin
        // vê se tem peça em cima
        if (l in [4..5]) and (c in [7..8]) then
          // não há peça em cima
          Result:= not tabul[tab5[l,c]].Vis
        else // não tem como ter peça em cima
          Result:= true;
      end;
    end;

    5: Result:= true;

  end;
end;

procedure TMain.Desmarca(var Peca: TMarcada);
begin
  CarregaFigura(TImage(FindComponent('i'+IntToStr(Peca.NumPeca))),
    tabul[Peca.NumPeca].Num);
  Peca.Marcada:= false;
  Toca(Nao);
end;

procedure TMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) and Jogando then
    ClicaPeca(Sender, Button, Shift, X, Y);
end;

procedure TMain.Reiniciar1Click(Sender: TObject);
begin
  if not final.Visible then
    if MessageBoxEx(Handle, 'Tem certeza de que deseja reiniciar o jogo?', 'Reiniciar',
      36, 0) = idYes then NovoTabuleiro(true);
end;

function TMain.Acabou: boolean;
var
  pecas: array of integer;
  i, j: integer;
begin
  SetLength(pecas, 0);
  Result:= true;
  for i:= 1 to 144 do
  begin
    if tabul[i].Vis then if PecaLivre(i) then
    begin
      // adiciona na lista de peças livres
      SetLength(pecas, Length(pecas) + 1);
      pecas[Length(Pecas)-1]:= tabul[i].Num;
      for j:= Low(pecas) to High(pecas) - 1 do
       // se achou peças livres iguais, pára
        if pecas[j] = tabul[i].Num then
        begin
          Result:= false;
          Break;
        end;
    end;
    if not Result then Break;
  end;
  pecas:= nil;
end;

procedure TMain.Timer1Timer(Sender: TObject);
begin
  clock.Caption:= FormatDateTime('nn:ss', Time - Comeco);
end;

procedure TMain.VoltarJogada1Click(Sender: TObject);
begin
  if (NumJogada > 0) and Jogando then
  begin
    // desmarca as que estiverem marcadas
    if Segunda.Marcada then
      Desmarca(Segunda);
    if Primeira.Marcada then
      Desmarca(Primeira);
    // mostra de novo as peças
    CarregaFigura(TImage(FindComponent('i'+IntToStr(Jogadas[NumJogada].Peca1.NumPeca))),
      tabul[Jogadas[NumJogada].Peca1.NumPeca].Num);
    CarregaFigura(TImage(FindComponent('i'+IntToStr(Jogadas[NumJogada].Peca2.NumPeca))),
      tabul[Jogadas[NumJogada].Peca2.NumPeca].Num);
    TImage(FindComponent('i'+IntToStr(Jogadas[NumJogada].Peca1.NumPeca))).Visible:= true;
    TImage(FindComponent('i'+IntToStr(Jogadas[NumJogada].Peca2.NumPeca))).Visible:= true;
    tabul[Jogadas[NumJogada].Peca1.NumPeca].Vis:= true;
    tabul[Jogadas[NumJogada].Peca2.NumPeca].Vis:= true;
    Dec(NumJogada);
    // atualiza nº peças
    TotalPecas:= TotalPecas + 2;
    numpecas.Caption:= IntToStr(TotalPecas);
    Toca(Nao);
  end;
end;

procedure TMain.Toca(Som: string);
begin
  if Som1.Checked then
    if FileExists(Som) then
      PlaySound(PChar(Som), 0, snd_Async);
end;

procedure TMain.Som1Click(Sender: TObject);
begin
  Som1.Checked:= not Som1.Checked;
end;

procedure TMain.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TMain.Recordes1Click(Sender: TObject);
begin
  if not final.Visible then
    Hiscore.ShowModal;
end;

procedure TMain.EntraScore(Pecas: integer; Tempo: TTime);
var
  pos: integer;
begin
  pos:= Hiscore.IncluiScore(Pecas, Tempo);
  if pos <> 0 then
  begin
    with Hiscore do
    begin
      top10[pos].Nome:= InputBox('Parabéns!', 'Você conseguiu um '+
        IntToStr(pos)+'º lugar!','Yo!');
      GravaTop10;
      Mostra;
      TfScore(FindComponent('fScore'+IntToStr(pos))).lNome.Font.Color:= clRed;
      ShowModal;
      TfScore(FindComponent('fScore'+IntToStr(pos))).lNome.Font.Color:= clBlack;
    end;
  end;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
  b.Free;
  // grava configs
  reg:= TRegIniFile.Create('Software\pabloidz');
  reg.WriteBool('ATField', 'SoundEnabled', Som1.Checked);
  reg.Destroy;
end;

procedure TMain.MostraFinal;
begin
  final.Align:= alClient;
  final.PageIndex:= 0;
  final.Visible:= true;
  CarregaFigura(ii1, 'i1');
  CarregaFigura(it1, 't1');
  timerf.Tag:= 0;
  timerf.Enabled:= true;
end;

procedure TMain.timerFTimer(Sender: TObject);
begin
  timerf.Tag:= timerf.Tag + 1;
  if timerf.Tag = 4 then
  begin
    timerf.Enabled:= false;
    final.Visible:= false;
  end
  else
  begin
    final.PageIndex:= timerf.Tag;
    CarregaFigura(TImage(FindComponent('ii' + Inttostr(timerf.Tag + 1))), 'i' + Inttostr(timerf.Tag + 1));
    CarregaFigura(TImage(FindComponent('it' + Inttostr(timerf.Tag + 1))), 't' + Inttostr(timerf.Tag + 1));
  end;
end;

procedure TMain.ComoJogar1Click(Sender: TObject);
begin
  if not final.Visible then
    GotoWWWPage('ajuda.htm');
end;

procedure TMain.Sobre1Click(Sender: TObject);
begin
  if not final.Visible then
    SendMail('pabloidz@ig.com.br','ATField');
end;

procedure TMain.RetiraPecas;
begin
  // ativa o timer que vai tirar as peças dando um efeito
  tFade.Enabled:= true;
end;

procedure TMain.tFadeTimer(Sender: TObject);
var
  i, j, k: integer;
  p1, p2: TImage;
begin
  // guarda quais Images sairao da tela
  p1:= TImage(FindComponent('i'+IntToStr(Primeira.NumPeca)));
  p2:= TImage(FindComponent('i'+IntToStr(Segunda.NumPeca)));


  if tFade.Tag < 5 then begin
    // vai tirando os pixels
    for k:= 1 to 400 do begin
      i:= random(60);
      j:= random(60);
      p1.Canvas.Pixels[i,j]:= cllime;
      p2.Canvas.Pixels[i,j]:= cllime;
    end;
    tFade.tag:= tFade.tag + 1;
  end

  else

  begin
    // desativa esse timer
    tFade.Enabled:= false;
    tFade.Tag:= 0;

    // tira os images
    p1.Visible:= false;
    p2.Visible:= false;

    // indica que elas não estão visiveis
    tabul[Primeira.NumPeca].Vis:= false;
    tabul[Segunda.NumPeca].Vis:= false;
    // coloca na lista de jogadas
    Inc(NumJogada);
    Jogadas[NumJogada].Peca1:= Primeira;
    Jogadas[NumJogada].Peca2:= Segunda;
    Primeira.Marcada:= false;
    Segunda.Marcada:= false;
    // atualiza nº peças
    TotalPecas:= TotalPecas - 2;
    numpecas.Caption:= IntToStr(TotalPecas);

    // verifica se ainda há jogadas possíveis
    if Acabou then
    begin
      jogando:= false;
      timer1.Enabled:= false;
      // se não tiver zerado, mostra acabou
      if TotalPecas <> 0 then gameover.Visible:= true;
      // verifica se entra no top 10
      EntraScore(TotalPecas, Time - Comeco);
      // se tiver zerado, mostra final
      if TotalPecas = 0 then MostraFinal;
    end;
    
  end;
end;

end.
