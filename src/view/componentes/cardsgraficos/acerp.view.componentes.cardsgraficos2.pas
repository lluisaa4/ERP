unit acerp.view.componentes.cardsgraficos2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, acerp.services.enums,
  FMX.Effects;

type
  TComponentCardGraficos2 = class(TForm)
    lytContainer: TLayout;
    rectangleBackground: TRectangle;
    lytTitulos: TLayout;
    lyt1: TLayout;
    lblTitulo: TLabel;
    lyt2: TLayout;
    rctngl1: TRectangle;
    lblInfo: TLabel;
    lytRodape: TLayout;
    ln1: TLine;
    lyt3: TLayout;
    crcl1: TCircle;
    imageRodape: TImage;
    lytRodapeTItulo: TLayout;
    lblTituloRodape: TLabel;
    lytGraficosPadding: TLayout;
    lytGraficos: TLayout;
    lytTituloGrafico: TLayout;
    lblTituloGrafico: TLabel;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    class function New(AOWner: TComponent): TComponentCardGraficos2;
    function TituloInfo(Value: string; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos2;
    function TituloDescricao(Value: string; Color: TAlphaColor = $FF0000000): TComponentCardGraficos2;
    function DescricaoRodape(Value: string; Color: TAlphaColor = $FF0000000): TComponentCardGraficos2;
    function ImagemRodape(Value: string; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos2;
    function TituloGrafico(Value: string; Color: TAlphaColor = $FF000000): TComponentCardGraficos2;
    function TipoGrafico(Value: TChartType): TComponentCardGraficos2;
    function Alinhamento(Value: TAlignLayout): TComponentCardGraficos2;
    function MargemTop(Value: Integer): TComponentCardGraficos2;
    function MargemBottom(Value: Integer): TComponentCardGraficos2;
    function MargemLeft(Value: Integer): TComponentCardGraficos2;
    function MargemRight(Value: Integer): TComponentCardGraficos2;
    function Largura(aHeight, aWidth: Integer): TComponentCardGraficos2;
    function Build: TFmxObject;
  end;

implementation

uses
  acerp.services.charts,
  acerp.services.utils;

{$R *.fmx}

{ TComponentCardGraficos2 }

function TComponentCardGraficos2.Alinhamento(
  Value: TAlignLayout): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentCardGraficos2.Build: TFmxObject;
begin
  Result := lytContainer;
end;

function TComponentCardGraficos2.DescricaoRodape(Value: string;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblTituloRodape.Text := Value;
  lblTituloRodape.TextSettings.FontColor := Color;
end;

function TComponentCardGraficos2.ImagemRodape(Value: string;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  TUtils.ResourceImage(value, imageRodape);
  TUtils.ImageColor(imageRodape, Color);
end;

function TComponentCardGraficos2.Largura(aHeight,
  aWidth: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Width := aWidth;
  lytContainer.Height := aHeight;
end;

function TComponentCardGraficos2.MargemBottom(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Bottom := Value;
end;

function TComponentCardGraficos2.MargemLeft(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Left := Value;
end;

function TComponentCardGraficos2.MargemRight(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Right := Value;
end;

function TComponentCardGraficos2.MargemTop(
  Value: Integer): TComponentCardGraficos2;
begin
  Result := Self;
  lytContainer.Margins.Top := Value;
end;

class function TComponentCardGraficos2.New(
  AOWner: TComponent): TComponentCardGraficos2;
begin
  Result := Self.Create(AOWner);
end;

function TComponentCardGraficos2.TipoGrafico(
  Value: TChartType): TComponentCardGraficos2;
begin
  var lJson := '[{"field":"Jan", "value":520}, {"field":"Fev", "value":400}, {"field":"Mar", "value":840}, {"field":"Abr", "value":200}, {"field":"Mai", "value":997}, {"field":"Jun", "value":1270}]';
  Result := Self;
  case Value of
    Pie: ;
    Donuts: ;
    Lines: TCharts.New(lytGraficos)
              .LoadFromJSON(lJson)
              .ChartType(Value)
              .TextStyle([TFontStyle.fsBold])
              .TextFontSize(12)
              .TextOffset(0.1)
              .FormatValues('##,#0')
              .ShowPercent(True)
              .ShowValues(True)
              .ShowHint(True)
              .FullHint(True)
              .Animate(True)
              .AnimationDuration(0.6)
              .SetColor([TAlphaColors.Green], [TAlphaColors.Black])
              .ColorLinePoint(TAlphaColors.Black)
              .LineTickness(3)
              .LinePointDiameter(8)
              .Gerar;
    Bars: ;
  end;
end;

function TComponentCardGraficos2.TituloDescricao(Value: string;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblTitulo.Text := Value;
  lblTitulo.FontColor := Color;
end;

function TComponentCardGraficos2.TituloGrafico(Value: string;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblTituloGrafico.Text := Value;
  lytTituloGrafico.Visible := True;
end;

function TComponentCardGraficos2.TituloInfo(Value: string;
  Color: TAlphaColor): TComponentCardGraficos2;
begin
  Result := Self;
  lblInfo.Text := Value;
  lblInfo.FontColor := Color;
end;

end.
