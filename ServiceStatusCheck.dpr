program ServiceStatusCheck;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  UnitMessageBox in 'UnitMessageBox.pas' {FrmMessageBox};

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TForm1, Form1);
  Application.Title := 'Service Status Check';
  Application.CreateForm(TForm1, FrmMain);
  Application.CreateForm(TFrmMessageBox, FrmMessageBox);
  Application.Run;
end.
