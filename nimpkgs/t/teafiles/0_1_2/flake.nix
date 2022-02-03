{
  description = ''TeaFiles provide fast read/write access to time series data'';
  inputs.src-teafiles-0_1_2.flake = false;
  inputs.src-teafiles-0_1_2.type = "github";
  inputs.src-teafiles-0_1_2.owner = "andreaferretti";
  inputs.src-teafiles-0_1_2.repo = "nim-teafiles";
  inputs.src-teafiles-0_1_2.ref = "refs/tags/0.1.2";
  
  outputs = { self, nixpkgs, src-teafiles-0_1_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-teafiles-0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-teafiles-0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}