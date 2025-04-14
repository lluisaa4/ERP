unit acerp.resources.impl.resource;

interface

uses
  acerp.resources.interfaces;

type
  TResource = class(TInterfacedObject, iResource)
  private
    FConexao: iConexao;
  public
    class function New: iResource;

    function Conexao: iConexao;
  end;

implementation

uses
  acerp.resources.impl.conexaofiredac, acerp.resources.impl.configuracao;

{ TResource }

function TResource.Conexao: iConexao;
begin
  if not Assigned(FConexao) then
    FConexao := TConexaoFireDac.New;
  Result := FConexao;
end;

class function TResource.New: iResource;
begin
  Result := Self.Create;
end;

end.
