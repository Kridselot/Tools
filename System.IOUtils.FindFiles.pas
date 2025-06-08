unit System.IOUtils.FindFiles;

interface

uses
  System.Generics.Collections
  , System.SysUtils
  , System.IOUtils
  , System.IOUtils.Path
  , System.Types
  ;

type
  // später nu in Thread verwendbar, da er blockieren kann.
  TFileFinder = Class
  private
    FPath: string;
    FExtension: string;
    procedure SetExtension(const Value: string);
    procedure SetPath(const Value: string);
  public
    procedure Search(var aQueue: TThreadedQueue<TSearchRec>);
    property Path: string read FPath write SetPath;
    property Extension: string read FExtension write SetExtension;
  End;

implementation


{ TFileFinder }

procedure TFileFinder.Search(var aQueue: TThreadedQueue<TSearchRec>);
begin
  var Queue := aQueue;
  var Filter: TDirectory.TFilterPredicate :=
    function(const Path: string; const SearchRec: TSearchRec): Boolean
    begin
      Result := true;
      var PushResult: TWaitResult := Queue.PushItem(SearchRec);
      case PushResult of
        TWaitResult.wrSignaled: Result := true; // erfolgreich
        TWaitResult.wrTimeout:
          begin
            raise Exception.Create('TFileFinder.Search wrTimeout an Push. The Que should have infinite WaitTime for Push');
          end;
        TWaitResult.wrAbandoned: Result := false; // Abbruch und raus
      end;
    end;

  var Strings: TStringDynArray := TDirectory.GetFiles(Path, Extension, TSearchOption.soAllDirectories, Filter);
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
