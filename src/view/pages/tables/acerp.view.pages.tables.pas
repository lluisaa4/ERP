unit acerp.view.pages.tables;

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
  Router4D.Interfaces;

type
  TPageTables = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
  private
    { Private declarations }
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  PageTables: TPageTables;

implementation

uses
  acerp.view.components.extendertables;

{$R *.fmx}

{ TPageTables }

function TPageTables.Render: TFMXObject;
begin
  Result := lytContainer;
end;

procedure TPageTables.UnRender;
begin

end;

end.
