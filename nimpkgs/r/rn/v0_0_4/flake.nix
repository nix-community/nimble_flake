{
  description = ''minimal, performant mass file renamer'';
  inputs.src-rn-v0_0_4.flake = false;
  inputs.src-rn-v0_0_4.type = "github";
  inputs.src-rn-v0_0_4.owner = "xioren";
  inputs.src-rn-v0_0_4.repo = "rn";
  inputs.src-rn-v0_0_4.ref = "refs/tags/v0.0.4";
  
  outputs = { self, nixpkgs, src-rn-v0_0_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rn-v0_0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rn-v0_0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}