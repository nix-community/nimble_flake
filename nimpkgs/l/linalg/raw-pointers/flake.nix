{
  description = ''Linear algebra for Nim'';
  inputs.src-linalg-raw-pointers.flake = false;
  inputs.src-linalg-raw-pointers.type = "github";
  inputs.src-linalg-raw-pointers.owner = "andreaferretti";
  inputs.src-linalg-raw-pointers.repo = "linear-algebra";
  inputs.src-linalg-raw-pointers.ref = "refs/tags/raw-pointers";
  
  outputs = { self, nixpkgs, src-linalg-raw-pointers, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-linalg-raw-pointers;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-linalg-raw-pointers"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}