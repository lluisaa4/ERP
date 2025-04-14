unit acerp.view.componentes.editsarea;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Edit,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  acerp.view.components.interfaces;

type
  TComponentEditArea = class(TForm, iEdits)
    lytContainer: TLayout;
    lblTitulo: TLabel;
    rctngl1: TRectangle;
    edtText: TEdit;
    procedure edtTextChange(Sender: TObject);
  private
    FChange: TProc<TObject>;
  public
    function Nome(Value: string): iEdits;
    function Text(Value: string): iEdits;
    function FontColor(Value: TAlphaColor = $FFFFFFFF): iEdits;
    function BackGroundColor(Value: TAlphaColor = $FFFFFFFF): iEdits;
    function Enable(Value: Boolean = False): iEdits;
    function Change(Value: TProc<TObject>): iEdits;
    function Alinhamento(Value: TAlignLayout): iEdits;
    function VertText(Value: TTextAlign): iEdits;
    function HorzText(Value: TTextAlign): iEdits;
    function Altura(Value: Integer): iEdits; ////
    function Largura(Value: Integer): iEdits;
    function Margem(Value: TEditMargins): iEdits;
    function Titulo(Value: string): iEdits;
    function FontColorTitulo(Value: TAlphaColor = $FFE3E3E3): iEdits;
    function PlaceHolder(Value: string): iEdits;
    function Image(Value: string): iEdits;
    function ImageColor(Value: TAlphaColor): iEdits;
    function Password(Value: Boolean): iEdits;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

{ TComponentEditArea }

function TComponentEditArea.Alinhamento(Value: TAlignLayout): iEdits;
begin
  Result := self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentEditArea.Altura(Value: Integer): iEdits;
begin
  Result := Self;
  lytContainer.Height := Value;
end;

function TComponentEditArea.BackGroundColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  rctngl1.Fill.Color := Value;
end;

function TComponentEditArea.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentEditArea.Change(Value: TProc<TObject>): iEdits;
begin
  Result := Self;
  FCHange := Value;
end;

procedure TComponentEditArea.edtTextChange(Sender: TObject);
begin
  if Assigned(FChange) then
    FChange(Sender);
end;

function TComponentEditArea.Enable(Value: Boolean): iEdits;
begin
  Result := Self;
  rctngl1.Fill.Color := $FFE3E3E3;
  edtText.Enabled := Value;
end;

function TComponentEditArea.FontColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  edtText.TextSettings.FontColor := Value;
end;

function TComponentEditArea.FontColorTitulo(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  lblTitulo.TextSettings.FontColor := Value;
end;

function TComponentEditArea.HorzText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edtText.TextSettings.HorzAlign := Value;
end;

function TComponentEditArea.Image(Value: string): iEdits;
begin
  Result := Self;
end;

function TComponentEditArea.ImageColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
end;

function TComponentEditArea.Largura(Value: Integer): iEdits;
begin
  Result := Self;
  lytContainer.Width := Value;
end;

function TComponentEditArea.Margem(Value: TEditMargins): iEdits;
begin
  Result := Self;
  lytContainer.Margins.Left := Value.Left;
  lytContainer.Margins.Right := Value.Right;
  lytContainer.Margins.Bottom := Value.Bottom;
  lytContainer.Margins.Top := Value.Top;
end;

function TComponentEditArea.Nome(Value: string): iEdits;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentEditArea.Password(Value: Boolean): iEdits;
begin
  Result := Self;
end;

function TComponentEditArea.PlaceHolder(Value: string): iEdits;
begin
  Result := Self;
  edtText.TextPrompt := Value;
end;

function TComponentEditArea.Text(Value: string): iEdits;
begin
  Result := Self;
  edtText.Text := Value;
end;

function TComponentEditArea.Titulo(Value: string): iEdits;
begin
  Result := Self;
  lblTitulo.Text := Value;
end;

function TComponentEditArea.VertText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edtText.TextSettings.VertAlign := Value;
end;

end.
