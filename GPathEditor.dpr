program GPathEditor;

uses
  Vcl.Forms, WinApi.Windows,
  fmMain in 'fmMain.pas' {Form1};

{$R *.res}

begin
  SetProcessDPIAware;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
