module boat(){import("Generated boats/MVPfoam.stl",convexity=4);}
intersection(){
boat();
translate([-25,-10,-6])cube([55,20,5.08]);
    }
   intersection(){
       boat();
  translate([-25,-10,-6+5.08])cube([55,20,5.08]);
    }
    intersection(){
        boat();
translate([-25,-10,-6+(2*5.08)])cube([55,20,5.08]);
    }