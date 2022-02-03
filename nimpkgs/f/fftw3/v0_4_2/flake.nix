{
  description = ''Bindings to the FFTW library'';
  inputs.src-fftw3-v0_4_2.flake = false;
  inputs.src-fftw3-v0_4_2.type = "github";
  inputs.src-fftw3-v0_4_2.owner = "SciNim";
  inputs.src-fftw3-v0_4_2.repo = "nimfftw3";
  inputs.src-fftw3-v0_4_2.ref = "refs/tags/v0.4.2";
  
  
  inputs."arraymancer".url = "path:../../../a/arraymancer";
  inputs."arraymancer".type = "github";
  inputs."arraymancer".owner = "riinr";
  inputs."arraymancer".repo = "flake-nimble";
  inputs."arraymancer".ref = "flake-pinning";
  inputs."arraymancer".dir = "nimpkgs/a/arraymancer";

  
  inputs."weave".url = "path:../../../w/weave";
  inputs."weave".type = "github";
  inputs."weave".owner = "riinr";
  inputs."weave".repo = "flake-nimble";
  inputs."weave".ref = "flake-pinning";
  inputs."weave".dir = "nimpkgs/w/weave";

  outputs = { self, nixpkgs, src-fftw3-v0_4_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-fftw3-v0_4_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-fftw3-v0_4_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}