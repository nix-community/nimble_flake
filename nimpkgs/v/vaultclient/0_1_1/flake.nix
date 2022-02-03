{
  description = ''Hashicorp Vault HTTP Client'';
  inputs.src-vaultclient-0_1_1.flake = false;
  inputs.src-vaultclient-0_1_1.type = "github";
  inputs.src-vaultclient-0_1_1.owner = "jackhftang";
  inputs.src-vaultclient-0_1_1.repo = "vaultclient.nim";
  inputs.src-vaultclient-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-vaultclient-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-vaultclient-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-vaultclient-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}