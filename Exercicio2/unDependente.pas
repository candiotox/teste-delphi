unit unDependente;

interface

type
  TDependente = class
  private
    FNome: string;
    FIsCalculaINSS: Boolean;
    FIsCalculaIR: Boolean;
    procedure SetNome(const Value: string);
    procedure SetIsCalculaINSS(const Value: Boolean);
    procedure SetIsCalculaIR(const Value: Boolean);
  public
    constructor Create(nome: string; calcluaINSS, calculaIR: Boolean); overload;
    property Nome: string read FNome write SetNome;
    property IsCalculaIR: Boolean read FIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS: Boolean read FIsCalculaINSS write SetIsCalculaINSS;
  end;

implementation

{ TDependente }

constructor TDependente.Create(nome: string; calcluaINSS, calculaIR: Boolean);
begin
  inherited Create;
  Self.FNome := nome;
  Self.IsCalculaINSS := calcluaINSS;
  Self.IsCalculaIR := calculaIR;
end;

procedure TDependente.SetIsCalculaINSS(const Value: Boolean);
begin
  FIsCalculaINSS := Value;
end;

procedure TDependente.SetIsCalculaIR(const Value: Boolean);
begin
  FIsCalculaIR := Value;
end;

procedure TDependente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
