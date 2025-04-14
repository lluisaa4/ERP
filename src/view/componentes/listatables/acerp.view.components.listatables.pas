unit acerp.view.components.listatables;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects;

type
  TComponentListaTable = class(TFrame)
    lytContainer: TLayout;
    lytItem: TLayout;
    lytAcoes: TLayout;
    lytSalario: TLayout;
    lytCargo: TLayout;
    lytDesde: TLayout;
    lytNome: TLayout;
    lblItem: TLabel;
    lblNome: TLabel;
    lblCargo: TLabel;
    lblDesde: TLabel;
    lblSalario: TLabel;
    lytNovo: TLayout;
    lytExcluir: TLayout;
    lytEditar: TLayout;
    rctnglNovo: TRectangle;
    RectangleEdit: TRectangle;
    RectangleExcluir: TRectangle;
    imgNovo: TImage;
    imgEditar: TImage;
    ImgExcluir: TImage;
    lytButtomNovo: TLayout;
    lytButtomExcluir: TLayout;
    lytButtomEditar: TLayout;
    procedure lytButtomNovoMouseEnter(Sender: TObject);
    procedure lytButtomNovoMouseLeave(Sender: TObject);
    procedure lytButtomExcluirMouseEnter(Sender: TObject);
    procedure lytButtomExcluirMouseLeave(Sender: TObject);
    procedure lytButtomEditarMouseEnter(Sender: TObject);
    procedure lytButtomEditarMouseLeave(Sender: TObject);

  private
    procedure MontaBotoes;
  public
    class function New(AOwner: TComponent): TComponentListaTable;
    function Nome(Value: string): TComponentListaTable;
    function Item(Value: string): TComponentListaTable;
    function Descricao(Value: string): TComponentListaTable;
    function Cargo(Value: string): TComponentListaTable;
    function Salario(Value: Currency): TComponentListaTable;
    function Desde(Value: string): TComponentListaTable;
    function Alinhamento(Value: TAlignLayout): TComponentListaTable;
    function Build: TFmxObject;
  end;

implementation

uses
  acerp.services.utils;

{$R *.fmx}

function TComponentListaTable.Alinhamento(
  Value: TAlignLayout): TComponentListaTable;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentListaTable.Build: TFmxObject;
begin
  MontaBotoes;
  Result := lytContainer;
end;

function TComponentListaTable.Cargo(Value: string): TComponentListaTable;
begin
  Result := Self;
  lblCargo.Text := Value;
end;

function TComponentListaTable.Descricao(Value: string): TComponentListaTable;
begin
  Result := Self;
  lblNome.Text := Value;
end;

function TComponentListaTable.Desde(Value: string): TComponentListaTable;
begin
  Result := Self;
  lblDesde.Text := Value;
end;

function TComponentListaTable.Item(Value: string): TComponentListaTable;
begin
  Result := Self;
  lblItem.Text := Value;
end;

procedure TComponentListaTable.lytButtomEditarMouseEnter(Sender: TObject);
begin
  RectangleEdit.Fill.Color := $FF44c37d;
end;

procedure TComponentListaTable.lytButtomEditarMouseLeave(Sender: TObject);
begin
  RectangleEdit.Fill.Color := $FFe46231;
end;

procedure TComponentListaTable.lytButtomExcluirMouseEnter(Sender: TObject);
begin
  RectangleExcluir.Fill.Color := $FFe46231;
end;

procedure TComponentListaTable.lytButtomExcluirMouseLeave(Sender: TObject);
begin
  RectangleExcluir.Fill.Color := $FFE1385A;
end;

procedure TComponentListaTable.lytButtomNovoMouseEnter(Sender: TObject);
begin
  rctnglNovo.Fill.Color := $FF29a0c2;
end;

procedure TComponentListaTable.lytButtomNovoMouseLeave(Sender: TObject);
begin
  rctnglNovo.Fill.Color := $FF045454;
end;

procedure TComponentListaTable.MontaBotoes;
begin
  TUtils.ResourceImage('user', imgNovo);
  TUtils.ResourceImage('editar', imgEditar);
  TUtils.ResourceImage('cancelar', ImgExcluir);

  TUtils.ImageColor(imgNovo, $FFFFFFFF);
  TUtils.ImageColor(imgEditar, $FFFFFFFF);
  TUtils.ImageColor(ImgExcluir, $FFFFFFFF);
end;

class function TComponentListaTable.New(
  AOwner: TComponent): TComponentListaTable;
begin
  Result := Self.Create(AOwner);
end;

function TComponentListaTable.Nome(Value: string): TComponentListaTable;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentListaTable.Salario(Value: Currency): TComponentListaTable;
begin
  Result := Self;
  lblSalario.Text := FormatCurr('"R$ ", 0.00', Value);
end;

end.
