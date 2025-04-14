unit acerp.core.entities.empresa;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.RegularExpressions;

type
  TEmpresasDadosValidos = class
    private
      FCnpj: String;
      FValido: Boolean;

      function SomenteNumero(Value: string): string;
      function VerificaDigito(Cnpj: string; Peso: Integer): TEmpresasDadosValidos;
      function AreEquals(Value1, Value2: Integer): Boolean;
      function VerificarIguais: Boolean;

      constructor create(CNPJ: string);
    public
      class function New(CNPJ: string): TEmpresasDadosValidos;
      function CnpjIsValido: Boolean;
  end;

implementation

{ TEmpresasDadosValidos }

function TEmpresasDadosValidos.AreEquals(Value1, Value2: Integer): Boolean;
begin
  Result := Value1 = Value2;
end;

function TEmpresasDadosValidos.CnpjIsValido: Boolean;
begin
  Result := FValido;
end;

constructor TEmpresasDadosValidos.create(CNPJ: string);
begin
  if not TRegEx.IsMatch(CNPJ, '\w[0-9]{1,2}.[0-9]{1,3}.[0-9]{1,3}\/[0-9]{1,4}-[0-9]{1,2}') then
    raise Exception.Create('CNPJ Inválido');
  FCnpj := CNPJ;
end;

class function TEmpresasDadosValidos.New(CNPJ: string): TEmpresasDadosValidos;
begin
  Result := Self.create(CNPJ);
end;

function TEmpresasDadosValidos.SomenteNumero(Value: string): string;
begin
  for var I := Low(Value) to High(Value) do
    if Value[I] in ['0' .. '9'] then
      Result := Result + Value[I];
end;

function TEmpresasDadosValidos.VerificaDigito(Cnpj: string;
  Peso: Integer): TEmpresasDadosValidos;
begin

  var lCnpj := LeftStr(cnpj, cnpj.Length-2);
  var lDigito := RightStr(cnpj,2);
  var lPeso := 2;
  var lSum := 0;

  for var I := Peso downto 1 do
  begin
    lSum := lSum + (StrToInt(lCnpj[lPeso]) * I);
    Inc(lPeso);

    if lPeso = 10 then
      lPeso := 2;
  end;

  var lResultado := 0;
  var lResto := (lSum mod 11);
  if not lResto > 2 then
    lResultado := 11 - lResto;

  FValido := AreEquals(lResultado, LeftStr(lDigito,1).ToInteger) or
    AreEquals(lResultado, RightStr(lDigito,1).ToInteger) and (not VerificarIguais);
end;

function TEmpresasDadosValidos.VerificarIguais: Boolean;
begin
  Result := False;
  for var I := 0 to 9 do
  begin
    var lChar := I.ToString.Chars[0];
    if FCnpj = StringOfChar(lChar, 14) then
      Result := True;
  end;
end;

end.
