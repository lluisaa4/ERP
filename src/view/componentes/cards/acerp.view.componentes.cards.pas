unit acerp.view.componentes.cards;

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
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Objects,
  FMX.Effects,
  FMX.Controls.Presentation;

type
  TComponentCard = class(TFrame)
    lytContainer: TLayout;
    rctngl1: TRectangle;
    lytTitulo: TLayout;
    lytRodape: TLayout;
    ln1: TLine;
    lyt1: TLayout;
    imageDescricao: TImage;
    lyt2: TLayout;
    lblDescricaoRodape: TLabel;
    lyt3: TLayout;
    lyt4: TLayout;
    imageTitulo: TImage;
    lyt5: TLayout;
    lblTItulo: TLabel;
    lblSubTitulo: TLabel;
    ShadowEffect1: TShadowEffect;
  private

  public
    class function New(AOwner: TComponent): TComponentCard;
    function Nome(Value: string): TComponentCard;
    function Titulo(Value: string; Color:TAlphaColor = $FFD8859A): TComponentCard;
    function SubTitulo(Value: string; Color:TAlphaColor = $FFD8859A): TcomponentCard;
    function ImagemTitulo(Value: string; Color: TAlphaColor = $FFfbc658): TComponentCard;
    function Descricao(Value: string; Color:TAlphaColor = $FFD8859A): TComponentCard;
    function ImagemDescricao(Value: string; Color: TAlphaColor = $FF66615b): TComponentCard;
    function Alinhamento(Value: TAlignLayout): TComponentCard;
    function Marge(Bottom, Left, Right, Top: Single): TComponentCard;
    function Build: TFmxObject;
  end;

implementation

uses
  acerp.services.utils;

{$R *.fmx}

{ TComponentCard }

function TComponentCard.Alinhamento(Value: TAlignLayout): TComponentCard;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentCard.Build: TFmxObject;
begin
  Result := lytContainer;
end;

function TComponentCard.Descricao(Value: string; Color:TAlphaColor = $FFD8859A): TComponentCard;
begin
  Result := Self;
  lblDescricaoRodape.Text := Value;
  lblDescricaoRodape.TextSettings.FontColor := Color;
end;

function TComponentCard.ImagemDescricao(Value: string; Color: TAlphaColor = $FF66615b): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, imageDescricao);
  TUtils.ImageColor(imageDescricao, Color);
end;

function TComponentCard.ImagemTitulo(Value: string; Color: TAlphaColor): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, imageTitulo);
  TUtils.ImageColor(imageTitulo, Color);
end;

function TComponentCard.Marge(Bottom, Left, Right, Top: Single): TComponentCard;
begin
  Result := Self;
  lytContainer.Margins.Bottom := Bottom;
  lytContainer.Margins.Left := Left;
  lytContainer.Margins.Right := Right;
  lytContainer.Margins.Top := Top;
end;

class function TComponentCard.New(AOwner: TComponent): TComponentCard;
begin
  Result := Self.Create(AOwner);
end;

function TComponentCard.Nome(Value: string): TComponentCard;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentCard.SubTitulo(Value: string; Color:TAlphaColor = $FFD8859A): TcomponentCard;
begin
  Result := Self;
  lblSubTitulo.Text := Value;
  lblSubTitulo.TextSettings.FontColor := Color;
end;

function TComponentCard.Titulo(Value: string; Color:TAlphaColor = $FFD8859A): TComponentCard;
begin
  Result := Self;
  lblTItulo.Text := Value;
  lblTItulo.TextSettings.FontColor := Color;
end;

end.
