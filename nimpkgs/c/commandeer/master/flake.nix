{
  description = ''Provides a small command line parsing DSL (domain specific language)'';
  inputs.src-commandeer-master.flake = false;
  inputs.src-commandeer-master.type = "github";
  inputs.src-commandeer-master.owner = "fenekku";
  inputs.src-commandeer-master.repo = "commandeer";
  inputs.src-commandeer-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-commandeer-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-commandeer-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-commandeer-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}