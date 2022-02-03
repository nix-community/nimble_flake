{
  description = ''A tiny static file web server.'';
  inputs.src-static_server-v1_0_1.flake = false;
  inputs.src-static_server-v1_0_1.type = "github";
  inputs.src-static_server-v1_0_1.owner = "bung87";
  inputs.src-static_server-v1_0_1.repo = "nimhttpd";
  inputs.src-static_server-v1_0_1.ref = "refs/tags/v1.0.1";
  
  outputs = { self, nixpkgs, src-static_server-v1_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-static_server-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-static_server-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}