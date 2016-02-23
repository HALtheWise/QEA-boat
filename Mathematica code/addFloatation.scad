module boat(){import("Sample Data/bestboatdisplacement.stl",convexity=4);}
module sodacan(){import("Generated boats/sodacan.stl",convexity=1);}
//sodacan();
canDepth=-2.5;
extrudeHeight=6.8;
makeCutFile=false;
useNiceCan=false;
includeText=false;

makeCanPlugs=true;

if(makeCanPlugs){
    difference(){
        translate([0,0,1.6]){
            intersection(){
                boat();
                translate([7.5,0,0])
                    cancut();
            }
            intersection(){
                boat();
                translate([-7.5,0,0])
                    cancut();
            }
        }
        translate([-50,-50]) cube(100);
    }
}

if(!makeCanPlugs)
union(){
    difference() {
        union() {
           boat();

            translate([0,0,-0.4]) 
            linear_extrude(height=extrudeHeight,center=false)
            projection() {
                translate([0,0,0.3]) boat();
            }
        }
        translate([7.5,0,0])
            cancut();
        
        translate([-7.5,0,0])
            cancut();
        if(makeCutFile){
            translate([0,0,10])cylinder(h=11,d=1,$fn=20,center=true);
            translate([0,0,extrudeHeight-0.4])
            cylinder(h=1000,d=3,center=false,$fn=20);
        }
        
        translate([0,0,extrudeHeight-1])
        if (includeText)
        linear_extrude(1){
            names();
        }
    }
    union(){
    translate([-7.5,0,canDepth])
        can();
    translate([7.5,0,canDepth])
        can();
    }
}

module names() {
    scale([1.3,.5])
        translate([-7,8])
            text("Eric",6,"Comic Sans MS");
    
    rotate([0,0,180])
    scale([1.1,.4])
        translate([-12,10])
            text("Jared",6,"Comic Sans MS");
}


module can() {
    if (!makeCutFile){
        if (useNiceCan) 
            rotate([0,0,90])
            sodacan();            
        else
            rotate([0,90,0])
            cylinder(/*h=12.2*/h=14 ,r=3.3,center=true,$fn=50);
    }
}

module cancut(){
    linear_extrude(height=100,center=true){
        square([12.5,7],center=true);
    }
}