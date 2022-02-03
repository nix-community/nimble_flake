{
  description = ''A tiny static file web server.'';
  inputs.src-nimhttpd-v1_0_2.flake = false;
  inputs.src-nimhttpd-v1_0_2.type = "github";
  inputs.src-nimhttpd-v1_0_2.owner = "h3rald";
  inputs.src-nimhttpd-v1_0_2.repo = "nimhttpd";
  inputs.src-nimhttpd-v1_0_2.ref = "refs/tags/v1.0.2";
  
  outputs = { self, nixpkgs, src-nimhttpd-v1_0_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimhttpd-v1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimhttpd-v1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}