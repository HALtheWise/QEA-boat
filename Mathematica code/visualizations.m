(* ::Package:: *)

(* ::Code:: *)
(*showWaterline[region_,normal_,waterHeight_]:=*)
(*Module[{graphics,height},*)
(*graphics=GraphicsComplex[MeshCoordinates@region,MeshCells[region,2]];*)
(*height=waterline[region, normal,waterHeight];*)
(*bounds=RegionBounds[region];*)
(*Show[Graphics3D[{EdgeForm[],Gray,graphics}],Graphics3D[{Blue,Opacity[0.5],HalfSpace[normal,height]}]]*)
(*]*)


(* ::Code:: *)
(*Get[FileNameJoin[{NotebookDirectory[],"boats.m"}]]*)
(*Get[FileNameJoin[{NotebookDirectory[],"COM.m"}]]*)
(*Get[FileNameJoin[{NotebookDirectory[],"bouyancy.m"}]]*)


showBoat[boat_,waterNormal_,height_]:=
Module[{mass,graphics},
graphics=GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]];
Show[
 Graphics3D[{Opacity[.5],EdgeForm[],Gray,Rotate[graphics,{waterNormal,{0,0,1}}]}],
 Graphics3D[{Blue,Opacity[0.3],HalfSpace[{0,0,1},height]}],
 Graphics3D[{Red,PointSize[.05],Rotate[Point[massPts/.boat],{waterNormal,{0,0,1}}]}]
]
]


showBoat[boat_,waterNormal_]:=
Module[{mass,graphics,height},
mass=totalMass[boat];
height=waterline[region/.boat, waterNormal,mass (*Implicit grams\[Rule]cm^3*)];
showBoat[boat,waterNormal,height]
]


manipulateBoat[boat_,front_]:=
Module[{data},
data=Table[{\[Theta],[boat,RotationMatrix[\[Theta],front].{0,0,1}]},{\[Theta],0,Pi,Pi/20}];
interp=Interpolation[data];
Manipulate[showBoat[boat,RotationMatrix[\[Theta],front].{0,0,1},interp[\[Theta]]],{\[Theta],0,Pi}]
]


manipulateBoat[scadboat2,{1,0,0}]
