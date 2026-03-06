program ServerHorse.Tests;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  DUnitX.TestFramework,
  DUnitX.Loggers.Console,
  DUnitX.Loggers.XML.NUnit,
  SanityTests in 'SanityTests.pas',
  UserServiceTests in 'UserServiceTests.pas',
  ClienteServiceValidationTests in 'ClienteServiceValidationTests.pas';

var
  runner: ITestRunner;
  results: IRunResults;
begin
  try
    TDUnitX.CheckCommandLine;

    runner := TDUnitX.CreateRunner;
    runner.UseRTTI := True;

    runner.AddLogger(TDUnitXConsoleLogger.Create(True));
    runner.AddLogger(TDUnitXXMLNUnitFileLogger.Create);

    results := runner.Execute;

    if not results.AllPassed then
      ExitCode := EXIT_ERRORS;

    Writeln;
    Writeln('Press ENTER to leave...');
    Readln;

  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      Readln;
    end;
  end;
end.

