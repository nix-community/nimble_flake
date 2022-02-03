{
  description = ''A library to provide abstract access to various archives.'';
  inputs.src-physfs-master.flake = false;
  inputs.src-physfs-master.type = "github";
  inputs.src-physfs-master.owner = "fowlmouth";
  inputs.src-physfs-master.repo = "physfs";
  inputs.src-physfs-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-physfs-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-physfs-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-physfs-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}