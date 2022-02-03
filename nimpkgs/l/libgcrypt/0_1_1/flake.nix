{
  description = ''libgcrypt wrapper'';
  inputs.src-libgcrypt-0_1_1.flake = false;
  inputs.src-libgcrypt-0_1_1.type = "github";
  inputs.src-libgcrypt-0_1_1.owner = "FedericoCeratto";
  inputs.src-libgcrypt-0_1_1.repo = "nim-libgcrypt";
  inputs.src-libgcrypt-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-libgcrypt-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-libgcrypt-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-libgcrypt-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}