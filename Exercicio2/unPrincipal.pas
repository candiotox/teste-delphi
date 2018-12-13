unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase;

type
  TForm1 = class(TForm)
    btnGravar: TBitBtn;
    edSalario: TEdit;
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    Edit1: TEdit;
    Label3: TLabel;
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unFuncionario, unDependente;

procedure TForm1.btnGravarClick(Sender: TObject);
var
  funcionatio: TFuncionario;
begin
  funcionatio := TFuncionario.Create;
  try
     funcionatio.Nome := edNome.Text;
     funcionatio.Salario := StrToFloatDef(edSalario.Text, 0);
     funcionatio.Dependentes.Add(TDependente.Create('Dependente 1', True, True));
     funcionatio.Dependentes.Add(TDependente.Create('Dependente 2', True, True));
     //funcionatio.gravar;

     ShowMessage(funcionatio.getSalarioLiquido.ToString);
  finally
    funcionatio.Free;
  end;

end;

end.
