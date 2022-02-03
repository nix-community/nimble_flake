{
  description = ''Color and utilities library for linux terminal.'';
  inputs.src-nimcx-master.flake = false;
  inputs.src-nimcx-master.type = "github";
  inputs.src-nimcx-master.owner = "qqtop";
  inputs.src-nimcx-master.repo = "nimcx";
  inputs.src-nimcx-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-nimcx-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimcx-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimcx-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}