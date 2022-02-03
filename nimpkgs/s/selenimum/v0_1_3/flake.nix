{
  description = ''WebDriver for Selenium(selenium-hub).'';
  inputs.src-selenimum-v0_1_3.flake = false;
  inputs.src-selenimum-v0_1_3.type = "github";
  inputs.src-selenimum-v0_1_3.owner = "myamyu";
  inputs.src-selenimum-v0_1_3.repo = "selenimum";
  inputs.src-selenimum-v0_1_3.ref = "refs/tags/v0.1.3";
  
  outputs = { self, nixpkgs, src-selenimum-v0_1_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-selenimum-v0_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-selenimum-v0_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}