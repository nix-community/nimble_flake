{
  description = ''Elegant optional types'';
  inputs.src-questionable-0_1_0.flake = false;
  inputs.src-questionable-0_1_0.type = "github";
  inputs.src-questionable-0_1_0.owner = "markspanbroek";
  inputs.src-questionable-0_1_0.repo = "questionable";
  inputs.src-questionable-0_1_0.ref = "refs/tags/0.1.0";
  
  outputs = { self, nixpkgs, src-questionable-0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-questionable-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-questionable-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}