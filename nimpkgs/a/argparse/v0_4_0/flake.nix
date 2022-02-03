{
  description = ''WIP strongly-typed argument parser with sub command support'';
  inputs.src-argparse-v0_4_0.flake = false;
  inputs.src-argparse-v0_4_0.type = "github";
  inputs.src-argparse-v0_4_0.owner = "iffy";
  inputs.src-argparse-v0_4_0.repo = "nim-argparse";
  inputs.src-argparse-v0_4_0.ref = "refs/tags/v0.4.0";
  
  outputs = { self, nixpkgs, src-argparse-v0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-argparse-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-argparse-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}