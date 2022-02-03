{
  description = ''Converts html to karax.'';
  inputs.src-html2karax-v1_1_1.flake = false;
  inputs.src-html2karax-v1_1_1.type = "github";
  inputs.src-html2karax-v1_1_1.owner = "nim-lang-cn";
  inputs.src-html2karax-v1_1_1.repo = "html2karax";
  inputs.src-html2karax-v1_1_1.ref = "refs/tags/v1.1.1";
  
  outputs = { self, nixpkgs, src-html2karax-v1_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-html2karax-v1_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-html2karax-v1_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}