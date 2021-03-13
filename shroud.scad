use <Round-Anything/polyround.scad>
use <holes.scad>


module shroud() {

color([0.4,0.2,0.6])
translate([4,20,32])
rotate([180,-90,90])
import("50mmTurboFan.stl");


l1=57;




color([0.2,0.2,0.6])
// back of hotend
difference() {
union() {
    translate([0,l1-10,11.5])
    rotate([0,180,0])
    cube([40,10.5, 3]);

    translate([0,l1-10,10])
    rotate([0,180,0])
    cube([40,3,10]);

    translate([0,l1-1.9,9.3])
    rotate([-45,180,0])
    cube([40,3,8]);

    translate([0,l1+1.9,6])
    rotate([45,180,0])
    cube([40,3,5.5]);

    translate([0,l1-10,3])
    rotate([0,180,0])
    cube([40,10.5, 3]);

    translate([-40,50,3])
    cube([10, 6,6]);

    translate([-40,55,2])
    rotate([45,0,0])
    cube([10, 6,6]);

}

    translate([-20,64-4,-1])
    rotate([45,0,0])
    cube([5, 20, 10]);

    translate([-30,64-4,-1])
    rotate([45,0,0])
    cube([5, 20, 10]);

}

// main

difference() {
union() {





// bottom

translate([0,10,0])
linear_extrude(4)
square([22,l1-10]);


// top

translate([0,44,26])
linear_extrude(4)
square([22,l1-44+24]);


// front

translate([0,l1,0])
rotate([45,0,0])
linear_extrude(4)
square([20,38]);



// mounted wall

resolution=3;
radiiPoints=[
   [0,     -5,     3],
   [15,    -5,     3],
   [10,    20,     3],
   [30,    44,     3],
   [30,    l1+30,     3],
   [0,     l1,     0],
];
translate([24,0,0])
rotate([0,-90,0])
//polyline(radiiPoints);
difference() {
    polyRoundExtrude(radiiPoints,4,0,0, resolution);
    translate([9,0,2])
    m4hole();
}

// back wall

radiiPoints2=[
   [0,     20,     3],
   [30,    44,     3],
   [30,    l1+30,     3],
   [0,     l1,     0],
];
translate([4,0,0])
rotate([0,-90,0])
//polyline(radiiPoints2);
polyRoundExtrude(radiiPoints2,4,0,0, resolution);


}

//holes
translate([-1,70,10])
rotate([45,0,0])
cube([10,5,10]);

translate([-1,65,5])
rotate([45,0,0])
cube([10,5,10]);


translate([-1,50,3])
cube([10, 6,6]);

translate([-1,55,2])
rotate([45,0,0])
cube([10, 6,6]);

}
}

shroud();
