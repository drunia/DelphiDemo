program DemoProject;

uses
  Forms,
  Intro in 'Intro.pas' {IntroForm},
  Main in 'Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TIntroForm, IntroForm);
  Application.Run;
end.
