{
  description = ''Build Postgres extensions in Nim.'';
  inputs.src-pgxcrown-v0_1_26.flake = false;
  inputs.src-pgxcrown-v0_1_26.type = "github";
  inputs.src-pgxcrown-v0_1_26.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_26.repo = "pgxcrown";
  inputs.src-pgxcrown-v0_1_26.ref = "refs/tags/v0.1.26";
  
  outputs = { self, nixpkgs, src-pgxcrown-v0_1_26, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pgxcrown-v0_1_26;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pgxcrown-v0_1_26"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}