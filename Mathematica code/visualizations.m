(* ::Package:: *)

(*showWaterline[region_,normal_,waterHeight_]:=
Module[{graphics,height},
graphics=GraphicsComplex[MeshCoordinates@region,MeshCells[region,2]];
height=waterline[region, normal,waterHeight];
bounds=RegionBounds[region];
Show[Graphics3D[{EdgeForm[],Gray,graphics}],Graphics3D[{Blue,Opacity[0.5],HalfSpace[normal,height]}]]
]*)


(* ::Code:: *)
(*Get[FileNameJoin[{NotebookDirectory[],"boats.m"}]]*)
(*Get[FileNameJoin[{NotebookDirectory[],"COM.m"}]]*)


showBoat[boat_,waterNormal_]:=
Module[{mass},
graphics=GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]];
mass=totalMass[boat];
height=waterline[region/.boat, waterNormal,totalMass (*Implicit grams\[Rule]cm^3*)];
Show[
 Graphics3D[{Opacity[.7],EdgeForm[],Gray,graphics}],
 Graphics3D[{Blue,Opacity[0.5],HalfSpace[waterNormal,height]}],
 Graphics3D[{Red,PointSize[.05],Point[massPts/.boat]}]
]
]


(* ::Code:: *)
(*showBoat[boat,{0,0,1}]*)



