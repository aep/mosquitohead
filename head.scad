use <carriage.scad>
use <Round-Anything/polyround.scad>
use <holes.scad>



// material cooling
translate([34,-32,36])
rotate([0,45+90,-90])
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
            x  = 70;
            y  = 30;
            radiiPoints2=[
                [0,  -8+  2*y/3,    0],
                [0,  -8  -y/3,      0],

                [0,    -y,        4],

                [x,  -8  -y,        4],
                [x,  4  -y,        4],


                [x/2,  -14,            10],

                [x/2,   -8+  y/3,            4],
            ];
            polyRoundExtrude(radiiPoints2,8,0,2, resolution);


            translate([25,-18,3])
            m4hole();

            translate([14,0,3])
            m4hole();

            translate([62,-29,3])
            m4hole();

            translate([4.5,-25.5,3])
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





