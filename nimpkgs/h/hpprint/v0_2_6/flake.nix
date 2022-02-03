{
  description = ''Pretty-printer'';
  inputs.src-hpprint-v0_2_6.flake = false;
  inputs.src-hpprint-v0_2_6.type = "github";
  inputs.src-hpprint-v0_2_6.owner = "haxscramper";
  inputs.src-hpprint-v0_2_6.repo = "hpprint";
  inputs.src-hpprint-v0_2_6.ref = "refs/tags/v0.2.6";
  
  
  inputs."shell".url = "path:../../../s/shell";
  inputs."shell".type = "github";
  inputs."shell".owner = "riinr";
  inputs."shell".repo = "flake-nimble";
  inputs."shell".ref = "flake-pinning";
  inputs."shell".dir = "nimpkgs/s/shell";

  
  inputs."hmisc".url = "path:../../../h/hmisc";
  inputs."hmisc".type = "github";
  inputs."hmisc".owner = "riinr";
  inputs."hmisc".repo = "flake-nimble";
  inputs."hmisc".ref = "flake-pinning";
  inputs."hmisc".dir = "nimpkgs/h/hmisc";

  
  inputs."hdrawing".url = "path:../../../h/hdrawing";
  inputs."hdrawing".type = "github";
  inputs."hdrawing".owner = "riinr";
  inputs."hdrawing".repo = "flake-nimble";
  inputs."hdrawing".ref = "flake-pinning";
  inputs."hdrawing".dir = "nimpkgs/h/hdrawing";

  
  inputs."hasts".url = "path:../../../h/hasts";
  inputs."hasts".type = "github";
  inputs."hasts".owner = "riinr";
  inputs."hasts".repo = "flake-nimble";
  inputs."hasts".ref = "flake-pinning";
  inputs."hasts".dir = "nimpkgs/h/hasts";

  
  inputs."hnimast".url = "path:../../../h/hnimast";
  inputs."hnimast".type = "github";
  inputs."hnimast".owner = "riinr";
  inputs."hnimast".repo = "flake-nimble";
  inputs."hnimast".ref = "flake-pinning";
  inputs."hnimast".dir = "nimpkgs/h/hnimast";

  outputs = { self, nixpkgs, src-hpprint-v0_2_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hpprint-v0_2_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-hpprint-v0_2_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}