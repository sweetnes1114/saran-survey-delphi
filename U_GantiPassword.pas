unit U_GantiPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ComCtrls;

type
  TFGantiPassword = class(TForm)
    Panel1_Header: TPanel;
    lblJudul2: TLabel;
    lblJudul1: TLabel;
    edtSetfokus: TEdit;
    Panel2_Kiri: TPanel;
    Label10: TLabel;
    lblkeluar: TLabel;
    Label29: TLabel;
    Panel3_Kanan: TPanel;
    Panel6_hitam: TPanel;
    Pnl_Komponen: TPanel;
    GBGantiPW: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtgantiuser: TEdit;
    edtgantipass: TEdit;
    edtgantiulangi: TEdit;
    ganti: TBitBtn;
    ZCommand: TZQuery;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    FloatField1: TFloatField;
    WideStringField3: TWideStringField;
    FloatField2: TFloatField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    DateField1: TDateField;
    TimeField1: TTimeField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1KeyPress(Sender: TObject; var Key: Char);
    procedure btnkeluarClick(Sender: TObject);
    procedure btnPrint2Click(Sender: TObject);
    procedure gantiClick(Sender: TObject);
    procedure edtgantipassKeyPress(Sender: TObject; var Key: Char);
    procedure edtgantiulangiKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGantiPassword: TFGantiPassword;

implementation

uses U_Utama, U_ZFunction_Terbilang;

{$R *.dfm}

procedure TFGantiPassword.btnkeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFGantiPassword.btnPrint2Click(Sender: TObject);
begin
  MessageDlg('Laporan ini belum selesai di buat... sedang dalam proses pengerjaan..',mtWarning,[mbok],0);
end;

procedure TFGantiPassword.edtgantipassKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  edtgantiulangi.SetFocus;
end;

procedure TFGantiPassword.edtgantiulangiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  ganti.SetFocus;
end;

procedure TFGantiPassword.BitBtn4Click(Sender: TObject);
begin
  if FUtama.lbluser.Caption<>'xxx' then
  begin
    GBGantiPW.Visible:=True;
    edtgantiuser.Text:=FUtama.lbluser.Caption;
    edtgantipass.Text:='';
    edtgantiulangi.Text:='';
    edtgantipass.SetFocus;
  end;
end;

procedure TFGantiPassword.btn1KeyPress(Sender: TObject; var Key: Char);
begin
  if key =#27 then
  begin
    btnkeluarClick(Sender);
  end;
end;

procedure TFGantiPassword.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUtama.sGantiPassword:=0;
  Action:=caFree;
end;

procedure TFGantiPassword.gantiClick(Sender: TObject);
begin
  if (edtgantipass.Text='') or (edtgantiulangi.Text='') then
  begin
    MessageDlg('Silahkan Isi password baru terlebih dahulu !', mtWarning,[mbOK],0);
    Exit;
  end;
  if (MessageDlg('Yakin ingin ubah password ? ',mtWarning,[mbYes,mbNo],0))= mryes then
  begin
    if edtgantipass.Text=edtgantiulangi.Text then
    begin
      ZCommand.SQL.Text:='update tbl_user set user1='+QuotedStr(edtgantiuser.Text)+
                                                  ',level1='+QuotedStr(FUtama.lbllevel.Caption)+
                                                  ',pass1= md5('+QuotedStr(edtgantipass.Text)+
                                                  ')  where user1= '+QuotedStr(edtgantiuser.Text)+'';

      try
        ZCommand.ExecSQL;;
        MessageDlg('Ganti Password  ' + QuotedStr(edtgantiuser.Text) +' ,sukses' ,mtInformation,[mbok],0);
        edtgantipass.Text:='';
        edtgantiulangi.Text:='';
        GBGantiPW.Visible:=False;
      except
        MessageDlg('Gagal mengubah password user' ,mtInformation,[mbok],0);
        Exit;
      end;
      //FormActivate(Sender);
    end
    else
    begin
      MessageDlg('Password tidak cocok, ulangi' ,mtWarning,[mbok],0);
    end;
  end;
end;

end.
