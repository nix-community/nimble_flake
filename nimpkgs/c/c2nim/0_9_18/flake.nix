{
  description = ''c2nim is a tool to translate Ansi C code to Nim.'';
  inputs.src-c2nim-0_9_18.flake = false;
  inputs.src-c2nim-0_9_18.type = "github";
  inputs.src-c2nim-0_9_18.owner = "nim-lang";
  inputs.src-c2nim-0_9_18.repo = "c2nim";
  inputs.src-c2nim-0_9_18.ref = "refs/tags/0.9.18";
  
  outputs = { self, nixpkgs, src-c2nim-0_9_18, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-c2nim-0_9_18;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-c2nim-0_9_18"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}