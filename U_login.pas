unit U_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB, ActnList, OleCtrls,
  ShockwaveFlashObjects_TLB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  GIFImg, pngimage, jpeg;

type
  TFLogin = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtnama: TEdit;
    edtpass: TEdit;
    btnlogin: TBitBtn;
    btncancel: TBitBtn;
    langsung: TButton;
    CheckBox1: TCheckBox;
    QUser: TZQuery;
    lblInfo1: TLabel;
    QUseruser1: TWideStringField;
    QUsernama1: TWideStringField;
    QUserpass1: TWideStringField;
    QUserlevel1: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtnamaKeyPress(Sender: TObject; var Key: Char);
    procedure edtpassKeyPress(Sender: TObject; var Key: Char);
    procedure LoginExecute(Sender: TObject);
    procedure langsungClick(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure btnloginClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edtpassEnter(Sender: TObject);
    procedure edtpassExit(Sender: TObject);
    procedure edtnamaExit(Sender: TObject);
    procedure edtnamaMouseEnter(Sender: TObject);
    procedure edtpassMouseEnter(Sender: TObject);
    procedure edtnamaEnter(Sender: TObject);
  private
    { Private declarations }
    procedure aturmenu;
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
  kesalahan : byte;
  pesansalah :string;

implementation

uses U_dm, U_utama;

{$R *.dfm}

procedure TFLogin.edtnamaEnter(Sender: TObject);
begin
  with edtnama do
  begin
    Color:=clSkyBlue;
  end;
end;

procedure TFLogin.edtnamaExit(Sender: TObject);
begin
  with edtnama do
  begin
    Color:=clWindow;
  end;
end;

procedure TFLogin.edtnamaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then edtpass.SetFocus;
  if key=#27 then btncancelClick(Sender);
end;

procedure TFLogin.edtnamaMouseEnter(Sender: TObject);
begin
  with edtnama do
  begin
    Color:=$00C08080;
  end;
end;

procedure TFLogin.edtpassEnter(Sender: TObject);
begin
  with edtpass do
  begin
    Color:=clSkyBlue;
  end;
end;

procedure TFLogin.edtpassExit(Sender: TObject);
begin
  with edtpass do
  begin
    Color:=clWindow;
  end;
end;

procedure TFLogin.edtpassKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then btnloginClick(Sender);
  if key=#27 then btncancelClick(Sender);
end;

procedure TFLogin.edtpassMouseEnter(Sender: TObject);
begin
  with edtpass do
  begin
    Color:=$00C08080;
  end;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUtama.slogin:=0;
  Action:=caFree;
end;

procedure TFLogin.langsungClick(Sender: TObject);
begin
  edtnama.Text:='admin';
  edtpass.Text:='admin';
  btnloginClick(Sender);
end;

procedure TFLogin.LoginExecute(Sender: TObject);
begin
  btnloginClick(Sender);
end;

procedure TFLogin.Panel1DblClick(Sender: TObject);
begin
  langsung.Visible:=True;
end;

procedure TFLogin.aturmenu;
begin
  Futama.Image2.Visible:=True;
  Futama.Image3.Visible:=True;
  Futama.btnlogout.Visible:=True;
  Futama.lbllogout.Visible:=True;
  Futama.lbluser.Visible:=True;
  Futama.lbllevel.Visible:=True;
  {Atur Main Menu}
  with FUtama do
    begin
      if QUserlevel1.AsString='Administrator' then
      begin
        
      end
      else
      if QUserlevel1.AsString='kasir' then
      begin


      end
      else
      if QUserlevel1.AsString='pembelian' then
      begin


      end
      else
      if QUserlevel1.AsString='penjualan' then
      begin


      end
      else
      if QUserlevel1.AsString='project' then
      begin

       
      end
    end;
  
    Close;
  //Futama.Color:=clWhite;
end;

procedure TFLogin.btncancelClick(Sender: TObject);
begin
  FUtama.lbluser.Caption:='';
  close;
  GroupBox1.Visible:=False;
end;

procedure TFLogin.btnloginClick(Sender: TObject);
begin
  if edtnama.Text='' then
  begin
    MessageDlg('Nama User tidak boleh kosong ' +#13+#10 + 'Masukkan nama user !',mtWarning,[mbOK],0);
    edtnama.SetFocus;
    Exit;
  end;
  if edtpass.Text='' then
  begin
    MessageDlg('Password tidak boleh kosong ' +#13+#10 + 'Masukkan password anda !',mtWarning,[mbOK],0);
    Exit;
  end;

  quser.Close;
  quser.sql.Clear;
  quser.SQL.add('select * from tbl_user where user1 = '+QuotedStr(edtnama.Text)+' and pass1 = md5('+QuotedStr(edtpass.Text)+')');
  quser.Open;
  if quser.RecordCount=0 then
  begin
    kesalahan:=kesalahan+1;
    if (kesalahan>=1) then
    begin
      pesansalah:=IntToStr(kesalahan);
      MessageDlg('User dan Password tidak valid, input User dan Password dengan benar ! '+#13+#10 + QuotedStr(pesansalah) + ' salah',mtWarning,[mbOK],0);
      if kesalahan>=3 then
      begin
        Application.Terminate;
      end;
    end;
  end
  else
  begin
    if (QUserlevel1.AsString='Administrator') then
    begin
      aturmenu;
      Close;
    end
    else
    begin
      aturmenu;
      Close;
    end;
    //MessageDlg('Selamat datang '+QuotedStr(edtnama.Text)+#13+#10 +'selamat menggunakan program aplikasi ini !',mtInformation,[mbOK],0);
    Futama.lbluser.Caption:=edtnama.Text;
    Futama.lbllevel.Caption:=quserlevel1.AsString;
    edtnama.Clear;
    edtpass.Clear;
    GroupBox1.Visible:=False;
    end;
  end;
procedure TFLogin.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked=True then
  edtpass.PasswordChar:=#0 else
  edtpass.PasswordChar:='*';
end;

end.
