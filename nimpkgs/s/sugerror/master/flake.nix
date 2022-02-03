{
  description = ''Terse and composable error handling.'';
  inputs.src-sugerror-master.flake = false;
  inputs.src-sugerror-master.type = "github";
  inputs.src-sugerror-master.owner = "quelklef";
  inputs.src-sugerror-master.repo = "nim-sugerror";
  inputs.src-sugerror-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-sugerror-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sugerror-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-sugerror-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}