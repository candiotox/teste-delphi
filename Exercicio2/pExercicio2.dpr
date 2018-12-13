program pExercicio2;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {Form1},
  unFuncionario in 'unFuncionario.pas',
  unDependente in 'unDependente.pas',
  unConnectionFireDAC in 'unConnectionFireDAC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
