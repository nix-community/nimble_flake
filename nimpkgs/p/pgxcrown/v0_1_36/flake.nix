{
  description = ''Build Postgres extensions in Nim.'';
  inputs.src-pgxcrown-v0_1_36.flake = false;
  inputs.src-pgxcrown-v0_1_36.type = "github";
  inputs.src-pgxcrown-v0_1_36.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_36.repo = "pgxcrown";
  inputs.src-pgxcrown-v0_1_36.ref = "refs/tags/v0.1.36";
  
  outputs = { self, nixpkgs, src-pgxcrown-v0_1_36, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pgxcrown-v0_1_36;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pgxcrown-v0_1_36"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}