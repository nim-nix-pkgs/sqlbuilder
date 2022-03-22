{
  description = ''SQL builder'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-sqlbuilder-master.flake = false;
  inputs.src-sqlbuilder-master.owner = "ThomasTJdev";
  inputs.src-sqlbuilder-master.ref   = "master";
  inputs.src-sqlbuilder-master.repo  = "nim_sqlbuilder";
  inputs.src-sqlbuilder-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-sqlbuilder-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-sqlbuilder-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}