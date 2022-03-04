{
  description = ''parse datetime from various resources'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-datetime_parse-master.flake = false;
  inputs.src-datetime_parse-master.type = "github";
  inputs.src-datetime_parse-master.owner = "bung87";
  inputs.src-datetime_parse-master.repo = "datetime_parse";
  inputs.src-datetime_parse-master.ref = "refs/heads/master";
  inputs.src-datetime_parse-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."timezones".type = "github";
  inputs."timezones".owner = "riinr";
  inputs."timezones".repo = "flake-nimble";
  inputs."timezones".ref = "flake-pinning";
  inputs."timezones".dir = "nimpkgs/t/timezones";
  inputs."timezones".inputs.nixpkgs.follows = "nixpkgs";
  inputs."timezones".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-datetime_parse-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-datetime_parse-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-datetime_parse-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}