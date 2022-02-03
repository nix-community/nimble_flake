{
  description = ''websockets for nim'';
  inputs.src-websocket-0_3_3.flake = false;
  inputs.src-websocket-0_3_3.type = "github";
  inputs.src-websocket-0_3_3.owner = "niv";
  inputs.src-websocket-0_3_3.repo = "websocket.nim";
  inputs.src-websocket-0_3_3.ref = "refs/tags/0.3.3";
  
  outputs = { self, nixpkgs, src-websocket-0_3_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-websocket-0_3_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-websocket-0_3_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}