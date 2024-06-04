use <scratchcylinder.scad>
cube_x=50;

module left_roller()
{
difference() {
    roller();
    translate([0,cube_x/2,cube_x/2-1]) 
        cube([cube_x,cube_x,cube_x],true);
    }
}

module right_roller()
{
difference() {
    roller();
    translate([0,-cube_x/2,cube_x/2-1]) 
        cube([cube_x,cube_x,cube_x],true);
    }
}

left_roller();
//right_roller();