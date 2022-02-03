{
  description = ''Metaprogramming tools for Nim'';
  inputs.src-metatools-v0_1_0.flake = false;
  inputs.src-metatools-v0_1_0.type = "github";
  inputs.src-metatools-v0_1_0.owner = "jxy";
  inputs.src-metatools-v0_1_0.repo = "metatools";
  inputs.src-metatools-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-metatools-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-metatools-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-metatools-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}