unit unFuncionario;

interface

uses System.Generics.Collections, unDependente, unConnectionFireDAC,
  FireDAC.Comp.Client, StrUtils, Vcl.Dialogs, System.SysUtils;

type
  TFuncionario = class
  private
    FId: integer;
    FCPF: string;
    FSalario: Double;
    FNome: string;
    FDependentes: TList<TDependente>;
    procedure SetCPF(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSalario(const Value: Double);
  public
    constructor Create;
    destructor Destroy;
    function getValorINSS: Double;
    function getValorIR: Double;
    function getSalarioLiquido: Double;
    procedure gravar;
    property Nome: string read FNome write SetNome;
    property CPF: string read FCPF write SetCPF;
    property Salario: Double read FSalario write SetSalario;
    property Dependentes: TList<TDependente> read FDependentes;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin
  FDependentes := TList<TDependente>.Create;
end;

destructor TFuncionario.Destroy;
begin
  FDependentes.Free;
end;

function TFuncionario.getSalarioLiquido: Double;
begin
  Result := FSalario - (getValorINSS() + getValorIR());
end;

function TFuncionario.getValorINSS: Double;
var
  dependente: TDependente;
begin
   Result := 0;
   for dependente in FDependentes do
   begin
      if dependente.IsCalculaINSS then
      begin
        Result :=  ((FSalario * 8)/100);
        Break;
      end;
   end;
end;

function TFuncionario.getValorIR: Double;
var
  dependente: TDependente;
  qtdeDependente: integer;
begin
   Result := 0;
   qtdeDependente := 0;
   for dependente in FDependentes do
      if dependente.IsCalculaIR then
         Inc(qtdeDependente);
   Result := FSalario - (qtdeDependente * 100);
   Result := (Result * 15) / 100;
end;

procedure TFuncionario.gravar;
var
  qry: TFDQuery;
  dependente: TDependente;
begin
  qry := TFDQuery.Create(nil);
  try
    try
     qry.Connection := TConnectionFireDAC.Connection;
     qry.SQL.Add('select max(coalesce(id, 0)) + 1 as id from funcionario');
     qry.Open;

     FId := qry.FieldByName('id').AsInteger;

     qry.SQL.Add('insert into funcionario(id, nome, cpf, salario) values (:nome, :cpf, :salario)');
     qry.ParamByName('id').AsInteger := FId;
     qry.ParamByName('nome').AsString := FNome;
     qry.ParamByName('cpf').AsString := FCPF;
     qry.ParamByName('salario').AsFloat := FSalario;
     qry.ExecSQL;

     for dependente in FDependentes do
     begin
        qry.SQL.Clear;
        qry.SQL.Add('insert into dependente(id, id_funcionario, nome, calcularIR, calclularINSS)');
        qry.SQL.Add('values ((select max(coalesce(id, 0)) + 1 from dependente), :id_funcionario, :nome, :calcularIR, :calclularINSS)');
        qry.ParamByName('id_funcionario').AsInteger := FId;
        qry.ParamByName('nome').AsString := FNome;
        qry.ParamByName('calcularIR').AsString := IfThen(dependente.IsCalculaIR, 'S', 'N');
        qry.ParamByName('calclularINSS').AsString := IfThen(dependente.IsCalculaINSS, 'S', 'N');
        qry.ExecSQL;
     end;

     TConnectionFireDAC.Connection.Commit;
    except
      on e:exception do
        ShowMessage(e.Message);
    end;
  finally
    qry.Free;
  end;
end;

procedure TFuncionario.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TFuncionario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: Double);
begin
  FSalario := Value;
end;

end.
