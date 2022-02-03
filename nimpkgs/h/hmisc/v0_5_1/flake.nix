{
  description = ''Collection of helper utilities'';
  inputs.src-hmisc-v0_5_1.flake = false;
  inputs.src-hmisc-v0_5_1.type = "github";
  inputs.src-hmisc-v0_5_1.owner = "haxscramper";
  inputs.src-hmisc-v0_5_1.repo = "hmisc";
  inputs.src-hmisc-v0_5_1.ref = "refs/tags/v0.5.1";
  
  outputs = { self, nixpkgs, src-hmisc-v0_5_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hmisc-v0_5_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-hmisc-v0_5_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}