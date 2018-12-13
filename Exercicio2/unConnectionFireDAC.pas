unit unConnectionFireDAC;

interface
uses SysUtils, Dialogs, StdCtrls, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Comp.UI;

type

  TConnectionFireDAC = class(TFDConnection)
  private
    class var FInstancia: TConnectionFireDAC;
    class function getInstancia: TConnectionFireDAC; static;
  public
    class property Connection: TConnectionFireDAC read getInstancia;
  end;

implementation

class function TConnectionFireDAC.getInstancia: TConnectionFireDAC;
begin
  If not Assigned(FInstancia) Then
  begin
    try
      FInstancia := TConnectionFireDAC.Create(nil);

      FInstancia.DriverName := 'FB';
      FInstancia.Params.Values['DriverID'] := 'FB';
      FInstancia.Params.Values['CharacterSet'] := 'ISO8859_1';
      FInstancia.Params.Values['User_Name'] := 'SYSDBA';
      FInstancia.Params.Values['Password'] := 'masterkey';
      FInstancia.Params.Values['Database'] := 'c:\base.fdb';
      FInstancia.ResourceOptions.AutoReconnect := True;
      FInstancia.LoginPrompt := False;
      FInstancia.Connected := True;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  end;

  Result := FInstancia;
end;


end.

