(* ::Package:: *)

(* Warning: This does not plot the normal properly yet. *)
showWaterline[region_,normal_,waterHeight_]:=
Module[{graphics,height},
graphics=GraphicsComplex[MeshCoordinates@region,MeshCells[region,2]];
height=waterline[region, normal,waterHeight];
bounds=RegionBounds[region];
Show[Graphics3D[{EdgeForm[],Gray,graphics}],Plot3D[height,{x,bounds[[1,1]],bounds[[1,2]]},{y,bounds[[2,1]],bounds[[2,2]]}]]
]
