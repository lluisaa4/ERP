unit acerp.view.components.interfaces2;

interface

uses
  System.UITypes,
  FMX.Types,
  System.Types,
  System.SysUtils;

type
  TEditMargins2 = record
    Left2: Integer;
    Top2: Integer;
    Right2: Integer;
    Bottom2: Integer;
    class operator Initialize(out Dest: TEditMargins2);
  end;
type
  iEdits2 = interface
    function Nome2(Value: string): iEdits2;
    function Text2(Value: string): iEdits2;
    function FontColor2(Value: TAlphaColor = $FFFFFFFF): iEdits2;
    function BackGroundColor2(Value: TAlphaColor = $FFFFFFFF): iEdits2;
    function Enable2(Value: Boolean = False): iEdits2;
    function Change2(Value: TProc<TObject>): iEdits2;
    function Alinhamento2(Value: TAlignLayout): iEdits2;
    function VertText2(Value: TTextAlign): iEdits2;
    function HorzText2(Value: TTextAlign): iEdits2;
    function Altura2(Value: Integer): iEdits2; ////
    function Largura2(Value: Integer): iEdits2;
    function Margem2(Value: TEditMargins2): iEdits2;
    function Titulo2(Value: string): iEdits2;
    function FontColorTitulo2(Value: TAlphaColor = $FFE3E3E3): iEdits2;
    function PlaceHolder2(Value: string): iEdits2;
    function Image2(Value: string): iEdits2;
    function ImageColor2(Value: TAlphaColor): iEdits2;
    function Password2(Value: Boolean): iEdits2;
    function Build2: TFMXObject;
  end;

implementation

{ TEditMargins }

class operator TEditMargins2.Initialize(out Dest: TEditMargins2);
begin
  Dest.Left2 := 0;
  Dest.Top2 := 0;
  Dest.Right2 := 0;
  Dest.Bottom2 := 0;
end;

end.

