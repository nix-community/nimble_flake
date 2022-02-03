{
  description = ''Last.FM API bindings'';
  inputs.src-lastfm-0_8_2.flake = false;
  inputs.src-lastfm-0_8_2.type = "gitlab";
  inputs.src-lastfm-0_8_2.owner = "tandy1000";
  inputs.src-lastfm-0_8_2.repo = "lastfm-nim";
  inputs.src-lastfm-0_8_2.ref = "refs/tags/0.8.2";
  
  outputs = { self, nixpkgs, src-lastfm-0_8_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lastfm-0_8_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-lastfm-0_8_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}