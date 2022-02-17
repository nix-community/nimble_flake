{
  description = ''A simple RPN calculator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-ad-0_6_4.flake = false;
  inputs.src-ad-0_6_4.type = "github";
  inputs.src-ad-0_6_4.owner = "subsetpark";
  inputs.src-ad-0_6_4.repo = "ad";
  inputs.src-ad-0_6_4.ref = "refs/tags/0.6.4";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-ad-0_6_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ad-0_6_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-ad-0_6_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}