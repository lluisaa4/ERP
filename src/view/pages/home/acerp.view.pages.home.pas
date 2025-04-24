unit acerp.view.pages.home;

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
  FMX.Layouts,
  Router4D.Interfaces; //pra usar nas rotas das telas


type
  TPageHome = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytCards: TLayout;
    lytCardLeft: TLayout;
    lytCardRight: TLayout;
    lytGraficos: TFlowLayout; //organiza graficos dinamicamente
    //pra quando o tamanho do componente muda essas embaixo
    procedure lytCardsResize(Sender: TObject); //metade do container principal
    procedure lytCardLeftResize(Sender: TObject); //ajusta os cards internos para dividirem igualmente o espaço disponível
    procedure lytCardRightResize(Sender: TObject); //ajusta os cards internos para dividirem igualmente o espaço disponível
  private
    procedure CarregaCards;
    procedure CarregaGraficos;

    procedure ResponsiveLayout(Value: TLayout; Count: Integer);
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

uses
  acerp.services.enums,
  acerp.view.componentes.cardsgraficos,
  acerp.view.componentes.cards,
  acerp.view.componentes.cardsgraficos2;

{$R *.fmx}

{ TPageHome }

procedure TPageHome.CarregaCards;
begin
  lytCardLeft.AddObject(
    TComponentCard.New(Self)
      .Nome('capacity')
      .Titulo('Capacity')
      .SubTitulo('150GB')
      .imagemTitulo('globo')
      .ImagemDescricao('atualizar')
      .Descricao('Update Now')
      .Alinhamento(TAlignLayout.Left)
    .Build); //para retornar o container

   lytCardLeft.AddObject(
    TComponentCard.New(Self)
      .Nome('Revenue')
      .Titulo('Revenue')
      .SubTitulo('$ 1,345')
      .imagemTitulo('globo')
      .ImagemDescricao('atualizar')
      .Descricao('Last Day')
      .Alinhamento(TAlignLayout.Left)
    .Build); //para retornar o container

  lytCardRight.AddObject(
    TComponentCard.New(Self)
      .Nome('Errors')
      .Titulo('Errors')
      .SubTitulo('23')
      .imagemTitulo('globo')
      .ImagemDescricao('atualizar')
      .Descricao('In tge last hour')
      .Alinhamento(TAlignLayout.Left)
    .Build); //para retornar o container

  lytCardRight.AddObject(
    TComponentCard.New(Self)
      .Nome('Followers')
      .Titulo('Followers')
      .SubTitulo('+45K')
      .imagemTitulo('globo')
      .ImagemDescricao('atualizar')
      .Descricao('Update Now')
      .Alinhamento(TAlignLayout.Left)
    .Build); //para retornar o container
end;

procedure TPageHome.CarregaGraficos;
begin
  lytGraficos.AddObject(
    TComponentCardGraficos2.New(Self)
      .TituloInfo('+18')
      .TituloDescricao('$34,657')
      .TituloGrafico('TOTAL: EARNINGS IN LAST TEN QUARTERS')
      .DescricaoRodape('Financial Statistics')
      .ImagemRodape('mais')
      .TipoGrafico(TChartType.Lines)
//      .MargemLeft(25)
      .MargemRight(25)
      .Largura(387,400)
      .Build);

  lytGraficos.AddObject(
    TComponentCardGraficos2.New(Self)
      .TituloInfo('+18')
      .TituloDescricao('$34,657')
      .TituloGrafico('TOTAL: EARNINGS IN LAST TEN QUARTERS')
      .DescricaoRodape('Financial Statistics')
      .ImagemRodape('mais')
      .Alinhamento(TAlignLayout.Left)
      .TipoGrafico(TChartType.Lines)
      .MargemRight(50)
      .Largura(387,400)
      .Build);

  lytGraficos.AddObject(
    TComponentCardGraficos2.New(Self)
      .TituloInfo('+18')
      .TituloDescricao('$34,657')
      .TituloGrafico('TOTAL: EARNINGS IN LAST TEN QUARTERS')
      .DescricaoRodape('Financial Statistics')
      .ImagemRodape('mais')
      .Alinhamento(TAlignLayout.Left)
      .TipoGrafico(TChartType.Lines)
      .MargemRight(50)
      .Largura(387,400)
      .Build);

  lytGraficos.AddObject(
    TComponentCardGraficos2.New(Self)
      .TituloInfo('+18')
      .TituloDescricao('$34,657')
      .TituloGrafico('TOTAL: EARNINGS IN LAST TEN QUARTERS')
      .DescricaoRodape('Financial Statistics')
      .ImagemRodape('mais')
      .Alinhamento(TAlignLayout.Left)
      .TipoGrafico(TChartType.Lines)
      .Largura(387,400)
      .Build);
end;

procedure TPageHome.lytCardLeftResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardLeft, 2);
end;

procedure TPageHome.lytCardRightResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardRight, 2);
end;

procedure TPageHome.lytCardsResize(Sender: TObject);
begin
  lytCardLeft.Width := Round((lytContainer.Width - 40) / 2);
end;

function TPageHome.Render: TFMXObject;
begin
  CarregaCards;
  CarregaGraficos;
  Result := lytContainer; //home criada
end;

procedure TPageHome.ResponsiveLayout(Value: TLayout; Count: Integer);
begin
  for var I := 0 to Pred(Value.ChildrenCount) do
    if Value.Children.Items[I] is TLayout then
      TLayout(Value.Children.Items[I]).Width :=
        Round(Value.Width / Count);
end;

procedure TPageHome.UnRender;
begin

end;

end.
