{
  description = ''A bridge between R and Nim'';
  inputs.src-rnim-master.flake = false;
  inputs.src-rnim-master.type = "github";
  inputs.src-rnim-master.owner = "SciNim";
  inputs.src-rnim-master.repo = "rnim";
  inputs.src-rnim-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-rnim-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rnim-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rnim-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}