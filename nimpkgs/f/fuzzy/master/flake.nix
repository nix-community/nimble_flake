{
  description = ''Pure nim fuzzy search implementation. Supports substrings etc'';
  inputs.src-fuzzy-master.flake = false;
  inputs.src-fuzzy-master.type = "github";
  inputs.src-fuzzy-master.owner = "pigmej";
  inputs.src-fuzzy-master.repo = "fuzzy";
  inputs.src-fuzzy-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-fuzzy-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-fuzzy-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-fuzzy-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}