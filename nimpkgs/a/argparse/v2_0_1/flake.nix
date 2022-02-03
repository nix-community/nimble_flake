{
  description = ''WIP strongly-typed argument parser with sub command support'';
  inputs.src-argparse-v2_0_1.flake = false;
  inputs.src-argparse-v2_0_1.type = "github";
  inputs.src-argparse-v2_0_1.owner = "iffy";
  inputs.src-argparse-v2_0_1.repo = "nim-argparse";
  inputs.src-argparse-v2_0_1.ref = "refs/tags/v2.0.1";
  
  outputs = { self, nixpkgs, src-argparse-v2_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-argparse-v2_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-argparse-v2_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}