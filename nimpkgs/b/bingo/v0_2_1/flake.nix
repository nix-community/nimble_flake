{
  description = ''Binary serialization framework'';
  inputs.src-bingo-v0_2_1.flake = false;
  inputs.src-bingo-v0_2_1.type = "github";
  inputs.src-bingo-v0_2_1.owner = "planetis-m";
  inputs.src-bingo-v0_2_1.repo = "bingo";
  inputs.src-bingo-v0_2_1.ref = "refs/tags/v0.2.1";
  
  outputs = { self, nixpkgs, src-bingo-v0_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bingo-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-bingo-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}