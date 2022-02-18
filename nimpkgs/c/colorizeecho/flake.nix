{
  description = ''colorizeEcho is a package which colorize echo message on Windows command prompt.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."colorizeecho-main".type = "github";
  inputs."colorizeecho-main".owner = "riinr";
  inputs."colorizeecho-main".repo = "flake-nimble";
  inputs."colorizeecho-main".ref = "flake-pinning";
  inputs."colorizeecho-main".dir = "nimpkgs/c/colorizeecho/main";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}
