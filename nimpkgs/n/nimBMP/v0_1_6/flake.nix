{
  description = ''BMP encoder and decoder'';
  inputs.src-nimBMP-v0_1_6.flake = false;
  inputs.src-nimBMP-v0_1_6.type = "github";
  inputs.src-nimBMP-v0_1_6.owner = "jangko";
  inputs.src-nimBMP-v0_1_6.repo = "nimBMP";
  inputs.src-nimBMP-v0_1_6.ref = "refs/tags/v0.1.6";
  
  outputs = { self, nixpkgs, src-nimBMP-v0_1_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimBMP-v0_1_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimBMP-v0_1_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}