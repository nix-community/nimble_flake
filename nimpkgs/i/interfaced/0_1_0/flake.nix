{
  description = ''Go-like interfaces'';
  inputs.src-interfaced-0_1_0.flake = false;
  inputs.src-interfaced-0_1_0.type = "github";
  inputs.src-interfaced-0_1_0.owner = "andreaferretti";
  inputs.src-interfaced-0_1_0.repo = "interfaced";
  inputs.src-interfaced-0_1_0.ref = "refs/tags/0.1.0";
  
  outputs = { self, nixpkgs, src-interfaced-0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-interfaced-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-interfaced-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}