{
  description = ''A brainfuck interpreter & compiler implemented in nim'';
  inputs.src-nimfcuk-0_1_1.flake = false;
  inputs.src-nimfcuk-0_1_1.type = "github";
  inputs.src-nimfcuk-0_1_1.owner = "2KAbhishek";
  inputs.src-nimfcuk-0_1_1.repo = "nimfcuk";
  inputs.src-nimfcuk-0_1_1.ref = "refs/tags/0.1.1";
  
  
  inputs."docopt".url = "path:../../../d/docopt";
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";

  outputs = { self, nixpkgs, src-nimfcuk-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfcuk-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimfcuk-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}