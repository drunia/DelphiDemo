unit Intro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TIntroForm = class(TForm)
    IntroImage: TImage;
    IntroLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IntroImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OnCloseTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IntroForm: TIntroForm;
  CloseTimer: TTimer;

implementation

uses Main;

{$R *.dfm}


procedure TIntroForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  pMainForm: Pointer;
begin
  // ����������� �������� ������
  FreeAndNil(CloseTimer);

  // ��������� �����-�����,
  // ������ ������ ������� ����� �� MainForm � ���������� ��
  Application.CreateForm(TMainForm, MainForm);
  pMainForm := @Application.MainForm;
  Pointer(pMainForm^) := MainForm;
  MainForm.Show;

  // ����� ����� ������� ����� ��������� ������ �����
  Application.MainFormOnTaskBar := False;
  Application.MainFormOnTaskBar := True;

  // ������� ����� �� �����
  Action := caFree;
end;

procedure TIntroForm.FormShow(Sender: TObject);
begin
  CloseTimer := TTimer.Create(Self);
  CloseTimer.Interval := 5000; //5 Seconds
  CloseTimer.OnTimer := IntroForm.OnCloseTimer;
  CloseTimer.Enabled := True;
end;

procedure TIntroForm.IntroImageClick(Sender: TObject);
begin
  Close;
end;

procedure TIntroForm.OnCloseTimer(Sender: TObject);
begin
  Close;
end;

end.
