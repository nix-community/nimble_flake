{
  description = ''Wrapper-less C/C++ interop for Nim'';
  inputs.src-nimline-0_1_1.flake = false;
  inputs.src-nimline-0_1_1.type = "github";
  inputs.src-nimline-0_1_1.owner = "fragcolor-xyz";
  inputs.src-nimline-0_1_1.repo = "nimline";
  inputs.src-nimline-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-nimline-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimline-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimline-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}