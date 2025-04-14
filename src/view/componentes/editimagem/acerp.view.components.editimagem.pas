unit acerp.view.components.editimagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.Edit,
  acerp.view.components.interfaces;

type
  TComponentEditImage = class(TFrame, iEdits)
    lytContainer: TLayout;
    rctnglContainer: TRectangle;
    lyt1: TLayout;
    imgEdit: TImage;
    lyt2: TLayout;
    rctnglBackground: TRectangle;
    edt1: TEdit;
  private
    FProc: TProc<TObject>;

  public
    class function New(AOwner: TComponent): iEdits;
    function Nome(Value: string): iEdits;
    function Text(Value: string): iEdits;
    function FontColor(Value: TAlphaColor = $FFFFFFFF): iEdits;
    function BackGroundColor(Value: TAlphaColor = $FFFFFFFF): iEdits;
    function Enable(Value: Boolean = False): iEdits;
    function Change(Value: TProc<TObject>): iEdits; //trabalha c metodos anonimos
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

uses
  acerp.services.utils;

{$R *.fmx}

{ TComponentEditImage }

function TComponentEditImage.Alinhamento(Value: TAlignLayout): iEdits;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentEditImage.Altura(Value: Integer): iEdits;
begin
   Result := Self;
end;

function TComponentEditImage.BackGroundColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  rctnglBackground.Fill.Color := Value;
end;

function TComponentEditImage.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentEditImage.Change(Value: TProc<TObject>): iEdits;
begin
  Result := Self;
  FProc := Value;
end;

function TComponentEditImage.Enable(Value: Boolean): iEdits;
begin
  Result := Self;
  rctnglContainer.Enabled := Value;
end;

function TComponentEditImage.FontColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  edt1.TextSettings.FontColor := Value;
end;

function TComponentEditImage.FontColorTitulo(Value: TAlphaColor): iEdits;
begin
  Result := Self;
end;

function TComponentEditImage.HorzText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edt1.TextSettings.HorzAlign := Value;
end;

function TComponentEditImage.Image(Value: string): iEdits;
begin
  Result := Self;
  TUtils.ResourceImage(Value, imgEdit);
end;

function TComponentEditImage.ImageColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  TUtils.ImageColor(imgEdit, Value);
end;

function TComponentEditImage.Largura(Value: Integer): iEdits;
begin
  Result := Self;
end;

function TComponentEditImage.Margem(Value: TEditMargins): iEdits;
begin
  Result := Self;
  lytContainer.Margins.Top := Value.Top;
  lytContainer.Margins.Left := Value.Left;
  lytContainer.Margins.Bottom := Value.Bottom;
  lytContainer.Margins.Right := Value.Right;
end;

class function TComponentEditImage.New(AOwner: TComponent): iEdits;
begin
  Result := Self.Create(AOwner);
end;

function TComponentEditImage.Nome(Value: string): iEdits;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentEditImage.Password(Value: Boolean): iEdits;
begin
  Result := Self;
  edt1.Password := Value;
end;

function TComponentEditImage.PlaceHolder(Value: string): iEdits;
begin
  Result := Self;
  edt1.TextPrompt := Value;
end;

function TComponentEditImage.Text(Value: string): iEdits;
begin
  Result := Self;
  edt1.Text := Value;
end;

function TComponentEditImage.Titulo(Value: string): iEdits;
begin
  Result := Self;
end;

function TComponentEditImage.VertText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edt1.TextSettings.VertAlign := Value;
end;

end.
