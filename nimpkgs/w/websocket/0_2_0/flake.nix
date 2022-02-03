{
  description = ''websockets for nim'';
  inputs.src-websocket-0_2_0.flake = false;
  inputs.src-websocket-0_2_0.type = "github";
  inputs.src-websocket-0_2_0.owner = "niv";
  inputs.src-websocket-0_2_0.repo = "websocket.nim";
  inputs.src-websocket-0_2_0.ref = "refs/tags/0.2.0";
  
  outputs = { self, nixpkgs, src-websocket-0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-websocket-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-websocket-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}