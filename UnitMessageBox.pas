unit UnitMessageBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmMessageBox = class(TForm)
    btnOK: TBitBtn;
    lblMessage: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnOKKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMessageBox: TFrmMessageBox;

implementation

{$R *.dfm}

procedure TFrmMessageBox.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMessageBox.btnOKKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then close;
end;

end.
