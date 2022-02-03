{
  description = ''A new awesome nimble package'';
  inputs.src-redismodules-v0_1_0.flake = false;
  inputs.src-redismodules-v0_1_0.type = "github";
  inputs.src-redismodules-v0_1_0.owner = "luisacosta828";
  inputs.src-redismodules-v0_1_0.repo = "redismodules";
  inputs.src-redismodules-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-redismodules-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-redismodules-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-redismodules-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}