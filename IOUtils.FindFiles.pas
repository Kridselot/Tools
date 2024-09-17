unit IOUtils.FindFiles;

interface

uses
  System.Generics.Collections,
  System.SysUtils
  ;

type
  TFileFinder = Class
  private
    FPath: string;
    FExtension: string;
    procedure SetExtension(const Value: string);
    procedure SetPath(const Value: string);
  public
    procedure Search(var aQueue: TQueue<TSearchRec>);
    property Path: string read FPath write SetPath;
    property Extension: string read FExtension write SetExtension;
  End;

implementation


{ TFileFinder }

procedure TFileFinder.Search(var aQueue: TQueue<TSearchRec>);
begin

end;

procedure TFileFinder.SetExtension(const Value: string);
begin
  FExtension := Value;
end;

procedure TFileFinder.SetPath(const Value: string);
begin
  FPath := Value;
end;

end.
