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



SetDirectory[NotebookDirectory[]]


boat:=boat = <|
name -> "Crapboat",
massPts (*  *)-> {{0,0,0}},
masses -> {100},
front -> {0,1,0},
region ->  Import["Sample Data/crapboat.stl","BoundaryMeshRegion"],
graphics :> Show[Graphics3D[{EdgeForm[],Gray,GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]]}],Graphics3D[{Red,PointSize[4],Graphics3D@Point[massPts/.boat]}]]
|>;


spaceboat:=spaceboat=<|
name -> "Spaceboat",
massPts (*mast,can1,can2,centered around mast  *)-> {{0,0,26},{0,9.2,2},{0,-9.2,2}},
masses -> {96.2,364,364},
front -> {1,0,0},
region ->  Import["Sample Data/spaceboatscaled.stl","BoundaryMeshRegion"],
graphics :> Show[Graphics3D[{EdgeForm[],Gray,GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]]}],Graphics3D[{Red,PointSize[4],Graphics3D@Point[massPts/.boat]}]]
|>;



bestboat:=bestboat=<|
name -> "Bestboat",
massPts (*mast,can1,can2,ballast1,ballast2 *)-> {{0,0,5},{7,0,-3},{-7,0,-3},{-4,0,-6},{4,0,-6}},
masses -> {96.2,364,364,100,100},
front -> {1,0,0},
region ->  Import["Sample Data/bestboatdisplacement.stl","BoundaryMeshRegion"],
graphics :> Show[Graphics3D[{EdgeForm[],Gray,GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]]}],Graphics3D[{Red,PointSize[4],Graphics3D@Point[massPts/.boat]}]]
|>;


besterboat:=besterboat=<|
name -> "besterboat",
massPts (*mast,can1,can2,centered around mast  *)-> {{0,0,20},{7,0,0},{-7,0,0}},
masses -> {96.2,364,364},
front -> {1,0,0},
region ->  Import["Sample Data/besterboat10tall5deg.stl","BoundaryMeshRegion"],
graphics :> Show[Graphics3D[{EdgeForm[],Gray,GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]]}],Graphics3D[{Red,PointSize[4],Graphics3D@Point[massPts/.boat]}]]
|>;


besterestiesterestboat:=besterestiesterestboat=<|
name -> "Besterestiesterestboat",
massPts (*mast,can1,can2,ballast1,ballast2,ballast3  *)-> {{0,0,19},{-7.5,0,-4.1},{7.5,0,-4.5}, {3,0,-9.5},{0,0,-9.5},{-3,0,-9.5}},
masses -> {96.2,364,364,100,100,100},
front -> {1,0,0},
region ->  Import["Sample Data/besterestiesterestboatdisplacement.stl","BoundaryMeshRegion"],
graphics :> Show[Graphics3D[{EdgeForm[],Gray,GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]]}],Graphics3D[{Red,PointSize[4],Graphics3D@Point[massPts/.boat]}]]
|>;


scadboat1:=scadboat1=<|
name -> "Bescadboat",
massPts (*mast,can1,can2,ballast1,ballast2,ballast3  *)-> {{0,0,19},{-7.5,0,-2.5},{7.5,0,-2.5}(*, {3,0,-9.5},{0,0,-9.5},{-3,0,-9.5}*)},
masses -> {96.2,364,364(*,100,100,100*)},
front -> {1,0,0},
region ->  Import["Generated boats/addFloatationpi.stl","BoundaryMeshRegion"],
graphics :> Show[Graphics3D[{EdgeForm[],Gray,GraphicsComplex[MeshCoordinates@region/.boat,MeshCells[region/.boat,2]]}],Graphics3D[{Red,PointSize[4],Graphics3D@Point[massPts/.boat]}]]
|>;
