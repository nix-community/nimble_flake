{
  description = ''Sparsets for Nim'';
  inputs.src-sparseset-v0_5_0.flake = false;
  inputs.src-sparseset-v0_5_0.type = "github";
  inputs.src-sparseset-v0_5_0.owner = "planetis-m";
  inputs.src-sparseset-v0_5_0.repo = "sparseset";
  inputs.src-sparseset-v0_5_0.ref = "refs/tags/v0.5.0";
  
  outputs = { self, nixpkgs, src-sparseset-v0_5_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sparseset-v0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-sparseset-v0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}