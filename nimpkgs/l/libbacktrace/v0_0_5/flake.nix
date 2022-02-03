{
  description = ''Nim wrapper for libbacktrace'';
  inputs.src-libbacktrace-v0_0_5.flake = false;
  inputs.src-libbacktrace-v0_0_5.type = "github";
  inputs.src-libbacktrace-v0_0_5.owner = "status-im";
  inputs.src-libbacktrace-v0_0_5.repo = "nim-libbacktrace";
  inputs.src-libbacktrace-v0_0_5.ref = "refs/tags/v0.0.5";
  
  outputs = { self, nixpkgs, src-libbacktrace-v0_0_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-libbacktrace-v0_0_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-libbacktrace-v0_0_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}