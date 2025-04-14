unit acerp.resources.interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    function Connect: TCustomConnection;
  end;

  iConfiguracao = interface
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

  iResource = interface
    function Conexao: iConexao;
  end;

implementation

end.
