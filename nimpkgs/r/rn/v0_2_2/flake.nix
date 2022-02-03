{
  description = ''minimal, performant mass file renamer'';
  inputs.src-rn-v0_2_2.flake = false;
  inputs.src-rn-v0_2_2.type = "github";
  inputs.src-rn-v0_2_2.owner = "xioren";
  inputs.src-rn-v0_2_2.repo = "rn";
  inputs.src-rn-v0_2_2.ref = "refs/tags/v0.2.2";
  
  outputs = { self, nixpkgs, src-rn-v0_2_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rn-v0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rn-v0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}