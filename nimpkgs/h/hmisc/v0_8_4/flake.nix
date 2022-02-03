{
  description = ''Collection of helper utilities'';
  inputs.src-hmisc-v0_8_4.flake = false;
  inputs.src-hmisc-v0_8_4.type = "github";
  inputs.src-hmisc-v0_8_4.owner = "haxscramper";
  inputs.src-hmisc-v0_8_4.repo = "hmisc";
  inputs.src-hmisc-v0_8_4.ref = "refs/tags/v0.8.4";
  
  outputs = { self, nixpkgs, src-hmisc-v0_8_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hmisc-v0_8_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-hmisc-v0_8_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}