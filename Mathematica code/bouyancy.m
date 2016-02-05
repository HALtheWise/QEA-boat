(* ::Package:: *)

(* ::Section:: *)
(*Figuring out buoyancy*)


(* ::Text:: *)
(*Given a boat hull Region and a height of the waterline, we want to return a volume underwater. This needs to happen efficiently for arbitrary shapes.*)


Needs["Combinatorica`"]


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

nPoints=200000;

(* angle is a unit vector in the direction of the water surface *)
underwaterVolume["random", region_,angle_]:=underwaterVolume["random", region, angle]=(
nangle=Normalize[angle];
pts=Table[nangle.i,{i,myRandomPoint[region,nPoints]}];
sorted = Sort[pts];
table = Transpose[{sorted,Range[nPoints]*(totalVolume[region]/nPoints)}];
{Interpolation[table(* InterpolationOrder \[Rule] 1 (* Uncomment this line if the waterline[] 
function returns erroneous results at the limits of the boat*) *)],{sorted[[1]],sorted[[nPoints]]}}
);

ClearAll[myRandomPoint];
myRandomPoint[region_,nPoints_]:=(myRandomPoint[region,nPoints]=RandomPoint[region,nPoints]);

ClearAll[totalVolume];
(* Caches total volume *)
totalVolume[region_]:=totalVolume[region]=Volume[region];
]


waterline[region_,angle_,desiredVolume_]:=
Module[{func, min, max, d, val},
{func,{min,max}}=underwaterVolume["random", region, angle];
d /. Quiet[FindRoot[func[d]-desiredVolume,
   {d,(min+max)/2}],{InterpolatingFunction::dmval}]
]


testRegion=RegionUnion[CapsuleShape[{{0,0,0},{0,2,1}},1],CapsuleShape[{{0,0.1,0},{0,-1,1}},1]];


DiscretizeRegion[testRegion,Boxed->True]


(*Timing@underwaterVolume["nocache",testRegion,.1]*)
Do[
Print@Timing@underwaterVolume["random",testRegion,{0,0.3,1},i],{i,-2,4,.5}]


{func,{min,max}}=underwaterVolume["random", testRegion,{0,0,1}];
Print@FindRoot[func[d]-4,{d,(min+max)/2}];
Plot[func[d]-4,{d,min-1,max+1}]



(* ::InheritFromParent:: *)
(**)


waterline[testRegion,{0,0,-1},3]


Timing@Volume[testRegion]


Plot[underwaterVolume["random",testRegion,{0,0,1},d],{d,-1,1.9}]



