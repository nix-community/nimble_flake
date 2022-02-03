{
  description = ''Various collections and utilities'';
  inputs.src-collections-v0_5_0.flake = false;
  inputs.src-collections-v0_5_0.type = "github";
  inputs.src-collections-v0_5_0.owner = "zielmicha";
  inputs.src-collections-v0_5_0.repo = "collections.nim";
  inputs.src-collections-v0_5_0.ref = "refs/tags/v0.5.0";
  
  outputs = { self, nixpkgs, src-collections-v0_5_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-collections-v0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-collections-v0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}