{
  description = ''A dataframe library with a dplyr like API'';
  inputs.src-datamancer-v0_1_7.flake = false;
  inputs.src-datamancer-v0_1_7.type = "github";
  inputs.src-datamancer-v0_1_7.owner = "SciNim";
  inputs.src-datamancer-v0_1_7.repo = "datamancer";
  inputs.src-datamancer-v0_1_7.ref = "refs/tags/v0.1.7";
  
  
  inputs."https://github.com/vindaar/seqmath".url = "path:../../../h/https://github.com/vindaar/seqmath";
  inputs."https://github.com/vindaar/seqmath".type = "github";
  inputs."https://github.com/vindaar/seqmath".owner = "riinr";
  inputs."https://github.com/vindaar/seqmath".repo = "flake-nimble";
  inputs."https://github.com/vindaar/seqmath".ref = "flake-pinning";
  inputs."https://github.com/vindaar/seqmath".dir = "nimpkgs/h/https://github.com/vindaar/seqmath";

  
  inputs."arraymancer".url = "path:../../../a/arraymancer";
  inputs."arraymancer".type = "github";
  inputs."arraymancer".owner = "riinr";
  inputs."arraymancer".repo = "flake-nimble";
  inputs."arraymancer".ref = "flake-pinning";
  inputs."arraymancer".dir = "nimpkgs/a/arraymancer";

  outputs = { self, nixpkgs, src-datamancer-v0_1_7, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-datamancer-v0_1_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-datamancer-v0_1_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}