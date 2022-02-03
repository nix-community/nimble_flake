{
  description = ''Argument parser'';
  inputs.src-nap-1_2_0.flake = false;
  inputs.src-nap-1_2_0.type = "github";
  inputs.src-nap-1_2_0.owner = "madprops";
  inputs.src-nap-1_2_0.repo = "nap";
  inputs.src-nap-1_2_0.ref = "refs/tags/1.2.0";
  
  outputs = { self, nixpkgs, src-nap-1_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nap-1_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nap-1_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}