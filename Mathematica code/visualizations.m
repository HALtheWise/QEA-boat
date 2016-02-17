(* ::Package:: *)

showWaterline[region_,normal_,waterHeight_]:=
Module[{graphics,height},
graphics=GraphicsComplex[MeshCoordinates@region,MeshCells[region,2]];
height=waterline[region, normal,waterHeight];
bounds=RegionBounds[region];
Show[Graphics3D[{EdgeForm[],Gray,graphics}],Graphics3D[{Blue,Opacity[0.5],HalfSpace[normal,height]}]]
]
