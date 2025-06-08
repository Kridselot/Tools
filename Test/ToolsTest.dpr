program ToolsTest;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  System.IOUtils.Path in '..\System.IOUtils.Path.pas',
  System.IOUtils.FindFiles in '..\System.IOUtils.FindFiles.pas',
  TestIOUtils.FindFiles in 'TestIOUtils.FindFiles.pas',
  TestIOUtils.Path in 'TestIOUtils.Path.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

