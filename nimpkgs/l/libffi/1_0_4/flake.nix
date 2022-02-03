{
  description = ''libffi wrapper for Nim.'';
  inputs.src-libffi-1_0_4.flake = false;
  inputs.src-libffi-1_0_4.type = "github";
  inputs.src-libffi-1_0_4.owner = "Araq";
  inputs.src-libffi-1_0_4.repo = "libffi";
  inputs.src-libffi-1_0_4.ref = "refs/tags/1.0.4";
  
  outputs = { self, nixpkgs, src-libffi-1_0_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-libffi-1_0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-libffi-1_0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}