(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



underwaterTriangles[boat_,normal_,height_]:=Module[{allTriangles},
allTriangles=MeshPrimitives[region/.boat,2];

Cases[allTriangles,Polygon[{p1_,p2_,p3_}]/;p1.normal<height&&p2.normal<height&&p3.normal<height]
]


underwaterArea[boat_,normal_,height_]:=Module[{},
areas=underwaterTriangles[boat,normal,height]/.Polygon[{p1_,p2_,p3_}]:>Norm[(p1-p2)\[Cross](p3-p2)]/2Quantity[1,(("Centimeters")^2)];
Total[areas]
]


frontalArea[boat_,normal_,height_,flowdir_]:=Module[{},
normflow=Normalize@flowdir;
areas=underwaterTriangles[boat,normal,height]/.Polygon[{p1_,p2_,p3_}]:>-((p1-p2)\[Cross](p3-p2)/2).normflow  Quantity[1,(("Centimeters")^2)];
positiveAreas = Cases[areas,n_/;n>Quantity[0,("Centimeters")^2]];
Total[positiveAreas]
]



