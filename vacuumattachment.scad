// vacuumattachment.scad
// Vacuum Attachment for Bosch Power Tools
// 
// Copyright 2013 Christopher Roberts

// Global Parameters
outer_diameter_max = 31.8; // Vacuum cleaner end goes into this
outer_diameter_min = 31.2;
inner_diameter_min = 30.2; // End goes onto tool end
inner_diameter_max = 30.8;
length             = 70;
thickness          = 3;
precision          = 60;

module innerattachment() {

    difference() {

        // Things that exist
        union() {
            cylinder( h = length/3, r1 = inner_diameter_min/2 + thickness, r2 = inner_diameter_max/2 + thickness, $fs = 6, $fn = precision, center = false );
        }

        // Things to be cut out
        union() {
            cylinder( h = length/3, r1 = inner_diameter_min/2, r2 = inner_diameter_max/2, $fs = 6, $fn = precision, center = false );
        }
    }

}

module midattachment() {

    difference() {

        // Things that exist
        union() {
            cylinder( h = length/3, r1 = outer_diameter_min/2 + thickness, r2 = inner_diameter_min/2 + thickness, $fs = 6, $fn = precision, center = false );
        }

        // Things to be cut out
        union() {
            cylinder( h = length/3, r1 = outer_diameter_min/2, r2 = inner_diameter_min/2, $fs = 6, $fn = precision, center = false );
        }
    }

}

module outerattachment() {

    difference() {

        // Things that exist
        union() {
            cylinder( h = length/3, r1 = outer_diameter_max/2 + thickness, r2 = outer_diameter_min/2 + thickness, $fs = 6, $fn = precision, center = false );
        }

        // Things to be cut out
        union() {
            cylinder( h = length/3, r1 = outer_diameter_max/2, r2 = outer_diameter_min/2, $fs = 6, $fn = precision, center = false );
        }
    }

}

module vacuumattachment() {
    union() {
        outerattachment();
        translate( v = [0, 0, length/3 - 0.01]) midattachment();
        translate( v = [0, 0, length/3*2 - 0.02]) innerattachment();
    }
}

vacuumattachment();
