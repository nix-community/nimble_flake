{
  description = ''Bindings for Simple and Fast Multimedia Library (through CSFML)'';
  inputs.src-csfml-master.flake = false;
  inputs.src-csfml-master.type = "github";
  inputs.src-csfml-master.owner = "oprypin";
  inputs.src-csfml-master.repo = "nim-csfml";
  inputs.src-csfml-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-csfml-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-csfml-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-csfml-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}