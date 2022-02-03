{
  description = ''mccache package: in-memory caching'';
  inputs.src-mccache-v0_1_1.flake = false;
  inputs.src-mccache-v0_1_1.type = "github";
  inputs.src-mccache-v0_1_1.owner = "abbeymart";
  inputs.src-mccache-v0_1_1.repo = "mccache-nim";
  inputs.src-mccache-v0_1_1.ref = "refs/tags/v0.1.1";
  
  outputs = { self, nixpkgs, src-mccache-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mccache-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-mccache-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}