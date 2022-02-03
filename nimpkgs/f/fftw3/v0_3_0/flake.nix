{
  description = ''Bindings to the FFTW library'';
  inputs.src-fftw3-v0_3_0.flake = false;
  inputs.src-fftw3-v0_3_0.type = "github";
  inputs.src-fftw3-v0_3_0.owner = "SciNim";
  inputs.src-fftw3-v0_3_0.repo = "nimfftw3";
  inputs.src-fftw3-v0_3_0.ref = "refs/tags/v0.3.0";
  
  
  inputs."arraymancer".url = "path:../../../a/arraymancer";
  inputs."arraymancer".type = "github";
  inputs."arraymancer".owner = "riinr";
  inputs."arraymancer".repo = "flake-nimble";
  inputs."arraymancer".ref = "flake-pinning";
  inputs."arraymancer".dir = "nimpkgs/a/arraymancer";

  outputs = { self, nixpkgs, src-fftw3-v0_3_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-fftw3-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-fftw3-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}