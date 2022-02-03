{
  description = ''An alternative time library'';
  inputs.src-timestamp-0_4_0.flake = false;
  inputs.src-timestamp-0_4_0.type = "github";
  inputs.src-timestamp-0_4_0.owner = "jackhftang";
  inputs.src-timestamp-0_4_0.repo = "timestamp.nim";
  inputs.src-timestamp-0_4_0.ref = "refs/tags/0.4.0";
  
  outputs = { self, nixpkgs, src-timestamp-0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-timestamp-0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-timestamp-0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}