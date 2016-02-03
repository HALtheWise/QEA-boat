(* ::Package:: *)

(* ::Section:: *)
(*Figuring out buoyancy*)


(* ::Text:: *)
(*Given a boat hull Region and a height of the waterline, we want to return a volume underwater. This needs to happen efficiently for arbitrary shapes.*)


ClearAll[underwaterVolume]
Module[{waterHeight,reg},
underwaterVolume["nocache", region_, waterLevel_]:=(
reg:=RegionIntersection[region,HalfSpace[{0,0,-1},waterLevel]];
If[RegionDistance[reg,{0,0,0}]==\[Infinity],0,
NIntegrate[1,{x,y,z}\[Element]reg, PrecisionGoal->2]]
);

(* This is really slow, do not  use *)
underwaterVolume["meshsupport", region_, waterLevel_]:=(
reg:=ImplicitRegion[RegionMember[region,{x,y,z}]&&z<waterLevel,{x,y,z}];
NIntegrate[1,{x,y,z}\[Element]reg, PrecisionGoal->2]
);

underwaterVolume["random", region_, waterLevel_]:=(
nPoints=200000;
pts=myRandomPoint[region,nPoints];
totalVolume[region]*Count[pts,{_,_,z_/;z<waterLevel}]/nPoints
);

ClearAll[myRandomPoint];
myRandomPoint[region_,nPoints_]:=(myRandomPoint[region,nPoints]=RandomPoint[region,nPoints]);

ClearAll[totalVolume];
(* Caches total volume *)
totalVolume[region_]:=totalVolume[region]=Volume[region];
]


testRegion=RegionUnion[CapsuleShape[{{0,0,0},{0,2,1}},1],CapsuleShape[{{0,0.1,0},{0,-1,1}},1]];


DiscretizeRegion[testRegion,Boxed->True]


Timing@underwaterVolume["nocache",testRegion,-10]
Do[
Print@Timing@underwaterVolume["random",testRegion,-10],{i,10}]


Timing@Volume[testRegion]
