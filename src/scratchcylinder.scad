use <modules.scad>
use <util-func.scad>
// use <definition.scad>
$fn = 100;

spike_hight = 3;
roller_r = 10;
// 外壳要比滚轮大，露出垂直方向完整的齿
shell_thick = 1.5;

spike_bottom_radius = 1.2;
shell_inner_radius = roller_r + spike_hight + 0.3;
shell_outer_radius = roller_r + spike_hight + shell_thick + 0.3;
roller_l = 20 * (sin(60) * spike_bottom_radius * 2) + 2 * spike_bottom_radius;
joint_hight = spike_bottom_radius * 2;
joint_radius = 5;
layer = 20;
// single_spike(spike_hight, spike_bottom_radius);
// number of spike per layer
//     echo(num);
//

module round_shell()
{
    // shell
    difference()
    {
        difference()
        {
            translate([ 0, 0, 0.1 ])
            {
                cylinder(roller_l + 2 * (joint_hight - 0.1), shell_inner_radius + shell_thick,
                         shell_inner_radius + shell_thick);
            }
            translate([ 0, 0, (joint_hight) / 2 ])
                cylinder(roller_l + joint_hight, shell_inner_radius, shell_inner_radius);
        }

        translate([ 0, spike_hight + roller_r, roller_l / 2 + joint_hight ])
            cube([ shell_inner_radius * 2, spike_hight * 2, roller_l + 2 * joint_hight + 2 ], true);
    }
}

module half_round_shell()
{
    // difference()
    {// shell
     difference(){difference(){translate([ 0, 0, 0 ]){
         cylinder(roller_l + 2 * (joint_hight), shell_inner_radius + shell_thick, shell_inner_radius + shell_thick);
}
translate([ 0, 0, (joint_hight) / 2 ]) cylinder(roller_l + joint_hight, shell_inner_radius, shell_inner_radius);
}

translate([ 0, shell_outer_radius / 2, roller_l / 2 + joint_hight ])
    cube([ shell_outer_radius * 2, shell_outer_radius, roller_l + 2 * joint_hight + 2 ], true);
}
difference()
{
    translate([ 0, roller_r / 2, roller_l / 2 + joint_hight ])
        cube([ shell_outer_radius * 2, roller_r, roller_l + 2 * joint_hight ], true);
    translate([ 0, shell_outer_radius / 2, roller_l / 2 + joint_hight ]) cube(
        [
            (shell_outer_radius - shell_thick) * 2, shell_outer_radius + 4,
            roller_l + 2 * joint_hight - 2 * shell_thick + 0.6
        ],
        true);
}
}
;
}
module slide()
{
    hull() polyhedron([[joint_radius, 0, joint_hight - 0.4],                               // 0
                       [-joint_radius, 0, joint_hight - 0.4],                              // 1
                       [joint_radius, roller_r + spike_bottom_radius, joint_hight - 0.4],  // 2
                       [-joint_radius, roller_r + spike_bottom_radius, joint_hight - 0.4], // 3
                       [joint_radius, roller_r + spike_bottom_radius, 0],                  // 4
                       [-joint_radius, roller_r + spike_bottom_radius, 0]],                // 5
                      [ [ 0, 2, 4 ], [ 1, 3, 4 ], [ 0, 1, 3, 2 ], [ 0, 1, 5, 4 ], [ 2, 4, 5, 3 ] ]);
}
module socked_shell()
{
    difference()
    {
        difference()
        {
            half_round_shell();
            translate([ 0, 0, 0.4 ]) joint(joint_radius + 0.2, joint_hight * 2 + roller_l - 0.8);
        };
        union()
        {
            // bottom slide
            slide();
            translate([ 0, 0, roller_l + 2 * joint_hight ])
            {
                rotate([ 0, 180, 0 ]) slide();
            }
        }
    }
}
// cylinder(roller_l, roller_r,roller_r);
// translate([0,0,spike_bottom_radius])
//     sigle_spike_ring();

module roller()
{
    union()
    {
        // joint(joint_radius, joint_hight);
        // translate([0,0,roller_l+2*spike_bottom_radius])
        //     joint(joint_radius, joint_hight);
        translate([ 0, 0, 0.5 ]) joint(joint_radius, (joint_hight - 0.5) * 2 + roller_l);
        translate([ 0, 0, 2 * spike_bottom_radius ]) cylinder(roller_l, roller_r, roller_r);
        translate([ 0, 0, 2 * spike_bottom_radius ]) piller_of_spike(layer, roller_r, spike_hight, spike_bottom_radius);
    }
}

module latch()
{
    translate([ 0, 0, roller_l / 2 + joint_hight ]) cube(joint_radius * 2, true);
}

// socked_shell();
// shell();
// roller();
// slide();

// latch();