{
  description = ''SQL builder'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-sqlbuilder-v0_2_0.flake = false;
  inputs.src-sqlbuilder-v0_2_0.owner = "ThomasTJdev";
  inputs.src-sqlbuilder-v0_2_0.ref   = "v0_2_0";
  inputs.src-sqlbuilder-v0_2_0.repo  = "nim_sqlbuilder";
  inputs.src-sqlbuilder-v0_2_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-sqlbuilder-v0_2_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-sqlbuilder-v0_2_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}