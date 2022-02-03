{
  description = ''Executable for finding information about programs in PATH'';
  inputs.src-about-v0_1_0.flake = false;
  inputs.src-about-v0_1_0.type = "github";
  inputs.src-about-v0_1_0.owner = "aleandros";
  inputs.src-about-v0_1_0.repo = "about";
  inputs.src-about-v0_1_0.ref = "refs/tags/v0.1.0";
  
  
  inputs."docopt".url = "path:../../../d/docopt";
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";

  outputs = { self, nixpkgs, src-about-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-about-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-about-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}