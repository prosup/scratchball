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
// left_roller();
right_roller();
latch();