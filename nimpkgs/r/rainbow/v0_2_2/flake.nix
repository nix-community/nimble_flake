{
  description = ''256 colors for shell'';
  inputs.src-rainbow-v0_2_2.flake = false;
  inputs.src-rainbow-v0_2_2.type = "github";
  inputs.src-rainbow-v0_2_2.owner = "Willyboar";
  inputs.src-rainbow-v0_2_2.repo = "rainbow";
  inputs.src-rainbow-v0_2_2.ref = "refs/tags/v0.2.2";
  
  outputs = { self, nixpkgs, src-rainbow-v0_2_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rainbow-v0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rainbow-v0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}