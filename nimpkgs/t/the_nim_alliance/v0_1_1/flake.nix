{
  description = ''A Nim wrapper for TheBlueAlliance'';
  inputs.src-the_nim_alliance-v0_1_1.flake = false;
  inputs.src-the_nim_alliance-v0_1_1.type = "github";
  inputs.src-the_nim_alliance-v0_1_1.owner = "tervay";
  inputs.src-the_nim_alliance-v0_1_1.repo = "the-nim-alliance";
  inputs.src-the_nim_alliance-v0_1_1.ref = "refs/tags/v0.1.1";
  
  outputs = { self, nixpkgs, src-the_nim_alliance-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-the_nim_alliance-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-the_nim_alliance-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}