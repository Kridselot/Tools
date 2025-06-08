unit System.IOUtils.Path;

interface

uses
  System.IOUtils, System.SysUtils
  ;

type
  /// <summary>
  /// Stellt Hilfsfunktionen für Dateioperationen zur Verfügung.
  /// </summary>
  TPathHelper = record helper for TPath
    /// <summary>
    /// löscht für Pfade ungültige Zeichen; ABER behält widcard ausdrücke die gültig sind bei.
    /// </summary>
    /// <param name="aPath">Der Pfad des Verzeichnisses.</param>
    /// <returns>
    /// gültiger Dateipfad.
    /// </returns>
    class function MakeValidPath(aPath: string): string; static;
    /// <summary>
    /// löscht für Dateinamen und Pfade ungültige Zeichen; Entfernt Wildcards
    /// </summary>
    /// <param name="aName">Der Pfad des Verzeichnisses.</param>
    /// <returns>
    /// gültiger Dateiname.
    /// </returns>
    class function MakeValidFileName(aName: string): string; static;
  end;

implementation


{ TPathHelper }

class function TPathHelper.MakeValidFileName(aName: string): string;
var
  Chars: TCharArray;
begin
  if TPath.HasValidFileNameChars(aName, False) then
    exit(aName);

  Chars := TPath.GetInvalidFileNameChars;
  Result := aName;
  for var i: integer := Low(Chars) to High(Chars) do
  begin
    Result := StringReplace(Result, Chars[i], '', [rfReplaceAll]);
  end;
end;

class function TPathHelper.MakeValidPath(aPath: string): string;
var
  Chars: TCharArray;
begin
  if TPath.HasValidPathChars(aPath, False) then
    exit(aPath);

  Chars := TPath.GetInvalidPathChars;
  Result := aPath;
  for var i: integer := Low(Chars) to High(Chars) do
  begin
    Result := StringReplace(Result, Chars[i], '', [rfReplaceAll]);
  end;
end;

end.
