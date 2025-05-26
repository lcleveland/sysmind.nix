dir:

let
  inherit (builtins) readDir attrNames filter match concatLists;

  collectImports = relPath:
    let
      fullPath = dir + (if relPath == "" then "" else "/${relPath}");
      entries = readDir fullPath;

      processEntry = name:
        let
          subRelPath = if relPath == "" then name else "${relPath}/${name}";
          entryType = entries.${name};
        in
        if entryType == "directory" then
          collectImports subRelPath
        else if entryType == "regular" && match ".*\\.nix" name != null then
          [ (import (dir + "/${subRelPath}")) ]
        else
          [ ];
    in
    concatLists (map processEntry (attrNames entries));

in
collectImports ""
