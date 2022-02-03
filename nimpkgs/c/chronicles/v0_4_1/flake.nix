{
  description = ''A crafty implementation of structured logging for Nim'';
  inputs.src-chronicles-v0_4_1.flake = false;
  inputs.src-chronicles-v0_4_1.type = "github";
  inputs.src-chronicles-v0_4_1.owner = "status-im";
  inputs.src-chronicles-v0_4_1.repo = "nim-chronicles";
  inputs.src-chronicles-v0_4_1.ref = "refs/tags/v0.4.1";
  
  outputs = { self, nixpkgs, src-chronicles-v0_4_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-chronicles-v0_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-chronicles-v0_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}