{
  description = ''A nimble package which provides user-defined types, procedures, etc...'';
  inputs.src-oolib-0_2_1.flake = false;
  inputs.src-oolib-0_2_1.type = "github";
  inputs.src-oolib-0_2_1.owner = "Glasses-Neo";
  inputs.src-oolib-0_2_1.repo = "OOlib";
  inputs.src-oolib-0_2_1.ref = "refs/tags/0.2.1";
  
  outputs = { self, nixpkgs, src-oolib-0_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-oolib-0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-oolib-0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}