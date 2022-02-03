{
  description = ''Build Postgres extensions in Nim.'';
  inputs.src-pgxcrown-v0_1_14.flake = false;
  inputs.src-pgxcrown-v0_1_14.type = "github";
  inputs.src-pgxcrown-v0_1_14.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_14.repo = "pgxcrown";
  inputs.src-pgxcrown-v0_1_14.ref = "refs/tags/v0.1.14";
  
  outputs = { self, nixpkgs, src-pgxcrown-v0_1_14, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pgxcrown-v0_1_14;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pgxcrown-v0_1_14"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}