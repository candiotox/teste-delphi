unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Generics.Collections, math;

type
  TEnumOperacoes = (toDividir, toMultiplicar, toSubtrair, toSomar, toEmpty);

  TfrmPrincipal = class(TForm)
    edResultado: TEdit;
    btnDividir: TBitBtn;
    btnMultiplicar: TBitBtn;
    btnSubtrair: TBitBtn;
    btnSomar: TBitBtn;
    btnIgual: TBitBtn;
    btnLimpar: TBitBtn;
    lbHistorico: TLabel;
    btnImpA: TBitBtn;
    btnImpB: TBitBtn;
    btnImpC: TBitBtn;
    lbBaseCalculo: TLabel;
    lbImpA: TLabel;
    lbImpB: TLabel;
    lbImpC: TLabel;
    procedure btnDividirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnImpAClick(Sender: TObject);
    procedure btnImpBClick(Sender: TObject);
    procedure btnImpCClick(Sender: TObject);
  private
    FResultado: Double;
    FUltOperacao: TEnumOperacoes;
    FIgual: Boolean;
    function getResultadoOperacao(operacao: TEnumOperacoes; valor: Double): Double;
    function operacao(operacao: TEnumOperacoes; valor: Double): Double;
    function resultado(valor: Double): Double;
    function converterOperacaoToString(operacao: TEnumOperacoes): string;
    function calculaImpostoA(ValorBaseCalc: Double): Double;
    function calculaImpostoB(ValorImpA: Double): Double;
    function calculaImpostoC(ValorImpA, ValorImpB: Double): Double;
    procedure limpar;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnDividirClick(Sender: TObject);
begin
  if (edResultado.Text <> EmptyStr) then
    lbHistorico.Caption := lbHistorico.Caption + edResultado.Text + ' ÷ ';

  edResultado.Text := operacao(toDividir, StrToFloatDef(edResultado.Text, 0)).ToString;
end;

procedure TfrmPrincipal.btnMultiplicarClick(Sender: TObject);
begin
  if (edResultado.Text <> EmptyStr) then
    lbHistorico.Caption := lbHistorico.Caption + edResultado.Text + ' * ';

  edResultado.Text := operacao(toMultiplicar, StrToFloatDef(edResultado.Text, 0)).ToString;
end;

procedure TfrmPrincipal.btnSubtrairClick(Sender: TObject);
begin
  if (edResultado.Text <> EmptyStr) then
    lbHistorico.Caption := lbHistorico.Caption + edResultado.Text + ' - ';

  edResultado.Text := operacao(toSubtrair, StrToFloatDef(edResultado.Text, 0)).ToString;
end;

function TfrmPrincipal.calculaImpostoA(ValorBaseCalc: Double): Double;
begin
   Result := (ValorBaseCalc + ((ValorBaseCalc * 20)/100)) - 500;
end;

function TfrmPrincipal.calculaImpostoB(ValorImpA: Double): Double;
begin
  Result := ValorImpA - 15;
end;

function TfrmPrincipal.calculaImpostoC(ValorImpA, ValorImpB: Double): Double;
begin
  Result := ValorImpA + ValorImpB;
end;

function TfrmPrincipal.converterOperacaoToString(operacao: TEnumOperacoes): string;
begin
  case operacao of
    toDividir: Result := '/';
    toMultiplicar: Result := '*';
    toSubtrair: Result := '-';
    toSomar: Result := '+';
  end;
end;

procedure TfrmPrincipal.btnSomarClick(Sender: TObject);
begin
  if (edResultado.Text <> EmptyStr) then
    lbHistorico.Caption := lbHistorico.Caption + edResultado.Text + ' + ';

  edResultado.Text := operacao(toSomar, StrToFloatDef(edResultado.Text, 0)).ToString;
end;

procedure TfrmPrincipal.btnIgualClick(Sender: TObject);
begin
  if not FIgual then
  begin
    if (edResultado.Text <> EmptyStr) then
      lbHistorico.Caption := lbHistorico.Caption + edResultado.Text + ' = ';

    edResultado.Text := resultado(StrToFloatDef(edResultado.Text, 0)).ToString;

    if (edResultado.Text <> EmptyStr) then
      lbHistorico.Caption := lbHistorico.Caption + edResultado.Text;
  end
  else
  begin
     if (StrToFloatDef(edResultado.Text, 0) > 0) then
      lbHistorico.Caption := edResultado.Text + ' '+ converterOperacaoToString(FUltOperacao) + ' ' + edResultado.Text + ' = ';

      edResultado.Text := resultado(StrToFloatDef(edResultado.Text, 0)).ToString;

      if (StrToFloatDef(edResultado.Text, 0) > 0) then
        lbHistorico.Caption := lbHistorico.Caption + edResultado.Text;
  end;

  FIgual := True;
end;

procedure TfrmPrincipal.btnImpAClick(Sender: TObject);
begin
  lbBaseCalculo.Caption := edResultado.Text;
  limpar();

  lbImpA.Caption := calculaImpostoA(StrToFloatDef(lbBaseCalculo.Caption, 0)).ToString;
end;

procedure TfrmPrincipal.btnImpBClick(Sender: TObject);
begin
  lbImpB.Caption := calculaImpostoB(StrToFloatDef(lbImpA.Caption, 0)).ToString;
end;

procedure TfrmPrincipal.btnImpCClick(Sender: TObject);
begin
  lbImpC.Caption := calculaImpostoC(
    StrToFloatDef(lbImpA.Caption, 0),
    StrToFloatDef(lbImpB.Caption, 0)).ToString;
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  limpar();
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   limpar();
end;

function TfrmPrincipal.getResultadoOperacao(operacao: TEnumOperacoes; valor: Double): Double;
begin
  Result := valor;
  if (FUltOperacao = toEmpty) then
    Exit;

  case operacao of
    toDividir: Result := FResultado / valor;
    toMultiplicar: Result := FResultado * valor;
    toSubtrair: Result := FResultado - valor;
    toSomar: Result := FResultado + valor;
  end;
end;

procedure TfrmPrincipal.limpar;
begin
  FResultado := 0;
  FUltOperacao := toEmpty;
  lbHistorico.Caption := EmptyStr;
  edResultado.Text := '0';
  FIgual := False;
end;

function TfrmPrincipal.operacao(operacao: TEnumOperacoes; valor: Double): Double;
begin
  Result := valor;

  if (FUltOperacao = toEmpty) then
    FUltOperacao := operacao
  else if (FUltOperacao <> operacao) then
  begin
    Result := getResultadoOperacao(FUltOperacao, valor);
    FUltOperacao := operacao;
  end;

  FResultado := Result;
end;

function TfrmPrincipal.resultado(valor: Double): Double;
begin
  Result := valor;
  if (FUltOperacao = toEmpty) then
    Exit;

  FResultado := getResultadoOperacao(FUltOperacao, valor);
  Result := FResultado;
end;

end.
