{
  description = ''Calendars, Timestamps and Timezones utilities.'';
  inputs.src-chrono-0_3_0.flake = false;
  inputs.src-chrono-0_3_0.type = "github";
  inputs.src-chrono-0_3_0.owner = "treeform";
  inputs.src-chrono-0_3_0.repo = "chrono";
  inputs.src-chrono-0_3_0.ref = "refs/tags/0.3.0";
  
  outputs = { self, nixpkgs, src-chrono-0_3_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-chrono-0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-chrono-0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}