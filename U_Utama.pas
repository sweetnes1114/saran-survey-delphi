unit U_Utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ActnList, Buttons, StdCtrls, pngimage, ExtCtrls, jpeg,
  GIFImg;

type
  TFUtama = class(TForm)
    MM1: TMainMenu;
    Img_MM1: TImageList;
    Act: TActionList;
    ActLogin: TAction;
    ActLogout: TAction;
    ActKeluar: TAction;
    Act02: TAction;
    Panel1: TPanel;
    Image2: TImage;
    Image3: TImage;
    lbluser: TLabel;
    lbllevel: TLabel;
    btnlogout: TSpeedButton;
    lbllogout: TLabel;
    Panel2: TPanel;
    lbldate: TLabel;
    LoginProgrammer1: TMenuItem;
    ActGantiPassword: TAction;
    Act01: TAction;
    Act03: TAction;
    Act06_Beli: TAction;
    Act16_Jual: TAction;
    Act06_Beli_View: TAction;
    Act16_Jual_View: TAction;
    ActBarangLaporan: TAction;
    ActLihatBMasuk_Periode: TAction;
    ActLihatBKeluar_Periode: TAction;
    Act00: TAction;
    lblWaktu: TLabel;
    Timer1: TTimer;
    Act04: TAction;
    Act05: TAction;
    Version1: TMenuItem;
    Act06_MEkspedisi_Beli: TAction;
    Act07_Beli_Retur: TAction;
    Act07_Beli_Retur_View: TAction;
    Act08_Pembayaran_Pembelian: TAction;
    Act08_Pembayaran_Ekspedisi: TAction;
    ActLapBarang1: TAction;
    ActLapBarang2: TAction;
    ActLapBarang3: TAction;
    ActKeuangan1: TAction;
    ActKeuangan2: TAction;
    ActKeuangan3: TAction;
    ActKeuangan4: TAction;
    ActKeuangan5: TAction;
    ActKeuangan6: TAction;
    ActKeuangan7: TAction;
    Act16_MEkspedisi_Jual: TAction;
    PnlGerak: TPanel;
    lblGerak: TLabel;
    Timer2: TTimer;
    lblGerak2: TLabel;
    Act17_Jual_Retur: TAction;
    Act17_Juali_Retur_View: TAction;
    Act18_Pembayaran_Penjualan: TAction;
    Act18_Pembayaran_Ekspedisi: TAction;
    Act20: TAction;
    Label4: TLabel;
    ImgBawah: TImage;
    Act_70_Gaji: TAction;
    Act_50_Mutasi_Internal: TAction;
    Act_60_Mutasi_Kasi: TAction;
    Action4: TAction;
    Act_1_Project: TAction;
    Act_2_Project: TAction;
    Act_3_Project: TAction;
    Act_4_Project: TAction;
    Act_5_Project: TAction;
    Act_1_Project_View: TAction;
    Act_2_Project_View: TAction;
    Act_4_Project_View: TAction;
    ActKeuangan8: TAction;
    ActLapBarang4: TAction;
    Label26: TLabel;
    Label34: TLabel;
    Calc1: TMenuItem;
    ReConnect1: TMenuItem;
    PenilaianPelayanan1: TMenuItem;
    PenilaianPelayanan2: TMenuItem;
    Label1: TLabel;
    Image1: TImage;
    N12Survey1: TMenuItem;
    Panel3: TPanel;
    Image4: TImage;
    Image5: TImage;
    Panel4: TPanel;
    procedure ActLoginExecute(Sender: TObject);
    procedure ActLogoutExecute(Sender: TObject);
    procedure ActKeluarExecute(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure KeluarAplikasi1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure LoginProgrammer1Click(Sender: TObject);
    procedure ActGantiPasswordExecute(Sender: TObject);
    procedure MM_GantiPasswordClick(Sender: TObject);
    procedure ile1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Act06_BeliExecute(Sender: TObject);
    procedure PCloseFChild;
    procedure Aplikasi1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Version1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure btnlogoutClick(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Calc1Click(Sender: TObject);
    procedure ReConnect1Click(Sender: TObject);
    procedure PenilaianPelayanan2Click(Sender: TObject);
    procedure MM_01_PeriodeClick(Sender: TObject);
    procedure N12Survey1Click(Sender: TObject);
    procedure saranbtnClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AppMessage(var Msg: TMSG; var Handled: Boolean);
  var
    {Menu Master}    s01,s02,s03,s04, s01_view:word;
    {SALES}          s00_Sales_Lapangan,s00_sales_junior,s00_sales_senior:word;
    {Menu Pembelian} s06_Beli, s06_Beli_View, s06_Beli_edit: word;
                     s07,s07_View,s08_Pembayaran_Pembelian:word;
    {Menu Penjualan} s16_Jual, s16_Jual_View, s16_Jual_Edit: word;
                     s17,s17_View,s18_Pembayaran_PenJualan:word;
    {Menu Pembayaran}s20,s40,s50,s60,s70 : word;
    {Menu Laporan}   sLapBarang1, sLapBarang2, sLapBarang3,sLapBarang4,sLapBarang5,sLapBarang6 :word;
                     sSO, S_91_history_harga_beli,S_92_history_harga_jual :word;
    {Menu Keuangan}  sKeuangan1,  sKeuangan3, sKeuangan5, sKeuangan7,sKeuangan8 :word;
    {Menu}           slogin, sBarang, sKonsumen, sSupplier, sBMasuk, sBKeluar, sLihatsBKeluar, sLihatsBMasuk_periode:word;
                     sLihatsBKeluar_periode,sLihatsBarangLaporan,sLihatsBMasuk:word;
    {Ganti PW}sGantiPassword, S_01_pelayanan, S_saran, S_01_Pelayanan_Periode :word;
    {Project} s24_1_Project,s24_2_Project,s24_3_Project,s24_4_Project,s24_5_Project, s24_1_Project_Edit:word;
    {Project View} s24_1_Project_view,s24_2_Project_view,s24_3_Project_view,s24_4_Project_view,s24_5_Project_view:word;
    S_04_mpinjaman, S_03_trans_simpanan_pokok, S_03_trans_simpanan_wajib, S_03_trans_simpanan_khusus, S_03_trans_simpanan_sukarela :word;
    S_01_keluar_anggota, SView_02_simpanan_master_laporan_Global,S_06_dangsuran, SView_04_pinjaman_laporan:word;
    SView_07_potongan_sdm_laporan, S_06_dangsuran_lunas_awal:word;
    S_03_trans_simpanan_Global:word;
    S_01_daftar_perkiraan, S_02_mjurnal_umum, S_02_mjurnal_umum_Edit, s_02_mjurnal_umum_View, S_04_neraca_saldo_Set_Saldo_Awal, S_03_buku_besar, S_05_tutup_buku_bulanan :word;
  end;

var
  FUtama: TFUtama;

implementation

uses U_login,
  U_DM,   U_GantiPassword,
  U_ZFunction_Terbilang, U_01_pelayanan, U_saran, U_01_pelayanan_Periode;

{$R *.dfm}

procedure TFUtama.ActGantiPasswordExecute(Sender: TObject);
begin
  if sGantiPassword=0 then
  begin
    FGantiPassword:=TFGantiPassword.Create(Self);
    sGantiPassword:=1;
  end
  else
  if sGantiPassword=1 then
  begin
    FGantiPassword.Show;
  end;
end;

procedure TFUtama.ActKeluarExecute(Sender: TObject);
begin
  if MessageDlg('Yakin mau logout lalu keluar ?',mtWarning,[mbYes,mbNo],0)=mrYes then
  begin
    ActLogoutExecute(Sender);
    Application.Terminate;
  end
  else
  begin
    abort;
  end;
end;

procedure TFUtama.ActLoginExecute(Sender: TObject);
begin
  if slogin=1 then
  begin
    FLogin.Show;
  end
  else
  begin
    FLogin:=TFLogin.Create(Self);
    FLogin.Show;
    slogin:=1;
  end;
end;

procedure TFUtama.ActLogoutExecute(Sender: TObject);
var i: integer;
begin
  FUtama.FormCreate(Sender);
  for i:= 0 to MdiChildCount - 1 do
  begin
    MDIChildren[i].Close;
  end;
  //F_Anime.WindowState:=wsMaximized;
  Image2.Visible:=False;
  Image3.Visible:=False;
  btnlogout.Visible:=False;
  lbllogout.Visible:=False;
  lbluser.Visible:=False;
  lbllevel.Visible:=False;
  lbluser.Caption:='';
  lbllevel.Caption:='';
  slogin:=0;
  sBarang:=0;
  sSupplier:=0;
  sBMasuk:=0;
  sBKeluar:=0;
  sLihatsBMasuk:=0;
  sLihatsBKeluar:=0;
  S_01_pelayanan :=0;
  S_saran := 0;
  s06_Beli_View:=0;
  s07:=0;
  s07_View:=0;
  s08_Pembayaran_Pembelian:=0;
  sLapBarang1:=0;
  sLapBarang2:=0;
  sLapBarang3:=0;
  sLapBarang4:=0;
  s16_Jual:=0;
  s16_Jual_Edit:=0;
  s16_Jual_View:=0;
  s17:=0;
  s17_View:=0;
  s18_Pembayaran_PenJualan:=0;
  s20:=0;
  s40:=0;
  s50:=0;
  s60:=0;
  s70:=0;
  s24_1_Project:=0;
  s24_2_Project:=0;
  s24_3_Project:=0;
  s24_4_Project:=0;
  s24_5_Project:=0;
  s24_1_Project_view:=0;
  s24_2_Project_view:=0;
  s24_4_Project_view:=0;
  sKeuangan1:=0;
  sKeuangan3:=0;
  sKeuangan5:=0;
  sKeuangan7:=0;
  sKeuangan8:=0;
  s00_Sales_Lapangan:=0;
  s00_sales_junior:=0;
  s00_sales_senior:=0;
  S_91_history_harga_beli:=0;
  S_92_history_harga_jual:=0;
  S_04_mpinjaman:=0;
  s_03_trans_simpanan_pokok:=0;
  s_03_trans_simpanan_wajib:=0;
  s_03_trans_simpanan_khusus:=0;
  s_03_trans_simpanan_sukarela:=0;
  S_01_keluar_anggota:=0;
  SView_02_simpanan_master_laporan_Global:=0;
  SView_04_pinjaman_laporan:=0;
  SView_07_potongan_sdm_laporan:=0;
  S_06_dangsuran_lunas_awal:=0;
  S_03_trans_simpanan_Global:=0;
  S_01_daftar_perkiraan:=0;
  S_02_mjurnal_umum:=0;
  s_02_mjurnal_umum_View:=0;
  S_04_neraca_saldo_Set_Saldo_Awal:=0;
  S_03_buku_besar:=0;
  S_05_tutup_buku_bulanan:=0;
end;
procedure TFUtama.Act06_BeliExecute(Sender: TObject);
begin
{  if S_03_trans_simpanan_Global=0 then
  begin
    F_03_trans_simpanan_Global:=TF_03_trans_simpanan_Global.Create(Self);
    S_03_trans_simpanan_Global:=1;
  end
  else
  if S_03_trans_simpanan_Global=1 then
  begin
    F_03_trans_simpanan_Global.Show;
  end;    }
end;

procedure TFUtama.Aplikasi1Click(Sender: TObject);
begin
  FUtama.WindowState:=wsMaximized;
end;

procedure TFUtama.AppMessage(var Msg: TMSG; var Handled: Boolean);
begin
  Handled := False;
  case Msg.Message of
  WM_SYSKEYDOWN:
    if Msg.wParam = VK_F4 then
    Handled := True; // cegah Alt-F4
  end;
end;

procedure TFUtama.btnlogoutClick(Sender: TObject);
begin
  ActLogoutExecute(Sender);
end;

procedure TFUtama.Button2Click(Sender: TObject);
begin
if S_saran=0 then
  begin
    F_saran:=TF_saran.Create(self);
    S_saran:=1;
  end
  else
  if S_saran=1 then
  begin
    F_saran.Show;
  end;
end;

procedure TFUtama.Calc1Click(Sender: TObject);
begin
  ZFunction_Terbilang.panggil_calc;
end;

procedure TFUtama.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TFUtama.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ActKeluarExecute(Sender);
end;

procedure TFUtama.FormCreate(Sender: TObject);
begin
  Application.OnMessage := AppMessage;
  
  KeyPreview:=True;
  try
    DM.ZConnection2.Connected:=True;
  except
    MessageDlg('Tidak Konek dengan Server.'+#13#10+
               'Cek Koneksi / Kabel Jaringan !'+#13#10+
               'Lalu buka kembali Program ini, Terimakasih ',mtWarning,[mbOK],0);
    Application.Terminate;
  end;
  //ActLoginExecute(Sender);
  S_01_pelayanan:=0;
  S_saran:=0;
end;

procedure TFUtama.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((ssAlt in Shift)and (Key=VK_F4)) then
  key:=0;
end;

procedure TFUtama.ile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TFUtama.Image4Click(Sender: TObject);
begin
  if S_01_pelayanan=0 then
  begin
    F_01_pelayanan:=TF_01_pelayanan.Create(Self);
    S_01_pelayanan:=1;
  end
  else
  if S_01_pelayanan=1 then
  begin
    F_01_pelayanan.Show;
  end;
end;

procedure TFUtama.Image5Click(Sender: TObject);
begin
if S_saran=0 then
  begin
    F_saran:=TF_saran.Create(self);
    S_saran:=1;
  end
  else
  if S_saran=1 then
  begin
    F_saran.Show;
  end;
end;

procedure TFUtama.MM_01_PeriodeClick(Sender: TObject);
begin
  if S_01_Pelayanan_Periode=0 then
  begin
    F_01_Pelayanan_Periode:=TF_01_Pelayanan_Periode.Create(Self);
    S_01_Pelayanan_Periode:=1;
  end
  else
  if S_01_Pelayanan_Periode=1 then
  begin
    F_01_Pelayanan_Periode.Show;
  end;
end;

procedure TFUtama.MM_GantiPasswordClick(Sender: TObject);
begin
  ActGantiPasswordExecute(Sender);
end;

procedure TFUtama.N12Survey1Click(Sender: TObject);
begin
if S_saran=0 then
  begin
    F_saran:=TF_saran.Create(self);
    S_saran:=1;
  end
  else
  if S_saran=1 then
  begin
    F_saran.Show;
  end;
end;

procedure TFUtama.KeluarAplikasi1Click(Sender: TObject);
begin
  ActKeluarExecute(Sender);
end;

procedure TFUtama.Label23Click(Sender: TObject);
begin
//hpp next , edit fktur
end;

procedure TFUtama.Login1Click(Sender: TObject);
begin
  ActLoginExecute(Sender);
end;

procedure TFUtama.LoginProgrammer1Click(Sender: TObject);
begin
  ActLoginExecute(Sender);
  FLogin.edtnama.Text:='Yomi';
  FLogin.edtpass.Text:='siska';
  FLogin.btnloginClick(Sender);
end;

procedure TFUtama.Logout1Click(Sender: TObject);
begin
  ActLogoutExecute(Sender);
  //ActLoginExecute(Sender);
end;

procedure TFUtama.PCloseFChild;
var
  I:integer;
begin
  for i:= 0 to MdiChildCount - 1 do
  begin
    MDIChildren[i].Close;
  end;
end;

procedure TFUtama.PenilaianPelayanan2Click(Sender: TObject);
begin
  if S_01_pelayanan=0 then
  begin
    F_01_pelayanan:=TF_01_pelayanan.Create(Self);
    S_01_pelayanan:=1;
  end
  else
  if S_01_pelayanan=1 then
  begin
    F_01_pelayanan.Show;
  end;
end;

procedure TFUtama.ReConnect1Click(Sender: TObject);
begin
  DM.ZConnection2.Connected:=False;
  DM.ZConnection2.Connected:=True;
end;

procedure TFUtama.saranbtnClick(Sender: TObject);
begin
if S_01_pelayanan=0 then
  begin
    F_01_pelayanan:=TF_01_pelayanan.Create(Self);
    S_01_pelayanan:=1;
  end
  else
  if S_01_pelayanan=1 then
  begin
    F_01_pelayanan.Show;
  end;
end;

procedure TFUtama.Timer1Timer(Sender: TObject);
begin
  lblWaktu.Caption:=FormatDateTime('dddd, dd - MMMM - yyyy',Now)+ '       ('+FormatDateTime('hh:mm:ss',Now)+')' ;
end;

procedure TFUtama.Timer2Timer(Sender: TObject);
begin
  lblGerak.Left:=lblGerak.Left+3;
  if lblGerak.Left>=PnlGerak.Width then
  begin
    lblGerak.Left:=0-lblGerak.Width;
  end;
end;

procedure TFUtama.Timer3Timer(Sender: TObject);
begin
  lblGerak2.Left:=lblGerak2.Left+3;
  if lblGerak2.Left>=PnlGerak.Width then
  begin
    lblGerak2.Left:=0-lblGerak2.Width;
  end;
end;

procedure TFUtama.Version1Click(Sender: TObject);
begin

  MessageDlg('Software Licensed For  : Balai Penyidikan dan Pengujian Veteriner '+#13#10+
             '(V.2.0.0 Build : 2 November 2017)'+#13#10+
             '(Revisi 2.0)'+#13#10+
             'Departemen Teknokreator Himpunan Mahasiswa Elektro dan Informatika ITERA'+#13#10+
             '====================================='+#13#10+
             'Software Licensed For  : Balai Penyidikan dan Pengujian Veteriner '+#13#10+
             '(V.1.6.2 Build :28 Agustus 2016)'+#13#10+
             '(Revisi 1.0)'+#13#10+
             'CP : Yomi Afrinaldo, S.Kom., M.T.I. (0853 7739 0979)',mtInformation,[mbOK],0);
end;

end.
