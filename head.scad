use <carriage.scad>
use <Round-Anything/polyround.scad>
use <holes.scad>



// material cooling
translate([0,-20,-50])
rotate([45,0,0])
import("50mmTurboFan.stl");


// hotend cooling
translate([0,-50,40])
rotate([180+45,0,0])
import("40mmFan.stl");


// carriage (this pre-exists, dont modify)
color([0.99,0.99,0.99])
carriage();


// extruder, note that the LGX stl has the wrong hotend attached.
translate([11.5,-51,83])
color([0.2,0.99,0.99])
rotate([0,180,0])
import ("lgx.stl");




// mount extruder
color([0.9,0.2,0.2,0.8])  bracket();
mirror([1,0,0])
color([0.9,0.2,0.2,0.8])  bracket();




module bracket() {


    translate([30,-5,4])
    rotate([0,-90,0]) {

        difference() {

            resolution = 2;
            x  = 35;
            y  = 30;
            radiiPoints2=[
                [0,  y/2,     0],
                [0,  -y/2,     0],
                [x,  -y,     4],
                [x,  0,     4],
            ];
            polyRoundExtrude(radiiPoints2,8,0,2, resolution);


            translate([25,-18,3])
            m4hole();

            translate([14,0,3])
            m4hole();
        }
    }


    module backplate_hole() {
        translate([0,0,4])
            rotate([0,180,0])
            m4hole();
    }

    difference() {

        resolution = 2;
        x  = 60/2;
        y  = 55;
        radiiPoints2=[
            [x,  0,     2],
            [x,  y,     2],
            [0,  y,     2],
            [0,  0,    2],
        ];
            translate([0,-72/2,0])
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





