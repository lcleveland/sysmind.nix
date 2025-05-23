dir:

let
  inherit (builtins) readDir attrNames filter match listToAttrs concatLists pathExists;
  collectNixFiles = relPath:
    let
      fullPath = dir + (if relPath == "" then "" else "/${relPath}");
      entries = readDir fullPath;

      processEntry = name:
        let
          subRelPath = if relPath == "" then name else "${relPath}/${name}";
          entryType = entries.${name};
        in
        if entryType == "directory" then
          collectNixFiles subRelPath
        else if entryType == "regular" && match ".*\\.nix" name != null then
          [{ name = subRelPath; value = import (dir + "/${subRelPath}"); }]
        else
          [ ];

    in
    concatLists (map processEntry (attrNames entries));
in
listToAttrs (collectNixFiles "")
