{
  description = ''Useful synchronization primitives'';
  inputs.src-sync-master.flake = false;
  inputs.src-sync-master.type = "github";
  inputs.src-sync-master.owner = "planetis-m";
  inputs.src-sync-master.repo = "sync";
  inputs.src-sync-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-sync-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sync-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-sync-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}