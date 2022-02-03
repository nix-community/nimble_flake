{
  description = ''Netty is a reliable UDP connection for games.'';
  inputs.src-netty-v0_1_0.flake = false;
  inputs.src-netty-v0_1_0.type = "github";
  inputs.src-netty-v0_1_0.owner = "treeform";
  inputs.src-netty-v0_1_0.repo = "netty";
  inputs.src-netty-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-netty-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-netty-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-netty-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}