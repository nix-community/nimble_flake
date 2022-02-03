{
  description = ''a wrapper for the QBittorrent WebAPI for NIM.'';
  inputs.src-nimQBittorrent-v0_1_0.flake = false;
  inputs.src-nimQBittorrent-v0_1_0.type = "github";
  inputs.src-nimQBittorrent-v0_1_0.owner = "faulander";
  inputs.src-nimQBittorrent-v0_1_0.repo = "nimQBittorrent";
  inputs.src-nimQBittorrent-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-nimQBittorrent-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimQBittorrent-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimQBittorrent-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}