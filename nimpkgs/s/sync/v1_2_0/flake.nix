{
  description = ''Useful synchronization primitives'';
  inputs.src-sync-v1_2_0.flake = false;
  inputs.src-sync-v1_2_0.type = "github";
  inputs.src-sync-v1_2_0.owner = "planetis-m";
  inputs.src-sync-v1_2_0.repo = "sync";
  inputs.src-sync-v1_2_0.ref = "refs/tags/v1.2.0";
  
  outputs = { self, nixpkgs, src-sync-v1_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sync-v1_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-sync-v1_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}