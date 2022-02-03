{
  description = ''subhook wrapper'';
  inputs.src-subhook-0_1_1.flake = false;
  inputs.src-subhook-0_1_1.type = "github";
  inputs.src-subhook-0_1_1.owner = "ba0f3";
  inputs.src-subhook-0_1_1.repo = "subhook.nim";
  inputs.src-subhook-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-subhook-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-subhook-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-subhook-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}