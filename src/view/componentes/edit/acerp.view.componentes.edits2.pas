unit acerp.view.componentes.edits2;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
//  FMX.Frame,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.Edit,
  FMX.Objects,
  FMX.Effects,
  acerp.view.components.interfaces2;

type
  TComponentEdit2 = class(TForm, iEdits2)
    lytContainer: TLayout;
    lblTitulo: TLabel;
    rctngl1: TRectangle;
    edtText: TEdit;
    procedure edtTextChange2(Sender: TObject);
  private
    FChange: TProc<TObject>;
  public
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
    class function New2(AWOner: TComponent): iEdits2;
    function Titulo2(Value: string): iEdits2;
    function FontColorTitulo2(Value: TAlphaColor = $FFE3E3E3): iEdits2;
    function PlaceHolder2(Value: string): iEdits2;
    function Image2(Value: string): iEdits2;
    function ImageColor2(Value: TAlphaColor): iEdits2;
    function Password2(Value: Boolean): iEdits2;
    function Build2: TFMXObject;
  end;

implementation

{$R *.fmx}


{ TComponentEdit2 }

function TComponentEdit2.Alinhamento2(Value: TAlignLayout): iEdits2;
begin
  Result := self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentEdit2.Altura2(Value: Integer): iEdits2;
begin
  Result := Self;
  lytContainer.Height := Value;
end;

function TComponentEdit2.BackGroundColor2(Value: TAlphaColor): iEdits2;
begin
  Result := Self;
  rctngl1.Fill.Color := Value;
end;

function TComponentEdit2.Build2: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentEdit2.Change2(Value: TProc<TObject>): iEdits2;
begin
  Result := Self;
  FCHange := Value;
end;

procedure TComponentEdit2.edtTextChange2(Sender: TObject);
begin
  if Assigned(FCHange) then
    FCHange(Sender);
end;

function TComponentEdit2.Enable2(Value: Boolean): iEdits2;
begin
  Result := Self;
  rctngl1.Fill.Color := $FFE3E3E3;
  edtText.Enabled := Value;
end;

function TComponentEdit2.FontColor2(Value: TAlphaColor): iEdits2;
begin
  Result := Self;
  edtText.TextSettings.FontColor := Value;
end;

function TComponentEdit2.FontColorTitulo2(Value: TAlphaColor): iEdits2;
begin
  Result := Self;
  lblTitulo.TextSettings.FontColor := Value;
end;

function TComponentEdit2.HorzText2(Value: TTextAlign): iEdits2;
begin
  Result := Self;
  edtText.TextSettings.HorzAlign := Value;
end;

function TComponentEdit2.Image2(Value: string): iEdits2;
begin
  Result := Self;
end;

function TComponentEdit2.ImageColor2(Value: TAlphaColor): iEdits2;
begin
  Result := Self;
end;

function TComponentEdit2.Largura2(Value: Integer): iEdits2;
begin
  Result := Self;
  lytContainer.Width := Value;
end;

function TComponentEdit2.Margem2(Value: TEditMargins2): iEdits2;
begin
  Result := Self;
  lytContainer.Margins.Left := Value.Left2;
  lytContainer.Margins.Right := Value.Right2;
  lytContainer.Margins.Bottom := Value.Bottom2;
  lytContainer.Margins.Top := Value.Top2;
end;

class function TComponentEdit2.New2(AWOner: TComponent): iEdits2;
begin
  Result := Self.Create(AWOner);
end;

function TComponentEdit2.Nome2(Value: string): iEdits2;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentEdit2.Password2(Value: Boolean): iEdits2;
begin
  Result := Self;
end;

function TComponentEdit2.PlaceHolder2(Value: string): iEdits2;
begin
  Result := Self;
  edtText.TextPrompt := Value;
end;

function TComponentEdit2.Text2(Value: string): iEdits2;
begin
  Result := Self;
  edtText.Text := Value;
end;

function TComponentEdit2.Titulo2(Value: string): iEdits2;
begin
  Result := Self;
  lblTitulo.Text := Value;
end;

function TComponentEdit2.VertText2(Value: TTextAlign): iEdits2;
begin
  Result := Self;
  edtText.TextSettings.VertAlign := Value;
end;

end.
