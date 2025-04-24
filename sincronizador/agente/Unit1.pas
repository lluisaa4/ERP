unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet;

type
  TForm3 = class(TForm)
    memo2: TMemo;
    Btn1: TButton;
    Btn2: TButton;
    Btn3: TButton;
    con1: TFDConnection;
    fdqry1: TFDQuery;
    fdvntlrtr1: TFDEventAlerter;
    procedure Btn1Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure fdvntlrtr1Timeout(Sender: TObject);
    procedure fdvntlrtr1Alert(ASender: TFDCustomEventAlerter;
      const AEventName: string; const AArgument: Variant);
  private
    procedure RegistrarEvento;
    procedure DesativarEvento;
    procedure ExecutarEvento;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

{ TAgente }

procedure TForm3.Btn1Click(Sender: TObject);
begin
  if not (Btn1.Caption = 'Start') then
    DesativarEvento
  else
    RegistrarEvento;
end;

procedure TForm3.Btn2Click(Sender: TObject);
begin
  ExecutarEvento;
end;

procedure TForm3.DesativarEvento; //é oq vai conectar com o banco
begin
  if not fdvntlrtr1.Active then
    Exit;
  memo2.Lines.Add('Desativado');
  fdvntlrtr1.Unregister;
  memo2.Lines.Add('Inativo');
  Btn1.Caption := 'Start';
end;

procedure TForm3.ExecutarEvento;
begin
  fdqry1.Close;
  fdqry1.SQL.Clear;
  fdqry1.SQL.Add('SELECT POST_EVENT(''SINCRONIZAR'',''I'')');

  fdqry1.Command.CommandKind := skOther;

  fdqry1.Connection.StartTransaction;
  fdqry1.ExecSQL;
  fdqry1.GetResults;
  fdqry1.Connection.Commit;
end;

procedure TForm3.fdvntlrtr1Alert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const AArgument: Variant);
begin
  var sArgs: String;
  if VarIsArray(AArgument) then
  begin
    sArgs := '';
    for var I := VarArrayLowBound(AArgument, 1) to VarArrayHighBound(AArgument,1) do
      begin
        if not sArgs.IsEmpty then
          sArgs := sArgs + ', ';
        sArgs := sArgs + VarToStr(AArgument[I]);
      end;
  end
  else if VarIsNull(AArgument) then
        sArgs := '<NULL>'
  else if VarIsEmpty(AArgument) then
       sArgs := '<UNASSIGNED>'
  else
    sArgs := VarToStr(AArgument);

  memo2.Lines.Add('Event - [' + AEventName + '] - [' + sArgs +']');
end;

procedure TForm3.fdvntlrtr1Timeout(Sender: TObject);
begin
  memo2.Lines.Add('Timeout');
end;

procedure TForm3.RegistrarEvento;
begin
  if fdvntlrtr1.Active then
    Exit;

  fdvntlrtr1.Options.Kind := '';
  fdvntlrtr1.Names.Clear;
  fdvntlrtr1.Names.Add('SINCRONIZAR');
  fdvntlrtr1.Options.Synchronize := True;
  memo2.Lines.Add('Registrar');
  fdvntlrtr1.Register;

  Btn1.Caption := 'Stop';
end;
end.
