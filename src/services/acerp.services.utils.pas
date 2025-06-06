unit acerp.services.utils;

interface

uses
  FMX.Objects, FMX.Types, System.UITypes;

type
  TUtils = class
    private
    public
      class procedure ResourceImage(Resource: string; Image: TImage); overload;
      class procedure ResourceImage(Resource: string; Image: TFMXObject); overload;
      class function UpperCameCase(Value: string): string; //primeira letra da str em maiusculo
      class procedure ImageColor(Image: TImage; Color: TAlphaColor);
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.Types;


{ TUtils }

class procedure TUtils.ResourceImage(Resource: string; Image: TImage);
begin
  var lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    Image.Bitmap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

class procedure TUtils.ImageColor(Image: TImage; Color: TAlphaColor);
begin
  Image.Bitmap.ReplaceOpaqueColor(Color);
end;

class procedure TUtils.ResourceImage(Resource: string; Image: TFMXObject);
begin
  var lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    //vai add resource, vai receber a str e vai add na imagem
    TShape(Image).Fill.Bitmap.Bitmap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

class function TUtils.UpperCameCase(Value: string): string;
begin
  Result := UpperCase(Copy(Value, 1, 1)) +
    LowerCase(Copy(Value, 2, Length(Value)));
  //vai pegar a 1� letra e colocar maiuscula e as outras minusculas
end;

end.
