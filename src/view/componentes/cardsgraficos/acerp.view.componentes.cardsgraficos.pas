unit acerp.view.componentes.cardsgraficos;

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
  FMX.Controls.Presentation, acerp.services.enums;

type
  TComponentCardGraficos = class(TFrame)
    lytContainer: TLayout;
    rectangleBackground: TRectangle;
    lytTitulos: TLayout;
    lytRodape: TLayout;
    lytGraficosPadding: TLayout;
    lyt1: TLayout;
    lyt2: TLayout;
    rctngl1: TRectangle;
    lblInfo: TLabel;
    lblTitulo: TLabel;
    ln1: TLine;
    lyt3: TLayout;
    crcl1: TCircle;
    imageRodape: TImage;
    lytRodapeTItulo: TLayout;
    lytTituloGrafico: TLayout;
    lblTituloGrafico: TLabel;
    lblTituloRodape: TLabel;
    lytGraficos: TLayout;
  private
    FTituloGrafico: string;
  public
    class function New(AOWner: TComponent): TComponentCardGraficos;
    function Nome(Value: string): TComponentCardGraficos;
    function TituloInfo(Value: string; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function TituloDescricao(Value: string; Color: TAlphaColor = $FF0000000): TComponentCardGraficos;
    function DescricaoRodape(Value: string; Color: TAlphaColor = $FF0000000): TComponentCardGraficos;
    function ImagemRodape(Value: string; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function TituloGrafico(Value: string; Color: TAlphaColor = $FF000000): TComponentCardGraficos;
    function TipoGrafico(Value: TChartType): TComponentCardGraficos;
    function Alinhamento(Value: TAlignLayout): TComponentCardGraficos;
    function Build: TFmxObject;
  end;

implementation

uses
  acerp.services.charts,
  acerp.services.utils;

{$R *.fmx}

{ TComponentCardGraficos }

function TComponentCardGraficos.Alinhamento(
  Value: TAlignLayout): TComponentCardGraficos;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentCardGraficos.Build: TFmxObject;
begin
  Result := lytContainer;
end;

function TComponentCardGraficos.DescricaoRodape(Value: string;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTituloRodape.Text := Value;
  lblTituloRodape.TextSettings.FontColor := Color;
  end;

function TComponentCardGraficos.ImagemRodape(Value: string;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  TUtils.ResourceImage(value, imageRodape);
  TUtils.ImageColor(imageRodape, Color);
end;

class function TComponentCardGraficos.New(
  AOWner: TComponent): TComponentCardGraficos;
begin
  Result := Self.Create(AOWner);
end;

function TComponentCardGraficos.Nome(Value: string): TComponentCardGraficos;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentCardGraficos.TipoGrafico(
  Value: TChartType): TComponentCardGraficos;
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

function TComponentCardGraficos.TituloDescricao(Value: string;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTitulo.Text := Value;
  lblTitulo.FontColor := Color;
end;

function TComponentCardGraficos.TituloGrafico(Value: string;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTituloGrafico.Text := Value;
  lytTituloGrafico.Visible := True;
end;

function TComponentCardGraficos.TituloInfo(Value: string;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblInfo.Text := Value;
  lblInfo.FontColor := Color;
end;

end.
