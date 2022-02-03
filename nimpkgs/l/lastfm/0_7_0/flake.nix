{
  description = ''Last.FM API bindings'';
  inputs.src-lastfm-0_7_0.flake = false;
  inputs.src-lastfm-0_7_0.type = "gitlab";
  inputs.src-lastfm-0_7_0.owner = "tandy1000";
  inputs.src-lastfm-0_7_0.repo = "lastfm-nim";
  inputs.src-lastfm-0_7_0.ref = "refs/tags/0.7.0";
  
  outputs = { self, nixpkgs, src-lastfm-0_7_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lastfm-0_7_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-lastfm-0_7_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}