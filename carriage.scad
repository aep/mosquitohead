module rod() {
    color([0.9,0.99,0.99])
    translate([0,-25,-11])
    rotate([0,90,0])
    cylinder(h=250, d=8,center=true);
}


module carriage() {
    translate([-28.5,-37,0])
    rotate([0,180,180])
    import("X-Carriage.stl", center=true);
    rod();
    translate([0,50,0])
    rod();
}
