{
  description = ''256 colors for shell'';
  inputs.src-rainbow-v0_2_0.flake = false;
  inputs.src-rainbow-v0_2_0.type = "github";
  inputs.src-rainbow-v0_2_0.owner = "Willyboar";
  inputs.src-rainbow-v0_2_0.repo = "rainbow";
  inputs.src-rainbow-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, src-rainbow-v0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rainbow-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rainbow-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}