{
  description = ''dialect of Markdown in pure Nim with focus on HTML output'';
  inputs.src-marggers-v0_2_0.flake = false;
  inputs.src-marggers-v0_2_0.type = "github";
  inputs.src-marggers-v0_2_0.owner = "metagn";
  inputs.src-marggers-v0_2_0.repo = "marggers";
  inputs.src-marggers-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, src-marggers-v0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-marggers-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-marggers-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}