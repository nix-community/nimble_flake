{
  description = ''High level GObject-Introspection based GTK3 bindings'';
  inputs.src-gintro-v0_8_3.flake = false;
  inputs.src-gintro-v0_8_3.type = "github";
  inputs.src-gintro-v0_8_3.owner = "stefansalewski";
  inputs.src-gintro-v0_8_3.repo = "gintro";
  inputs.src-gintro-v0_8_3.ref = "refs/tags/v0.8.3";
  
  outputs = { self, nixpkgs, src-gintro-v0_8_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gintro-v0_8_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-gintro-v0_8_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}