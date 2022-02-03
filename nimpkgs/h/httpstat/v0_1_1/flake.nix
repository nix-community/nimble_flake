{
  description = ''curl statistics made simple '';
  inputs.src-httpstat-v0_1_1.flake = false;
  inputs.src-httpstat-v0_1_1.type = "github";
  inputs.src-httpstat-v0_1_1.owner = "ucpr";
  inputs.src-httpstat-v0_1_1.repo = "httpstat";
  inputs.src-httpstat-v0_1_1.ref = "refs/tags/v0.1.1";
  
  outputs = { self, nixpkgs, src-httpstat-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-httpstat-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-httpstat-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}