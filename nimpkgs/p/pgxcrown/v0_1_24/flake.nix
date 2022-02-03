{
  description = ''Build Postgres extensions in Nim.'';
  inputs.src-pgxcrown-v0_1_24.flake = false;
  inputs.src-pgxcrown-v0_1_24.type = "github";
  inputs.src-pgxcrown-v0_1_24.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_24.repo = "pgxcrown";
  inputs.src-pgxcrown-v0_1_24.ref = "refs/tags/v0.1.24";
  
  outputs = { self, nixpkgs, src-pgxcrown-v0_1_24, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pgxcrown-v0_1_24;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pgxcrown-v0_1_24"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}