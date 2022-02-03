{
  description = ''An alternative time library'';
  inputs.src-timestamp-0_4_1.flake = false;
  inputs.src-timestamp-0_4_1.type = "github";
  inputs.src-timestamp-0_4_1.owner = "jackhftang";
  inputs.src-timestamp-0_4_1.repo = "timestamp.nim";
  inputs.src-timestamp-0_4_1.ref = "refs/tags/0.4.1";
  
  outputs = { self, nixpkgs, src-timestamp-0_4_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-timestamp-0_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-timestamp-0_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}