{
  description = ''Timezone library compatible with the standard library. '';
  inputs.src-timezones-v0_4_2.flake = false;
  inputs.src-timezones-v0_4_2.type = "github";
  inputs.src-timezones-v0_4_2.owner = "GULPF";
  inputs.src-timezones-v0_4_2.repo = "timezones";
  inputs.src-timezones-v0_4_2.ref = "refs/tags/v0.4.2";
  
  outputs = { self, nixpkgs, src-timezones-v0_4_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-timezones-v0_4_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-timezones-v0_4_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}