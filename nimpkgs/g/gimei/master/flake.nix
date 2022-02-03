{
  description = ''random Japanese name and address generator'';
  inputs.src-gimei-master.flake = false;
  inputs.src-gimei-master.type = "github";
  inputs.src-gimei-master.owner = "mkanenobu";
  inputs.src-gimei-master.repo = "nim-gimei";
  inputs.src-gimei-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-gimei-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gimei-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-gimei-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}