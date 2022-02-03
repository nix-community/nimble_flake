{
  description = ''High level GObject-Introspection based GTK3 bindings'';
  inputs.src-gintro-v0_5_5.flake = false;
  inputs.src-gintro-v0_5_5.type = "github";
  inputs.src-gintro-v0_5_5.owner = "stefansalewski";
  inputs.src-gintro-v0_5_5.repo = "gintro";
  inputs.src-gintro-v0_5_5.ref = "refs/tags/v0.5.5";
  
  outputs = { self, nixpkgs, src-gintro-v0_5_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gintro-v0_5_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-gintro-v0_5_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}