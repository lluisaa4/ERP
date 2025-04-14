unit acerp.view.pages.empresas;

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
  FMX.Effects,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  Router4D.Interfaces,
  Router4D.Props, acerp.view.components.interfaces2;


type
  TPageEmpresa = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    rctngl1: TRectangle;
    layout1: TLayout;
    lyt3: TLayout;
    Label1: TLabel;
    lyt5: TLayout;
    lyt9: TLayout;
    lyt8: TLayout;
    lyt7: TLayout;
    lyt6: TLayout;
    shdwfct1: TShadowEffect;
    lyt13: TLayout;
    lyt14: TLayout;
    rndrct1: TRoundRect;
    Label8: TLabel;
    lytButton: TLayout;
    lyt2: TLayout;
    procedure lytButtonMouseEnter(Sender: TObject);
    procedure lytButtonMouseLeave(Sender: TObject);
//    procedure lyt2Resized(Sender: TObject);
  private
    lMargem2: TEditMargins2;
    procedure MontarEdit;
    procedure MotaPrimeiroBLoco;
    procedure MotaSegundoBLoco;
    procedure MotaTerceiroBLoco;
    procedure MotaQuartoBLoco;
    procedure MotaQuintoBLoco;
    procedure MotaSextoBLoco;
  public
    function Render: TFMXObject;
    procedure UnRender;
    [Subscribe]
    procedure Props(aValue: TProps);
  end;

implementation

{$R *.fmx}


uses
  acerp.view.componentes.edits2,
  acerp.view.components.interfaces,
  acerp.view.componentes.editsarea,
  acerp.services.enums;

//procedure TPageEmpresa.lyt2Resized(Sender: TObject);
//begin
//  var lWidth : Single := 0;
//
//  for var I := 0 to Pred(lyt5.ChildrenCount) do
//     lWidth := lWidth + TLayout(lyt5.Children[I]).Width;
//  if not (lWidth = 0) then
//    lyt2.Padding.Right := lWidth-50;
//end;

procedure TPageEmpresa.lytButtonMouseEnter(Sender: TObject);
begin
  rndrct1.Fill.Color := $FF2ba9cd;
end;

procedure TPageEmpresa.lytButtonMouseLeave(Sender: TObject);
begin
  rndrct1.Fill.Color := $FF0CB5B5;
end;

procedure TPageEmpresa.MontarEdit;
begin
  var
  lMargem: TEditMargins;
  lMargem.Right := 10;

  MotaPrimeiroBLoco;
  MotaSegundoBLoco;
  MotaTerceiroBLoco;
  MotaQuartoBLoco;
  MotaQuintoBLoco;
  MotaSextoBLoco;
end;

procedure TPageEmpresa.MotaPrimeiroBLoco;
begin
  lyt6.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('CRT')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(100)
      .Margem2(lMargem2)
      .PlaceHolder2('CRT')
      .Build2);

  lyt6.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('IE')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(200)
      .Margem2(lMargem2)
      .PlaceHolder2('IE')
      .Build2);

  lyt6.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('IM')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(200)
      .Margem2(lMargem2)
      .PlaceHolder2('IM')
      .Build2);

  lyt6.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('CNAE')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(200)
      .Margem2(lMargem2)
      .PlaceHolder2('CNAE')
      .Build2);

  lyt6.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('CNPJ')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(190)
      .Margem2(lMargem2)
      .PlaceHolder2('CNPJ')
      .Build2);
end;

procedure TPageEmpresa.MotaQuartoBLoco;
begin
  lyt9.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Bairro')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(400)
      .Margem2(lMargem2)
      .PlaceHolder2('Bairro')
      .Build2);

  lyt9.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Estado')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(110)
      .Margem2(lMargem2)
      .PlaceHolder2('Estado')
      .Build2);

  lyt9.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Cidade')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(400)
      .Margem2(lMargem2)
      .PlaceHolder2('Cidade')
      .Build2);
end;

procedure TPageEmpresa.MotaQuintoBLoco;
begin
  lyt13.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Telefone')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(300)
      .Margem2(lMargem2)
      .PlaceHolder2('Telefone')
      .Build2);

  lyt13.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('E-Mail')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(620)
      .Margem2(lMargem2)
      .PlaceHolder2('E-Mail')
      .Build2);
end;

procedure TPageEmpresa.MotaSegundoBLoco;
begin
  lyt7.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Raz�o Social')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(460)
      .Margem2(lMargem2)
      .PlaceHolder2('Raz�o Social')
      .Build2);

  lyt7.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Nome fantasia')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(460)
      .Margem2(lMargem2)
      .PlaceHolder2('Nome fantasia')
      .Build2);
end;

procedure TPageEmpresa.MotaSextoBLoco;
begin
  lyt5.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Observa��o')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(930)
      .Margem2(lMargem2)
      .PlaceHolder2('Observa��o')
      .Build2);
end;

procedure TPageEmpresa.MotaTerceiroBLoco;
begin
  lyt8.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Cep')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(100)
      .Margem2(lMargem2)
      .PlaceHolder2('Cep')
      .Build2);

  lyt8.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Logradouro')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(500)
      .Margem2(lMargem2)
      .PlaceHolder2('Logradouro')
      .Build2);

  lyt8.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Numero')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(100)
      .Margem2(lMargem2)
      .PlaceHolder2('Numero')
      .Build2);

  lyt8.AddObject(
  TComponentEdit2.New2(Self)
      .Titulo2('Complemento')
      .Alinhamento2(TAlignLayout.Left)
      .Largura2(200)
      .Margem2(lMargem2)
      .PlaceHolder2('Complemento')
      .Build2);
end;

procedure TPageEmpresa.Props(aValue: TProps);
begin
  var lTipo: TTipoAcao;
  case lTipo.ToEnum(aValue.Key) of
    EDITAR: Label1.Text := 'Editar Empresa';
    NOVO: Label1.Text := 'Cadastrar Empresa';
  end;
end;

function TPageEmpresa.Render: TFMXObject;
begin
//  lMargem2 := TEditMargins2.Create;
  lMargem2.Right2 := 10;

  MontarEdit;
  Result := lytContainer;
end;

procedure TPageEmpresa.UnRender;
begin

end;

end.
