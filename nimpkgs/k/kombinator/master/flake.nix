{
  description = ''Kombinator is a tool to generate commands line from parameters combination from a config file.'';
  inputs.src-kombinator-master.flake = false;
  inputs.src-kombinator-master.type = "gitlab";
  inputs.src-kombinator-master.owner = "EchoPouet";
  inputs.src-kombinator-master.repo = "kombinator";
  inputs.src-kombinator-master.ref = "refs/heads/master";
  
  
  inputs."parsetoml".url = "path:../../../p/parsetoml";
  inputs."parsetoml".type = "github";
  inputs."parsetoml".owner = "riinr";
  inputs."parsetoml".repo = "flake-nimble";
  inputs."parsetoml".ref = "flake-pinning";
  inputs."parsetoml".dir = "nimpkgs/p/parsetoml";

  
  inputs."cligen".url = "path:../../../c/cligen";
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  
  inputs."suru".url = "path:../../../s/suru";
  inputs."suru".type = "github";
  inputs."suru".owner = "riinr";
  inputs."suru".repo = "flake-nimble";
  inputs."suru".ref = "flake-pinning";
  inputs."suru".dir = "nimpkgs/s/suru";

  outputs = { self, nixpkgs, src-kombinator-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-kombinator-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-kombinator-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}