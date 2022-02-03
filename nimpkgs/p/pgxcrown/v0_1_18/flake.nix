{
  description = ''Build Postgres extensions in Nim.'';
  inputs.src-pgxcrown-v0_1_18.flake = false;
  inputs.src-pgxcrown-v0_1_18.type = "github";
  inputs.src-pgxcrown-v0_1_18.owner = "luisacosta828";
  inputs.src-pgxcrown-v0_1_18.repo = "pgxcrown";
  inputs.src-pgxcrown-v0_1_18.ref = "refs/tags/v0.1.18";
  
  outputs = { self, nixpkgs, src-pgxcrown-v0_1_18, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pgxcrown-v0_1_18;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pgxcrown-v0_1_18"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}