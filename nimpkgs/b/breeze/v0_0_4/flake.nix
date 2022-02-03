{
  description = ''A dsl for writing macros in Nim'';
  inputs.src-breeze-v0_0_4.flake = false;
  inputs.src-breeze-v0_0_4.type = "github";
  inputs.src-breeze-v0_0_4.owner = "alehander42";
  inputs.src-breeze-v0_0_4.repo = "breeze";
  inputs.src-breeze-v0_0_4.ref = "refs/tags/v0.0.4";
  
  outputs = { self, nixpkgs, src-breeze-v0_0_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-breeze-v0_0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-breeze-v0_0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}