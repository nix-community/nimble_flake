{
  description = ''DataFrame API enabling fast out-of-core data analytics'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."nimdata-master".type = "github";
  inputs."nimdata-master".owner = "riinr";
  inputs."nimdata-master".repo = "flake-nimble";
  inputs."nimdata-master".ref = "flake-pinning";
  inputs."nimdata-master".dir = "nimpkgs/n/nimdata/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}
