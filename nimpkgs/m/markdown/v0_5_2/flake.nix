{
  description = ''A Beautiful Markdown Parser in the Nim World.'';
  inputs.src-markdown-v0_5_2.flake = false;
  inputs.src-markdown-v0_5_2.type = "github";
  inputs.src-markdown-v0_5_2.owner = "soasme";
  inputs.src-markdown-v0_5_2.repo = "nim-markdown";
  inputs.src-markdown-v0_5_2.ref = "refs/tags/v0.5.2";
  
  outputs = { self, nixpkgs, src-markdown-v0_5_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-markdown-v0_5_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-markdown-v0_5_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}