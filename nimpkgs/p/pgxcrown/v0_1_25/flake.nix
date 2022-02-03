{
  description = ''Build Postgres extensions in Nim.'';
  inputs.src-pgxcrown-v0_1_25.flake = false;
  inputs.src-pgxcrown-v0_1_25.type = "github";
  inputs.src-pgxcrown-v0_1_25.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_25.repo = "pgxcrown";
  inputs.src-pgxcrown-v0_1_25.ref = "refs/tags/v0.1.25";
  
  outputs = { self, nixpkgs, src-pgxcrown-v0_1_25, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pgxcrown-v0_1_25;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pgxcrown-v0_1_25"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}