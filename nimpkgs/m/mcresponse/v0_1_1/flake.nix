{
  description = ''mConnect Standardised Response Package'';
  inputs.src-mcresponse-v0_1_1.flake = false;
  inputs.src-mcresponse-v0_1_1.type = "github";
  inputs.src-mcresponse-v0_1_1.owner = "abbeymart";
  inputs.src-mcresponse-v0_1_1.repo = "mcresponse-nim";
  inputs.src-mcresponse-v0_1_1.ref = "refs/tags/v0.1.1";
  
  outputs = { self, nixpkgs, src-mcresponse-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mcresponse-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-mcresponse-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}