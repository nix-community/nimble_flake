{
  description = ''A nim flavor of pytorch'';
  inputs.src-torch-v0_1_21.flake = false;
  inputs.src-torch-v0_1_21.type = "github";
  inputs.src-torch-v0_1_21.owner = "fragcolor-xyz";
  inputs.src-torch-v0_1_21.repo = "nimtorch";
  inputs.src-torch-v0_1_21.ref = "refs/tags/v0.1.21";
  
  outputs = { self, nixpkgs, src-torch-v0_1_21, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-torch-v0_1_21;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-torch-v0_1_21"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}