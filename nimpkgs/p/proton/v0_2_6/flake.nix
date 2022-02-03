{
  description = ''Proton template engine for xml and xhtml files'';
  inputs.src-proton-v0_2_6.flake = false;
  inputs.src-proton-v0_2_6.type = "github";
  inputs.src-proton-v0_2_6.owner = "jasonrbriggs";
  inputs.src-proton-v0_2_6.repo = "proton-nim";
  inputs.src-proton-v0_2_6.ref = "refs/tags/v0.2.6";
  
  outputs = { self, nixpkgs, src-proton-v0_2_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-proton-v0_2_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-proton-v0_2_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}