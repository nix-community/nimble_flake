{
  description = ''Argument parser'';
  inputs.src-nap-1_4_1.flake = false;
  inputs.src-nap-1_4_1.type = "github";
  inputs.src-nap-1_4_1.owner = "madprops";
  inputs.src-nap-1_4_1.repo = "nap";
  inputs.src-nap-1_4_1.ref = "refs/tags/1.4.1";
  
  outputs = { self, nixpkgs, src-nap-1_4_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nap-1_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nap-1_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}