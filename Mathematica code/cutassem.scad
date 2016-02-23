module bottom(){import("CutFiles/bottom.stl");}
module middle(){import("CutFiles/middle.stl");}
module top(){import("CutFiles/top.stl");}
module plugs(){import("CutFiles/patches.stl");}

abit = .0001;

scale(1/2.54+abit){
    translate([24,8,-(1-0.08)])rotate([180,0,0])bottom();
    translate([24,25,5.08-(1-0.08)])rotate([180,0,0])middle();
    translate([24,42,(5.08*2)-(1-0.08)-13.34])rotate([0,0,0])top();
    translate([24,55,0])rotate([180,0,0])plugs();
    translate([24,65,0])rotate([180,0,0])plugs();
}