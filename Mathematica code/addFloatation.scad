module boat(){import("Sample Data/bestboatdisplacement.stl");}

union() {
    
    boat();

    linear_extrude(height=4,center=false)
    projection(cut=true) {
        translate([0,0,0.2]) boat();
    }
}