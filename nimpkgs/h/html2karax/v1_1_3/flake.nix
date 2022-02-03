{
  description = ''Converts html to karax.'';
  inputs.src-html2karax-v1_1_3.flake = false;
  inputs.src-html2karax-v1_1_3.type = "github";
  inputs.src-html2karax-v1_1_3.owner = "nim-lang-cn";
  inputs.src-html2karax-v1_1_3.repo = "html2karax";
  inputs.src-html2karax-v1_1_3.ref = "refs/tags/v1.1.3";
  
  outputs = { self, nixpkgs, src-html2karax-v1_1_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-html2karax-v1_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-html2karax-v1_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}