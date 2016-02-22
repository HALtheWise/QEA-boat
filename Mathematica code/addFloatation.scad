module boat(){import("Sample Data/bestboatdisplacement.stl",convexity=4);}
module sodacan(){import("Generated boats/sodacan.stl",convexity=1);}
//sodacan();
canDepth=-2.5;
extrudeHeight=6.5;

union(){
    difference() {
        union() {
           boat();

            translate([0,0,-0.3]) 
            linear_extrude(height=extrudeHeight,center=false)
            projection(cut=true) {
                translate([0,0,0.3]) boat();
            }
        }
        translate([7.5,0,0])
            cancut();
        
        translate([-7.5,0,0])
            cancut();
        
    }
    *union(){
    translate([-7.5,0,canDepth])
        can();
    translate([7.5,0,canDepth])
        can();
    }
}

module can() {
    rotate([0,90,0])
    cylinder(/*h=12.2*/h=14 ,r=3.3,center=true,$fn=50);
}

module cancut(){
    linear_extrude(height=100,center=true){
        square([12.5,7],center=true);
    }
}