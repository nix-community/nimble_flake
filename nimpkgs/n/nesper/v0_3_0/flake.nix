{
  description = ''Nim wrappers for ESP-IDF (ESP32)'';
  inputs.src-nesper-v0_3_0.flake = false;
  inputs.src-nesper-v0_3_0.type = "github";
  inputs.src-nesper-v0_3_0.owner = "elcritch";
  inputs.src-nesper-v0_3_0.repo = "nesper";
  inputs.src-nesper-v0_3_0.ref = "refs/tags/v0.3.0";
  
  outputs = { self, nixpkgs, src-nesper-v0_3_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nesper-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nesper-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}