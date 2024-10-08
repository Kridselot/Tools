unit TestIOUtils.Path;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, System.SysUtils, System.Generics.Collections
  , System.IOUtils, Ioutils.Path
  ;

type
  // Test methods for class TFileFinder

  TestTPathHelper = class(TTestCase)
  public
  published
    procedure FileName;
    procedure CorrectFileName;
    procedure FilePath;
    procedure CorrectPathName;
  end;

implementation


procedure TestTPathHelper.CorrectFileName;
begin

end;

procedure TestTPathHelper.CorrectPathName;
begin

end;

procedure TestTPathHelper.FileName;
begin
  // TODO: Setup method call parameters
  CheckEqualsString('ABBA', TPath.MakeValidFileName('ABBA'));
  CheckEqualsString('abba', TPath.MakeValidFileName('abba'));
  CheckEqualsString('A.B_B#A-A', TPath.MakeValidFileName('A.B_B#A-A'));
end;

procedure TestTPathHelper.FilePath;
begin
  CheckEqualsString('ABBAABBAAB', TPath.MakeValidFileName('A"B*B/A:A<B>B?A\A|B'));
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPathHelper.Suite);
end.

