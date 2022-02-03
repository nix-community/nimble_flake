{
  description = ''minimal, performant mass file renamer'';
  inputs.src-rn-v0_0_9.flake = false;
  inputs.src-rn-v0_0_9.type = "github";
  inputs.src-rn-v0_0_9.owner = "xioren";
  inputs.src-rn-v0_0_9.repo = "rn";
  inputs.src-rn-v0_0_9.ref = "refs/tags/v0.0.9";
  
  outputs = { self, nixpkgs, src-rn-v0_0_9, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rn-v0_0_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rn-v0_0_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}