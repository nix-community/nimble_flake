{
  description = ''Pseudo-random number generation library inspired by Python'';
  inputs.src-random-v0_5_3.flake = false;
  inputs.src-random-v0_5_3.type = "github";
  inputs.src-random-v0_5_3.owner = "oprypin";
  inputs.src-random-v0_5_3.repo = "nim-random";
  inputs.src-random-v0_5_3.ref = "refs/tags/v0.5.3";
  
  outputs = { self, nixpkgs, src-random-v0_5_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-random-v0_5_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-random-v0_5_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}