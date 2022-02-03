{
  description = ''Create SVG-files with QR-codes from strings.'';
  inputs.src-qr-v1_3_1.flake = false;
  inputs.src-qr-v1_3_1.type = "github";
  inputs.src-qr-v1_3_1.owner = "ThomasTJdev";
  inputs.src-qr-v1_3_1.repo = "nim_qr";
  inputs.src-qr-v1_3_1.ref = "refs/tags/v1.3.1";
  
  outputs = { self, nixpkgs, src-qr-v1_3_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-qr-v1_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-qr-v1_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}