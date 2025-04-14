unit acerp.view.pages.login;

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
  FMX.StdCtrls,
  Router4D.Interfaces,
  FMX.Effects, Router4D;

type
  TPageLogin = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    imgBackground: TImage;
    rctngl1: TRectangle;
    lyt1: TLayout;
    lyt2: TLayout;
    lyt3: TLayout;
    lyt4: TLayout;
    lyt5: TLayout;
    rctngl3: TRectangle;
    Label3: TLabel;
    imageUser: TImage;
    Layout1: TLayout;
    Layout2: TLayout;
    ImageBloquear: TImage;
    Layout3: TLayout;
    Label4: TLabel;
    Layout4: TLayout;
    Layout5: TLayout;
    ImageRegistrado: TImage;
    Layout6: TLayout;
    Label5: TLabel;
    lyt9: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    rctngl2: TRectangle;
    lyt6: TLayout;
    Label1: TLabel;
    lyt7: TLayout;
    rndrct1: TRoundRect;
    Label2: TLabel;
    lyt8: TLayout;
    lyt10: TLayout;
    procedure lyt10Click(Sender: TObject);
  private
    procedure MontarEdits;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  PageLogin: TPageLogin;

implementation

{$R *.fmx}

uses
  acerp.services.utils,
  acerp.view.components.editimagem,
  acerp.view.components.interfaces, acerp.view.styles;

{ TPageLogin }

procedure TPageLogin.lyt10Click(Sender: TObject);
begin
  TRouter4D.Link.IndexLink('Layout'); //vai direcionar para a page Layout
end;

procedure TPageLogin.MontarEdits;
begin
  var
    lMargem: TEditMargins;
    lMargem.Bottom := 5;
    lMargem.Top := 5;

  lyt8.AddObject(
    TComponentEditImage.New(Self)
    .Nome('segredp')
    .BackGroundColor($FFFFFFFF)
    .FontColor($FF4b2d8b)
    .Alinhamento(TAlignLayout.Top)
    .Margem(lMargem)
    .Image('segredo')
    .ImageColor($FFbebcba)
    .PlaceHolder('Password')
    .Password(True)
    .Build);

  lyt8.AddObject(
    TComponentEditImage.New(Self)
    .Nome('usuario')
    .BackGroundColor($FFFFFFFF)
    .FontColor($FF4b2d8b)
    .Alinhamento(TAlignLayout.Top)
    .Margem(lMargem)
    .Image('user')
    .ImageColor($FFbebcba)
    .PlaceHolder('Usu�rio')
    .Build);

end;

function TPageLogin.Render: TFMXObject;
begin
  TUtils.ResourceImage('user', imageUser);
  TUtils.ImageColor(imageUser, $FFFFFFFF);
  TUtils.ResourceImage('registrado', ImageRegistrado);
  TUtils.ImageColor(ImageRegistrado, $FFFFFFFF);
  TUtils.ResourceImage('segredo', ImageBloquear);
  TUtils.ImageColor(ImageBloquear, $FFFFFFFF);

  MontarEdits; //para montar onde coloca o usuario e a senha
  Result := lytContainer;
end;

procedure TPageLogin.UnRender;
begin

end;

end.
