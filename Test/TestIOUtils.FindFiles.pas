﻿unit TestIOUtils.FindFiles;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, System.IOUtils, System.IOUtils.FindFiles, System.SysUtils, System.Generics.Collections
  ;

type
  // Test methods for class TFileFinder

  TestTFileFinder = class(TTestCase)
  strict private
    FFileFinder: TFileFinder;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSearch;
  end;

implementation

procedure TestTFileFinder.SetUp;
begin
  FFileFinder := TFileFinder.Create;
end;

procedure TestTFileFinder.TearDown;
begin
  FFileFinder.Free;
  FFileFinder := nil;
end;

procedure TestTFileFinder.TestSearch;
var
  Queue: TThreadedQueue<TSearchRec>;
begin
  Queue := TThreadedQueue<TSearchRec>.Create;
  try
    FFileFinder.Path := TPath.GetFullPath(TPath.GetDirectoryName(ParamStr(0)) + '\..\..\..');
    FFileFinder.Extension := '*';
    FFileFinder.Search(Queue);
  finally
    Queue.Free;
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFileFinder.Suite);
end.

