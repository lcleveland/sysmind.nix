{ dir }:

let
  inherit (builtins) readDir attrNames filter match concatLists;

  collectImports = dirPath:
    let
      entries = readDir dirPath;
    in
    concatLists (map
      (name:
        let
          fullPath = dirPath + "/${name}";
          entryType = entries.${name};
        in
        if entryType == "directory" then
          collectImports fullPath
        else if entryType == "regular" && match ".*\\.nix" name != null then
          [ (import fullPath) ]
        else
          [ ]
      )
      (attrNames entries));

in
collectImports dir
