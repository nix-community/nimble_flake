{
  description = ''A library to retrieve the list of commonly used licenses from the SPDX License List.'';
  inputs.src-spdx_licenses-v1_0_0.flake = false;
  inputs.src-spdx_licenses-v1_0_0.type = "github";
  inputs.src-spdx_licenses-v1_0_0.owner = "euantorano";
  inputs.src-spdx_licenses-v1_0_0.repo = "spdx_licenses.nim";
  inputs.src-spdx_licenses-v1_0_0.ref = "refs/tags/v1.0.0";
  
  outputs = { self, nixpkgs, src-spdx_licenses-v1_0_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-spdx_licenses-v1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-spdx_licenses-v1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}