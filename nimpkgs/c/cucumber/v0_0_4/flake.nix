{
  description = ''implements the cucumber BDD framework in the nim language'';
  inputs.src-cucumber-v0_0_4.flake = false;
  inputs.src-cucumber-v0_0_4.type = "github";
  inputs.src-cucumber-v0_0_4.owner = "shaunc";
  inputs.src-cucumber-v0_0_4.repo = "cucumber_nim";
  inputs.src-cucumber-v0_0_4.ref = "refs/tags/v0.0.4";
  
  
  inputs."nre".url = "path:../../../n/nre";
  inputs."nre".type = "github";
  inputs."nre".owner = "riinr";
  inputs."nre".repo = "flake-nimble";
  inputs."nre".ref = "flake-pinning";
  inputs."nre".dir = "nimpkgs/n/nre";

  
  inputs."commandeer".url = "path:../../../c/commandeer";
  inputs."commandeer".type = "github";
  inputs."commandeer".owner = "riinr";
  inputs."commandeer".repo = "flake-nimble";
  inputs."commandeer".ref = "flake-pinning";
  inputs."commandeer".dir = "nimpkgs/c/commandeer";

  outputs = { self, nixpkgs, src-cucumber-v0_0_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cucumber-v0_0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cucumber-v0_0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}