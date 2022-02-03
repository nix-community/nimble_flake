{
  description = ''IPC interface to sway (or i3) compositors'';
  inputs.src-swayipc-3_1_7.flake = false;
  inputs.src-swayipc-3_1_7.type = "github";
  inputs.src-swayipc-3_1_7.owner = "disruptek";
  inputs.src-swayipc-3_1_7.repo = "swayipc";
  inputs.src-swayipc-3_1_7.ref = "refs/tags/3.1.7";
  
  
  inputs."nesm".url = "path:../../../n/nesm";
  inputs."nesm".type = "github";
  inputs."nesm".owner = "riinr";
  inputs."nesm".repo = "flake-nimble";
  inputs."nesm".ref = "flake-pinning";
  inputs."nesm".dir = "nimpkgs/n/nesm";

  
  inputs."cligen".url = "path:../../../c/cligen";
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  outputs = { self, nixpkgs, src-swayipc-3_1_7, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-swayipc-3_1_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-swayipc-3_1_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}