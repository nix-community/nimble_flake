{
  description = ''ffmpeg.nim is the Nim binding for FFMpeg(4.3.2).'';
  inputs.src-ffmpeg-0_3_11.flake = false;
  inputs.src-ffmpeg-0_3_11.type = "github";
  inputs.src-ffmpeg-0_3_11.owner = "momeemt";
  inputs.src-ffmpeg-0_3_11.repo = "ffmpeg.nim";
  inputs.src-ffmpeg-0_3_11.ref = "refs/tags/0.3.11";
  
  outputs = { self, nixpkgs, src-ffmpeg-0_3_11, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ffmpeg-0_3_11;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-ffmpeg-0_3_11"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}