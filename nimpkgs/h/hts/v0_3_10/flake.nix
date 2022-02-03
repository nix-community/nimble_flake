{
  description = ''htslib wrapper for nim'';
  inputs.src-hts-v0_3_10.flake = false;
  inputs.src-hts-v0_3_10.type = "github";
  inputs.src-hts-v0_3_10.owner = "brentp";
  inputs.src-hts-v0_3_10.repo = "hts-nim";
  inputs.src-hts-v0_3_10.ref = "refs/tags/v0.3.10";
  
  outputs = { self, nixpkgs, src-hts-v0_3_10, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hts-v0_3_10;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-hts-v0_3_10"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}