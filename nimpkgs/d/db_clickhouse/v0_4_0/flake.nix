{
  description = ''ClickHouse Nim interface'';
  inputs.src-db_clickhouse-v0_4_0.flake = false;
  inputs.src-db_clickhouse-v0_4_0.type = "github";
  inputs.src-db_clickhouse-v0_4_0.owner = "leonardoce";
  inputs.src-db_clickhouse-v0_4_0.repo = "nim-clickhouse";
  inputs.src-db_clickhouse-v0_4_0.ref = "refs/tags/v0.4.0";
  
  outputs = { self, nixpkgs, src-db_clickhouse-v0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-db_clickhouse-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-db_clickhouse-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}