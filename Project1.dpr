program Project1;

uses
  Vcl.Forms,
  ERP in 'src\view\ERP.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
