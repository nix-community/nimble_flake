{
  description = ''Pseudo-random number generation library inspired by Python'';
  inputs.src-random-v0_2_4.flake = false;
  inputs.src-random-v0_2_4.type = "github";
  inputs.src-random-v0_2_4.owner = "oprypin";
  inputs.src-random-v0_2_4.repo = "nim-random";
  inputs.src-random-v0_2_4.ref = "refs/tags/v0.2.4";
  
  outputs = { self, nixpkgs, src-random-v0_2_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-random-v0_2_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-random-v0_2_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}