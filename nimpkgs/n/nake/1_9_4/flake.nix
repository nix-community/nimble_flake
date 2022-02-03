{
  description = ''make-like for Nim. Describe your builds as tasks!'';
  inputs.src-nake-1_9_4.flake = false;
  inputs.src-nake-1_9_4.type = "github";
  inputs.src-nake-1_9_4.owner = "fowlmouth";
  inputs.src-nake-1_9_4.repo = "nake";
  inputs.src-nake-1_9_4.ref = "refs/tags/1.9.4";
  
  outputs = { self, nixpkgs, src-nake-1_9_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nake-1_9_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nake-1_9_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}