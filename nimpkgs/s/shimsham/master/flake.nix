{
  description = ''Hashing/Digest collection in pure Nim'';
  inputs.src-ShimSham-master.flake = false;
  inputs.src-ShimSham-master.type = "github";
  inputs.src-ShimSham-master.owner = "apense";
  inputs.src-ShimSham-master.repo = "shimsham";
  inputs.src-ShimSham-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-shimsham-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shimsham-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-shimsham-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}