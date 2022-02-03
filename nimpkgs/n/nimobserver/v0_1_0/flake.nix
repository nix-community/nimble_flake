{
  description = ''An implementation of the observer pattern'';
  inputs.src-nimobserver-v0_1_0.flake = false;
  inputs.src-nimobserver-v0_1_0.type = "github";
  inputs.src-nimobserver-v0_1_0.owner = "Tangdongle";
  inputs.src-nimobserver-v0_1_0.repo = "nimobserver";
  inputs.src-nimobserver-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-nimobserver-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimobserver-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimobserver-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}