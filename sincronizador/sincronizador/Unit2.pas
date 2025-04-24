unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Btn1: TButton;
    Button1: TButton;
    memo2: TMemo;
    fdqry1: TFDQuery;
    con1: TFDConnection;
    fdphyspgdrvrlnk1: TFDPhysPgDriverLink;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm2.FormCreate(Sender: TObject);
begin
  // Defina o caminho correto para a libpq.dll
  fdphyspgdrvrlnk1.VendorLib := 'C:\dev\estudos\ac-erp\sincronizador\sincronizador\bin\libpq.dll'; // Substitua com o caminho real

  // Teste a conex�o
  try
    con1.Connected := True; // Tenta conectar
    ShowMessage('Conectado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao conectar: ' + E.Message);
  end;
end;

end.
