unit IOUtils.Path;

interface

uses
  System.IOUtils, System.SysUtils
  ;

type
  TPathHelper = record helper for TPath
    class function MakeValidPath(aPath: string): string; inline; static;
    class function MakeValidFileName(aName: string): string; inline; static;
  end;

implementation


{ TPathHelper }

class function TPathHelper.MakeValidFileName(aName: string): string;
var
  Chars: TCharArray;
begin
  if not TPath.HasValidFileNameChars(aName, False) then
    exit(aName);

  Chars := TPath.GetInvalidFileNameChars;
  Result := aName;
  for var i: integer := Low(Chars) to High(Chars) do
  begin
    StringReplace(Result, Chars[i], '', [rfReplaceAll]);
  end;
end;

class function TPathHelper.MakeValidPath(aPath: string): string;
var
  Chars: TCharArray;
begin
  if not TPath.HasValidPathChars(aPath, false) then
    exit(aPath);

  Chars := TPath.GetInvalidPathChars;
  Result := aPath;
  for var i: integer := Low(Chars) to High(Chars) do
  begin
    StringReplace(Result, Chars[i], '', [rfReplaceAll]);
  end;
end;

end.
