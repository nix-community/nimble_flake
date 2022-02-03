{
  description = ''make-like for Nim. Describe your builds as tasks!'';
  inputs.src-nake-master.flake = false;
  inputs.src-nake-master.type = "github";
  inputs.src-nake-master.owner = "fowlmouth";
  inputs.src-nake-master.repo = "nake";
  inputs.src-nake-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-nake-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nake-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nake-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}