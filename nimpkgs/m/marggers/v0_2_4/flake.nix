{
  description = ''dialect of Markdown in pure Nim with focus on HTML output'';
  inputs.src-marggers-v0_2_4.flake = false;
  inputs.src-marggers-v0_2_4.type = "github";
  inputs.src-marggers-v0_2_4.owner = "metagn";
  inputs.src-marggers-v0_2_4.repo = "marggers";
  inputs.src-marggers-v0_2_4.ref = "refs/tags/v0.2.4";
  
  outputs = { self, nixpkgs, src-marggers-v0_2_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-marggers-v0_2_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-marggers-v0_2_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}