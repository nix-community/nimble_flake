{
  description = ''A mod manager for TF2'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-tf2plug-master.flake = false;
  inputs.src-tf2plug-master.type = "gitlab";
  inputs.src-tf2plug-master.owner = "waylon531";
  inputs.src-tf2plug-master.repo = "tf2plug";
  inputs.src-tf2plug-master.ref = "refs/heads/master";
  inputs.src-tf2plug-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";
  inputs."docopt".inputs.nixpkgs.follows = "nixpkgs";
  inputs."docopt".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-tf2plug-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-tf2plug-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-tf2plug-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}