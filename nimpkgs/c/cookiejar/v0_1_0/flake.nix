{
  description = ''HTTP Cookies for Nim.'';
  inputs.src-cookiejar-v0_1_0.flake = false;
  inputs.src-cookiejar-v0_1_0.type = "github";
  inputs.src-cookiejar-v0_1_0.owner = "planety";
  inputs.src-cookiejar-v0_1_0.repo = "cookiejar";
  inputs.src-cookiejar-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-cookiejar-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cookiejar-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cookiejar-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}