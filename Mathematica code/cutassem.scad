module bottom(){import("CutFiles/bottom.stl");}
module middle(){import("CutFiles/middle.stl");}
module top(){import("CutFiles/top.stl");}
scale(1/2.54){
translate([24,8,-(1-0.08)])rotate([180,0,0])bottom();
translate([24,25,5.08-(1-0.08)])rotate([180,0,0])middle();
translate([24,42,(5.08*2)-(1-0.08)-13.34])rotate([0,0,0])top();
}