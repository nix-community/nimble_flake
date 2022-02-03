{
  description = ''A nice and icy ZSH prompt in Nim'';
  inputs.src-nicy-v2_5_1.flake = false;
  inputs.src-nicy-v2_5_1.type = "github";
  inputs.src-nicy-v2_5_1.owner = "icyphox";
  inputs.src-nicy-v2_5_1.repo = "nicy";
  inputs.src-nicy-v2_5_1.ref = "refs/tags/v2.5.1";
  
  outputs = { self, nixpkgs, src-nicy-v2_5_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nicy-v2_5_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nicy-v2_5_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}