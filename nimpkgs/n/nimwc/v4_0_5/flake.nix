{
  description = ''A website management tool. Run the file and access your webpage.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimwc-v4_0_5.flake = false;
  inputs.src-nimwc-v4_0_5.type = "github";
  inputs.src-nimwc-v4_0_5.owner = "ThomasTJdev";
  inputs.src-nimwc-v4_0_5.repo = "nim_websitecreator";
  inputs.src-nimwc-v4_0_5.ref = "refs/tags/v4.0.5";
  inputs.src-nimwc-v4_0_5.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."jester".type = "github";
  inputs."jester".owner = "riinr";
  inputs."jester".repo = "flake-nimble";
  inputs."jester".ref = "flake-pinning";
  inputs."jester".dir = "nimpkgs/j/jester";
  inputs."jester".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jester".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."recaptcha".type = "github";
  inputs."recaptcha".owner = "riinr";
  inputs."recaptcha".repo = "flake-nimble";
  inputs."recaptcha".ref = "flake-pinning";
  inputs."recaptcha".dir = "nimpkgs/r/recaptcha";
  inputs."recaptcha".inputs.nixpkgs.follows = "nixpkgs";
  inputs."recaptcha".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."bcrypt".type = "github";
  inputs."bcrypt".owner = "riinr";
  inputs."bcrypt".repo = "flake-nimble";
  inputs."bcrypt".ref = "flake-pinning";
  inputs."bcrypt".dir = "nimpkgs/b/bcrypt";
  inputs."bcrypt".inputs.nixpkgs.follows = "nixpkgs";
  inputs."bcrypt".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimwc-v4_0_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimwc-v4_0_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimwc-v4_0_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}