{
  description = ''A tiny static file web server.'';
  inputs.src-nimhttpd-v1_0_1.flake = false;
  inputs.src-nimhttpd-v1_0_1.type = "github";
  inputs.src-nimhttpd-v1_0_1.owner = "h3rald";
  inputs.src-nimhttpd-v1_0_1.repo = "nimhttpd";
  inputs.src-nimhttpd-v1_0_1.ref = "refs/tags/v1.0.1";
  
  outputs = { self, nixpkgs, src-nimhttpd-v1_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimhttpd-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimhttpd-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}