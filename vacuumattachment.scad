// vacuumattachment.scad
// Vacuum Attachment for Bosch Power Tools
// 
// Copyright (C) 2013 Christopher Roberts
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


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
