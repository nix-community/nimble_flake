{
  description = ''Integrator framework for Molecular Dynamic evolutions'';
  inputs.src-mdevolve-v0_1_1.flake = false;
  inputs.src-mdevolve-v0_1_1.type = "github";
  inputs.src-mdevolve-v0_1_1.owner = "jxy";
  inputs.src-mdevolve-v0_1_1.repo = "MDevolve";
  inputs.src-mdevolve-v0_1_1.ref = "refs/tags/v0.1.1";
  
  outputs = { self, nixpkgs, src-mdevolve-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mdevolve-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-mdevolve-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}