{
  description = ''make-like for Nim. Describe your builds as tasks!'';
  inputs.src-nake-v1_2.flake = false;
  inputs.src-nake-v1_2.type = "github";
  inputs.src-nake-v1_2.owner = "fowlmouth";
  inputs.src-nake-v1_2.repo = "nake";
  inputs.src-nake-v1_2.ref = "refs/tags/v1.2";
  
  outputs = { self, nixpkgs, src-nake-v1_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nake-v1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nake-v1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}