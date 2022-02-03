{
  description = ''OpenDocument Spreadhseet reader'';
  inputs.src-odsreader-master.flake = false;
  inputs.src-odsreader-master.type = "github";
  inputs.src-odsreader-master.owner = "dariolah";
  inputs.src-odsreader-master.repo = "odsreader";
  inputs.src-odsreader-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-odsreader-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-odsreader-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-odsreader-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}