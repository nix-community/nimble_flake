{
  description = ''PEG (Parsing Expression Grammars) string matching library for Nim'';
  inputs.src-npeg-0_4_0.flake = false;
  inputs.src-npeg-0_4_0.type = "github";
  inputs.src-npeg-0_4_0.owner = "zevv";
  inputs.src-npeg-0_4_0.repo = "npeg";
  inputs.src-npeg-0_4_0.ref = "refs/tags/0.4.0";
  
  outputs = { self, nixpkgs, src-npeg-0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-npeg-0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-npeg-0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}