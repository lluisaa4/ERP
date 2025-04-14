unit acerp.resources.impl.configuracao;

interface

uses
  System.SysUtils,
  LocalCache4D,
  acerp.resources.interfaces;

type
  TConfiguracao = class(TInterfacedObject, iConfiguracao)
  private

    procedure CreateStructure;
    constructor Create;
    destructor Destroy; override;
  public
    class function New: iConfiguracao;

    function DriverID(Value: string): iConfiguracao; overload;
    function DriverID: string; overload;
    function DataBase(Value: string): iConfiguracao; overload;
    function DataBase: string; overload;
    function UserName(Value: string): iConfiguracao; overload;
    function UserName: string; overload;
    function Password(Value: string): iConfiguracao; overload;
    function Password: string; overload;
    function Port(Value: string): iConfiguracao; overload;
    function Port: string; overload;
    function Server(Value: string): iConfiguracao; overload;
    function Server: string; overload;
    function Schema(Value: string): iConfiguracao; overload;
    function Schema: string; overload;
    function Locking(Value: string): iConfiguracao; overload;
    function Locking: string; overload;
  end;

implementation

constructor TConfiguracao.Create;
begin
  if not FileExists(ExtractFilePath(ParamStr(0)+'conf.lc4')) then
  begin
    CreateStructure;
    Exit;
  end;
  LocalCache.LoadDatabase(ExtractFilePath(ParamStr(0)+'conf.lc4'));
end;

procedure TConfiguracao.CreateStructure;
begin
  LocalCache
    .Instance('config')
    .SetItem('DriverID', '')
    .SetItem('DataBase', '')
    .SetItem('UserName', '')
    .SetItem('Password', '')
    .SetItem('Port', '')
    .SetItem('Server', '')
    .SetItem('Schema', '')
    .SetItem('Locking', '')
    .SaveToStorage(ExtractFilePath(ParamStr(0)+'conf.lc4')); //vai pegar o caminho
    //absoluto do executavel e vai salvar o arquivo com essa extensao

end;

function TConfiguracao.DataBase: string;
begin
  Result := LocalCache.GetItem('DataBase');
end;

destructor TConfiguracao.Destroy;
begin
  LocalCache.SaveToStorage(ExtractFilePath(ParamStr(0)+'conf.lc4'));
  inherited;
end;

function TConfiguracao.DataBase(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DataBase', Value);
end;

function TConfiguracao.DriverID: string;
begin
  Result := LocalCache.GetItem('DriverID');
end;

function TConfiguracao.DriverID(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DriverID', Value);
end;

function TConfiguracao.Locking: string;
begin
  Result := LocalCache.GetItem('Locking');
end;

function TConfiguracao.Locking(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Locking', Value);
end;

class function TConfiguracao.New: iConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.Password: string;
begin
  Result := LocalCache.GetItem('Password');
end;

function TConfiguracao.Password(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Password', Value);
end;

function TConfiguracao.Port(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Port', Value);
end;

function TConfiguracao.Port: string;
begin
  Result := LocalCache.GetItem('Port');
end;

function TConfiguracao.Schema: string;
begin
  Result := LocalCache.GetItem('Schema');
end;

function TConfiguracao.Schema(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Schema', Value);
end;

function TConfiguracao.Server(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Server', Value);
end;

function TConfiguracao.Server: string;
begin
  Result := LocalCache.GetItem('Server');
end;

function TConfiguracao.UserName(Value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('UserName', Value);
end;

function TConfiguracao.UserName: string;
begin
  Result := LocalCache.GetItem('UserName');
end;

end.
