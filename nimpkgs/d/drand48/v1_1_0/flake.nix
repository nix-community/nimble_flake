{
  description = ''Nim implementation of the standard unix drand48 pseudo random number generator'';
  inputs.src-drand48-v1_1_0.flake = false;
  inputs.src-drand48-v1_1_0.type = "github";
  inputs.src-drand48-v1_1_0.owner = "JeffersonLab";
  inputs.src-drand48-v1_1_0.repo = "drand48";
  inputs.src-drand48-v1_1_0.ref = "refs/tags/v1.1.0";
  
  outputs = { self, nixpkgs, src-drand48-v1_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-drand48-v1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-drand48-v1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}