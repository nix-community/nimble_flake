{
  description = ''Porting some Python / Kotlin features to Nim'';
  inputs.src-pykot-v0_1_3.flake = false;
  inputs.src-pykot-v0_1_3.type = "github";
  inputs.src-pykot-v0_1_3.owner = "jabbalaci";
  inputs.src-pykot-v0_1_3.repo = "nimpykot";
  inputs.src-pykot-v0_1_3.ref = "refs/tags/v0.1.3";
  
  outputs = { self, nixpkgs, src-pykot-v0_1_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pykot-v0_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pykot-v0_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}