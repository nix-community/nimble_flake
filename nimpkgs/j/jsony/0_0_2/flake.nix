{
  description = ''A loose, direct to object json parser with hooks.'';
  inputs.src-jsony-0_0_2.flake = false;
  inputs.src-jsony-0_0_2.type = "github";
  inputs.src-jsony-0_0_2.owner = "treeform";
  inputs.src-jsony-0_0_2.repo = "jsony";
  inputs.src-jsony-0_0_2.ref = "refs/tags/0.0.2";
  
  outputs = { self, nixpkgs, src-jsony-0_0_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jsony-0_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-jsony-0_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}