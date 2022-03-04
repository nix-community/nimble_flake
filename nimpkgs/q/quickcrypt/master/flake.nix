{
  description = ''A library for quickly and easily encrypting strings & files. User-friendly and highly compatible.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-quickcrypt-master.flake = false;
  inputs.src-quickcrypt-master.type = "github";
  inputs.src-quickcrypt-master.owner = "theAkito";
  inputs.src-quickcrypt-master.repo = "nim-quickcrypt";
  inputs.src-quickcrypt-master.ref = "refs/heads/master";
  inputs.src-quickcrypt-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimaes".type = "github";
  inputs."nimaes".owner = "riinr";
  inputs."nimaes".repo = "flake-nimble";
  inputs."nimaes".ref = "flake-pinning";
  inputs."nimaes".dir = "nimpkgs/n/nimaes";
  inputs."nimaes".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimaes".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."neoid".type = "github";
  inputs."neoid".owner = "riinr";
  inputs."neoid".repo = "flake-nimble";
  inputs."neoid".ref = "flake-pinning";
  inputs."neoid".dir = "nimpkgs/n/neoid";
  inputs."neoid".inputs.nixpkgs.follows = "nixpkgs";
  inputs."neoid".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-quickcrypt-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-quickcrypt-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-quickcrypt-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}