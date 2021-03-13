use <carriage.scad>
use <Round-Anything/polyround.scad>
use <holes.scad>


//use <shroud.scad>
//translate([25,-40.5,72.5])
//rotate([180+45,0,0])
//shroud();



color([0.4,0.4,0.4])
translate([58,-57,30])
rotate([0,-90, 45])
import("50mmTurboFan.stl");

color([0.4,0.4,0.4])
translate([125,-79,138])
rotate([-90,90,0])
import ("RHD_BMG_Mosquito_Fan_Shroud.stl");


// hotend cooling
//translate([0,-50,40])
//rotate([180+45,0,0])
//import("40mmFan.stl");


// carriage (this pre-exists, dont modify)
color([0.99,0.99,0.99])
carriage();


// extruder
translate([11.5,-51,83])
color([0.2,0.99,0.99])
rotate([0,180,0])
import ("lgx.stl");

// hotend
translate([0,-47.5,9])
color([0.2,0.99,0.99])
import("mosquito.stl");



// mount extruder
union() {
color([0.9,0.2,0.2,0.8])  bracket();
mirror([1,0,0])
color([0.9,0.2,0.2,0.8])  bracket();
}




module bracket() {


    translate([30,-5,4])
    rotate([0,-90,0]) {

        difference() {

            resolution = 2;
            x  = 55;
            y  = 30;
            radiiPoints2=[
                [0,  -8+  2*y/3,    0],
                [0,  -8  -y/3,      0],

                [0,    -y,          2],

                [x/2,    -y,        2],

                [x-10, -28  -y,        2],
                [x, -28  -y,        2],
                [x,  4  -y,         2],


                [35,  -14,          10],

                [35,   -8+  y/3,    4],
            ];
            polyRoundExtrude(radiiPoints2,8,0,2, resolution);
            //polyline(radiiPoints2);


            translate([25,-18,3])
            m4hole();

            translate([14,0,3])
            m4hole();

            translate([50,-52,4])
            rotate([0,180,0])
            m4hole();


            translate([4.5,-25.5,4])
            rotate([0,180,0])
            m4hole();
        }
    }


    module backplate_hole() {
        translate([0,0,3])
            rotate([0,180,0])
            m4hole();
    }

    difference() {

        resolution = 2;
        x  = 25;
        y  = 42;
        radiiPoints2=[
            [x,  0,     2],
            [x,  y,     2],
            [0,  y,     2],
            [0,  0,    2],
        ];
            translate([5,-25,0])
                polyRoundExtrude(radiiPoints2,6,0,0, resolution);


            translate([13,11,0])
                backplate_hole();

            translate([-13,11,0])
                backplate_hole();

            translate([-13,-11.5,0])
                backplate_hole();

            translate([13,-11.5,0])
                backplate_hole();
    }
}





