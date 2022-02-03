{
  description = ''Read metadata from jpeg and tiff images.'';
  inputs.src-metar-v0_1_25.flake = false;
  inputs.src-metar-v0_1_25.type = "github";
  inputs.src-metar-v0_1_25.owner = "flenniken";
  inputs.src-metar-v0_1_25.repo = "metar";
  inputs.src-metar-v0_1_25.ref = "refs/tags/v0.1.25";
  
  outputs = { self, nixpkgs, src-metar-v0_1_25, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-metar-v0_1_25;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-metar-v0_1_25"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}