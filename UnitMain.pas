unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, UnitMessageBox;

type
  TForm1 = class(TForm)
    btnConnect: TBitBtn;
    edtIp: TEdit;
    edtPort: TEdit;
    lblIP: TLabel;
    lblPort: TLabel;
    idtcpclntTest: TIdTCPClient;
    procedure btnConnectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  try
    begin
      idtcpclntTest.Host := Self.edtIp.Text;
      if idtcpclntTest.Host = '' then
      begin
        FrmMessageBox.lblMessage.Caption := 'Invalid IP.';
        FrmMessageBox.ShowModal;
        exit;
      end;
      try
        idtcpclntTest.Port := StrToInt(edtPort.Text);
      except
        FrmMessageBox.lblMessage.Caption := 'Invalid Port.';
        FrmMessageBox.ShowModal;
        exit;
      end;
      Self.idtcpclntTest.Connect;
      FrmMessageBox.lblMessage.Caption := 'OK';
      FrmMessageBox.ShowModal;
      idtcpclntTest.Disconnect;
    end;
  except
    on ex:Exception do
    begin
      FrmMessageBox.lblMessage.Caption := ex.Message;
      FrmMessageBox.ShowModal;
    end;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then close;
  if Key = 13 then btnConnectClick(nil);
end;

end.
