use <scratchcylinder.scad>
cube_x = 50;

module left_roller()
{
    difference()
    {

        difference()
        {
            roller();
            translate([ 0, cube_x / 2, cube_x / 2 - 1 ]) cube([ cube_x, cube_x, cube_x ], true);
        }
        latch();
    }
}

module right_roller()
{
    difference()
    {
        difference()
        {
            roller();
            translate([ 0, -cube_x / 2, cube_x / 2 - 1 ]) cube([ cube_x, cube_x, cube_x ], true);
        }
        latch();
    }
}
//left_roller();

//translate([50,0,0])
//right_roller();
// translate([100,0,0])
// {
//     scale([0.98,0.98,0.98]) 
//         latch();
// }
//translate([150,0,0]) 
socked_shell();

//translate([200,0,0]) 
//half_round_shell();
roller();

full_length_joint();