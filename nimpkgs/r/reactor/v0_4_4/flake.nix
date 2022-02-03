{
  description = ''Asynchronous networking engine for Nim'';
  inputs.src-reactor-v0_4_4.flake = false;
  inputs.src-reactor-v0_4_4.type = "github";
  inputs.src-reactor-v0_4_4.owner = "zielmicha";
  inputs.src-reactor-v0_4_4.repo = "reactor.nim";
  inputs.src-reactor-v0_4_4.ref = "refs/tags/v0.4.4";
  
  
  inputs."collections".url = "path:../../../c/collections";
  inputs."collections".type = "github";
  inputs."collections".owner = "riinr";
  inputs."collections".repo = "flake-nimble";
  inputs."collections".ref = "flake-pinning";
  inputs."collections".dir = "nimpkgs/c/collections";

  outputs = { self, nixpkgs, src-reactor-v0_4_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-reactor-v0_4_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-reactor-v0_4_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}