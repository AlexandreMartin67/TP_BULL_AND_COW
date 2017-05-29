program TP_ALGO_F1C_ALEXANDRE_MARTIN_BULLS_AND_COWS;

uses
  Vcl.Forms,
  bulls_and_cows in 'bulls_and_cows.pas' {bull_and_cow};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tbull_and_cow, bull_and_cow);
  Application.Run;
end.
