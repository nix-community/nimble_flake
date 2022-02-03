{
  description = ''High level GObject-Introspection based GTK3 bindings'';
  inputs.src-gintro-v0_8_7.flake = false;
  inputs.src-gintro-v0_8_7.type = "github";
  inputs.src-gintro-v0_8_7.owner = "stefansalewski";
  inputs.src-gintro-v0_8_7.repo = "gintro";
  inputs.src-gintro-v0_8_7.ref = "refs/tags/v0.8.7";
  
  outputs = { self, nixpkgs, src-gintro-v0_8_7, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gintro-v0_8_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-gintro-v0_8_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}