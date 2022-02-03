{
  description = ''Library for splitting a string into shell words'';
  inputs.src-shlex-master.flake = false;
  inputs.src-shlex-master.type = "github";
  inputs.src-shlex-master.owner = "SolitudeSF";
  inputs.src-shlex-master.repo = "shlex";
  inputs.src-shlex-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-shlex-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shlex-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-shlex-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}