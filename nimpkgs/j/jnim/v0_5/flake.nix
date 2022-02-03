{
  description = ''Nim - Java bridge'';
  inputs.src-jnim-v0_5.flake = false;
  inputs.src-jnim-v0_5.type = "github";
  inputs.src-jnim-v0_5.owner = "yglukhov";
  inputs.src-jnim-v0_5.repo = "jnim";
  inputs.src-jnim-v0_5.ref = "refs/tags/v0.5";
  
  outputs = { self, nixpkgs, src-jnim-v0_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jnim-v0_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-jnim-v0_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}