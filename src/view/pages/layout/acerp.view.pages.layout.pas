unit acerp.view.pages.layout;

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
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.MultiView,
  Router4D.Interfaces, FMX.StdCtrls;

type
  TPageLayout = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    mltvw1: TMultiView;
    lyt1: TLayout;
    lytMain: TLayout;
    lyt2: TLayout;
    lytBody: TLayout;
    recBackground: TRectangle;
    Btn1: TButton;
  private
    procedure RenderSidebar;

    procedure MultiViewShow;
    procedure MultiViewHide;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;


implementation

uses
  Router4D,
  acerp.view.pages.home,
  acerp.view.componentes.sidebar;

{$R *.fmx}

{ TPageLayout }

procedure TPageLayout.MultiViewHide;
begin
  mltvw1.HideMaster;
end;

procedure TPageLayout.MultiViewShow;
begin
  mltvw1.ShowMaster;
end;

function TPageLayout.Render: TFMXObject;
begin
  RenderSidebar;
  TRouter4D.Render<TPageHome>.SetElement(lytBody);
  Result := lytContainer;
end;

procedure TPageLayout.RenderSidebar;
begin
  lyt1.AddObject(TComponentSidebar
    .New(Self)
    .MultiView(mltvw1)
    .OnMenuShow(MultiViewShow)
    .OnMenuHide(MultiViewHide)
    .Component);
end;

procedure TPageLayout.UnRender;
begin

end;

end.
