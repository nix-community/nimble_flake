{
  description = ''A tool for managing a project's changelog'';
  inputs.src-changer-master.flake = false;
  inputs.src-changer-master.type = "github";
  inputs.src-changer-master.owner = "iffy";
  inputs.src-changer-master.repo = "changer";
  inputs.src-changer-master.ref = "refs/heads/master";
  
  
  inputs."argparse".url = "path:../../../a/argparse";
  inputs."argparse".type = "github";
  inputs."argparse".owner = "riinr";
  inputs."argparse".repo = "flake-nimble";
  inputs."argparse".ref = "flake-pinning";
  inputs."argparse".dir = "nimpkgs/a/argparse";

  
  inputs."regex".url = "path:../../../r/regex";
  inputs."regex".type = "github";
  inputs."regex".owner = "riinr";
  inputs."regex".repo = "flake-nimble";
  inputs."regex".ref = "flake-pinning";
  inputs."regex".dir = "nimpkgs/r/regex";

  
  inputs."parsetoml".url = "path:../../../p/parsetoml";
  inputs."parsetoml".type = "github";
  inputs."parsetoml".owner = "riinr";
  inputs."parsetoml".repo = "flake-nimble";
  inputs."parsetoml".ref = "flake-pinning";
  inputs."parsetoml".dir = "nimpkgs/p/parsetoml";

  outputs = { self, nixpkgs, src-changer-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-changer-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-changer-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}