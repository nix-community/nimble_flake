{
  description = ''Get information about colors and convert them in the command line'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-clr-v0_1_2.flake = false;
  inputs.src-clr-v0_1_2.type = "github";
  inputs.src-clr-v0_1_2.owner = "Calinou";
  inputs.src-clr-v0_1_2.repo = "clr";
  inputs.src-clr-v0_1_2.ref = "refs/tags/v0.1.2";
  inputs.src-clr-v0_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."chroma".type = "github";
  inputs."chroma".owner = "riinr";
  inputs."chroma".repo = "flake-nimble";
  inputs."chroma".ref = "flake-pinning";
  inputs."chroma".dir = "nimpkgs/c/chroma";
  inputs."chroma".inputs.nixpkgs.follows = "nixpkgs";
  inputs."chroma".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";
  inputs."docopt".inputs.nixpkgs.follows = "nixpkgs";
  inputs."docopt".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-clr-v0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-clr-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-clr-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}