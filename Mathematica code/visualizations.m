(* ::Package:: *)

(*showWaterline[region_,normal_,waterHeight_]:=
Module[{graphics,height},
graphics=GraphicsComplex[MeshCoordinates@region,MeshCells[region,2]];
height=waterline[region, normal,waterHeight];
bounds=RegionBounds[region];
Show[Graphics3D[{EdgeForm[],Gray,graphics}],Graphics3D[{Blue,Opacity[0.5],HalfSpace[normal,height]}]]
]*)


showBoat[boat_,waterNormal_]:=
Module[{graphics,height,totalMass},
graphics=GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]];
totalMass=Volume[region/.boat]*.0317+Total[masses/.boat];
height=waterline[region/.boat, waterNormal,totalMass (*Implicit grams\[Rule]cm^3*)];
Show[
 Graphics3D[{Opacity[.7],EdgeForm[],Gray,graphics}],
 Graphics3D[{Blue,Opacity[0.5],HalfSpace[waterNormal,height]}],
 Graphics3D[{Red,PointSize[.05],Point[massPts/.boat]}]
]
]
